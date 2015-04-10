#import "BSINote.h"
#import "BSIBook.h"

@interface BSINote ()

// Private interface goes here.

@end

@implementation BSINote

+(NSArray *) observableKeys{
    
    return @[BSINoteAttributes.name, BSINoteAttributes.text, @"image.imageData"];
    
}

+(instancetype) noteWithname:(NSString *) name
                        text:(NSString *) text
                       image:(BSIPhoto *) image
                        book:(BSIBook *) book
                     context:(NSManagedObjectContext *) context{
    
    BSINote *n =[self insertInManagedObjectContext:context];
    n.name =name;
    n.text= text;
    n.image = image;
    n.book = book;
    n.creationDate = [NSDate date];
    n.modificationDate = [NSDate date];
    
    return n;
    
    
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    
    self.modificationDate = [NSDate date];
    
}

@end
