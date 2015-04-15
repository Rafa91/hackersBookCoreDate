#import "BSITag.h"

@interface BSITag ()

// Private interface goes here.

@end

@implementation BSITag

+(instancetype) tagWithName:(NSString *)name
                    context:(NSManagedObjectContext *)context{
    
    BSITag *t = [self insertInManagedObjectContext:context];
    t.name = name;
    return t;
    
}


@end
