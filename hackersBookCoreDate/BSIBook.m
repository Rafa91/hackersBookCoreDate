#import "BSIBook.h"
#import "BSIPhoto.h"

@interface BSIBook ()

// Private interface goes here.

@end

@implementation BSIBook

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

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    
    self.modificationDate = [NSDate date];
    
}

@end
