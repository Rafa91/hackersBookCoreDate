#import "_BSIAuthor.h"

@interface BSIAuthor : _BSIAuthor {}

+(instancetype) authorWithName:(NSString *) name
                       context:(NSManagedObjectContext *) context;

@end
