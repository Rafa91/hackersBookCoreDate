#import "_BSITag.h"

@interface BSITag : _BSITag {}

+(instancetype) tagWithName:(NSString *)name
                    context:(NSManagedObjectContext *)context;

@end
