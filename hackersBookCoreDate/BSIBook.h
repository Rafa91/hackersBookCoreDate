#import "_BSIBook.h"


@interface BSIBook : _BSIBook {}

+(instancetype) bookWithTitle:(NSString *) title
                 frontPageURL:(NSString *) frontPageURL
                       pdfURL:(NSString *) pdfURL
                   isFavorite:(BOOL) isFavorite
                         tags:(NSSet *)tags
                      authors:(NSSet *)author
                      context:(NSManagedObjectContext *) context;

@end
