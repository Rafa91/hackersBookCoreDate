#import "_BSINote.h"
@class BSIBook;


@interface BSINote : _BSINote {}

@property (nonatomic, readonly) BOOL hasLocation;

+(instancetype) noteWithname:(NSString *) name
                        text:(NSString *) text
                       image:(BSIPhoto *) image
                        book:(BSIBook *) book
                     context:(NSManagedObjectContext *) context;

@end
