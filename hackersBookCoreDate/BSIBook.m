#import "BSIBook.h"
#import "BSIPhoto.h"
#import "BSIAuthor.h"
#import "BSITag.h"
#import "BSIPdf.h"
#import "Settings.h"

@interface BSIBook ()

-(void) authorsFromJSON:(NSString *) stringJSON
                   context:(NSManagedObjectContext *)context;

@end

@implementation BSIBook
#pragma mark - class methods
+(NSArray *)observableKeys{
    
    return @[BSIBookAttributes.isFavorite, BSIBookRelationships.notes];
    
}

+(instancetype) bookWithTitle:(NSString *) title
                 frontPageURL:(NSString *) frontPageURL
                       pdfURL:(NSString *) pdfURL
                   isFavorite:(BOOL) isFavorite
                         tags:(NSSet *)tags
                      authors:(NSSet *)author
                      context:(NSManagedObjectContext *) context{
    
    BSIBook *b = [self insertInManagedObjectContext:context];
    
    b.titleBook = title;
    b.creationDate = [NSDate date];
    b.modificationDate = [NSDate date];
    b.frontPageURL = frontPageURL;
    b.pdfURL = pdfURL;
    [b setIsFavoriteValue:isFavorite];
    b.tags =tags;
    b.authors = author;
    b.frontPage = [BSIPhoto insertInManagedObjectContext:context];
    
    return b;
    
}

+(instancetype) bookWithDictionary: (NSDictionary *) dict
                      context:(NSManagedObjectContext *) context{
    
    BSIBook *b = [BSIBook bookWithTitle:[dict objectForKey:TITLE]
                           frontPageURL:[dict objectForKey:IMAGE_URL]
                                 pdfURL:[dict objectForKey:PDF_URL]
                             isFavorite:NO
                                   tags:nil
                                authors:nil
                                context:context];
    
    return b;
    
}

// Tries to recover the object from the archived URI representation (that probably
// comes from some NSUserDefaults). If the object doesn't exist anymore, returns
// nil.
+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI
                                            context:(NSManagedObjectContext *) context{
    
    NSURL *uri = [NSKeyedUnarchiver unarchiveObjectWithData:archivedURI];
    if (uri == nil) {
        return nil;
    }
    
    
    NSManagedObjectID *nid = [context.persistentStoreCoordinator
                              managedObjectIDForURIRepresentation:uri];
    if (nid == nil) {
        return nil;
    }
    
    
    NSManagedObject *ob = [context objectWithID:nid];
    if (ob.isFault) {
        // Got it!
        return (BSIBook*)ob;
    }else{
        // Might not exist anymore. Let's fetch it!
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:ob.entity.name];
        req.predicate = [NSPredicate predicateWithFormat:@"SELF = %@", ob];
        
        NSError *error;
        NSArray *res = [context executeFetchRequest:req
                                              error:&error];
        if (res == nil) {
            return nil;
        }else{
            return [res lastObject];
        }
    }
    
    
}

#pragma mark - set properties

-(void) setWithDictionary:(NSDictionary *) dict{
    
    [self authorsFromJSON:[dict objectForKey:AUTHORS]
                                   context:self.managedObjectContext];
    
    [self tagsFromJSON:[dict objectForKey:TAGS]
                             context:self.managedObjectContext];
    
}

-(void) updateImage{
    
    //nos vamos a segundo plano a descargar la imagen
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        NSURL *jsonURL = [NSURL URLWithString:self.frontPageURL];
        NSData *data = [NSData dataWithContentsOfURL:jsonURL];
        //cuando la tengo, me voy a primer plano
        dispatch_async(dispatch_get_main_queue(), ^{
            //introduzco en core data lo que me descargo
            BSIPhoto *p = [BSIPhoto insertInManagedObjectContext:self.managedObjectContext];
            p.imageData = data;
            self.frontPage = p;
        });
        
    });

    
}

-(void) updatePdf{
    
    //nos vamos a segundo plano a descargar la imagen
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        NSURL *jsonURL = [NSURL URLWithString:self.pdfURL];
        NSData *data = [NSData dataWithContentsOfURL:jsonURL];
        //cuando la tengo, me voy a primer plano
        dispatch_async(dispatch_get_main_queue(), ^{
            //introduzco en core data lo que me descargo
            BSIPdf *p= [BSIPdf insertInManagedObjectContext:self.managedObjectContext];
            p.pdfData = data;
            self.pdf = p;
        });
        
    });
    
    
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    
    self.modificationDate = [NSDate date];
    
}

#pragma mark - methods for parsing

-(void) tagsFromJSON:(NSString *) stringJSON
                context:(NSManagedObjectContext *)context{
    
    
    //saco cada uno de los tags
    NSArray *tags = [stringJSON componentsSeparatedByString:@", "];
    
    //por cada uno, busco si ya existe
    for (NSString *name in tags) {
        
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[BSITag entityName]];
        req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:BSITagAttributes.name
                                                              ascending:YES
                                                               selector:@selector(caseInsensitiveCompare:)]];
        req.fetchBatchSize = 20;
        req.predicate= [NSPredicate predicateWithFormat:@"name = %@",name];
        NSError *error;
        NSArray *result = [self.managedObjectContext executeFetchRequest:req
                                                                   error:&error];
        if ([result count] != 0 ) {
            [self addTagsObject:[result lastObject]];
        }else{
            [self addTagsObject:[BSITag tagWithName:name
                                            context:context]];
        }
    }
    
}

-(void) authorsFromJSON:(NSString *) stringJSON
                   context:(NSManagedObjectContext *)context{
    
    //saco cada uno de los tags
    NSArray *authors = [stringJSON componentsSeparatedByString:@", "];
    
    //por cada uno, busco si ya existe
    for (NSString *name in authors) {
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[BSIAuthor entityName]];
        req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:BSIAuthorAttributes.name
                                                              ascending:YES
                                                               selector:@selector(caseInsensitiveCompare:)]];
        req.fetchBatchSize = 20;
        req.predicate= [NSPredicate predicateWithFormat:@"name = %@",name];
        NSError *error;
        NSArray *result = [self.managedObjectContext executeFetchRequest:req
                                                                   error:&error];
        if ([result count] != 0 ) {
            [self addAuthorsObject:[result lastObject]];
        }else{
            [self addAuthorsObject:[BSIAuthor authorWithName:name
                                                     context:context]];
        }
    }
    
}

#pragma mark - methods for last object

// Returns an NSData with the serialized URI representation of the
// objectID. Ready to save it in a NSUserDefaults, for example.
-(NSData*) archiveURIRepresentation{
    
    NSURL *uri = self.objectID.URIRepresentation;
    return [NSKeyedArchiver archivedDataWithRootObject:uri];
}

#pragma mark - utils

-(NSString *) tagsDescription{
    
    NSString *aux=@"";
    NSArray *array = [self.tags allObjects];
    if ([self.tags count]== 1) {
        return [NSString stringWithFormat:@"%@", [[array objectAtIndex:0] name]];
    }else{
        for (int i=0; i<[array count] ; i++) {
            if (i == 0) {
                aux = [NSString stringWithFormat:@"%@", [[array objectAtIndex:i] name]];
            }else{
                aux = [NSString stringWithFormat:@"%@,%@", [[array objectAtIndex:i] name], aux];
            }
        }
        return aux;
    }
    
}

-(NSString *)authorDescription{
    NSArray *array = [self.authors allObjects];
    NSString *aux=@"";
    if ([array count]== 1) {
        return [NSString stringWithFormat:@"%@", [[array objectAtIndex:0] name]];
    }else{
        for (int i=0; i<[array count] ; i++) {
            if (i == 0) {
                aux = [NSString stringWithFormat:@"%@", [[array objectAtIndex:i] name]];
            }else{
                aux = [NSString stringWithFormat:@"%@,%@", [[array objectAtIndex:i] name] , aux];
            }
        }
        return aux;
    }
    
}

@end
