#import "BSIAuthor.h"

@interface BSIAuthor ()

// Private interface goes here.

@end

@implementation BSIAuthor

+(instancetype) authorWithName:(NSString *) name
                       context:(NSManagedObjectContext *) context{
    
    BSIAuthor *a=[self insertInManagedObjectContext:context];
    
    a.name = name;
    
    return a;
    
}

@end
