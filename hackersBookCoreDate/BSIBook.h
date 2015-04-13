#import "_BSIBook.h"


@interface BSIBook : _BSIBook {}

+(instancetype) bookWithTitle:(NSString *) title
                 frontPageURL:(NSString *) frontPageURL
                       pdfURL:(NSString *) pdfURL
                   isFavorite:(BOOL) isFavorite
                         tags:(NSSet *)tags
                      authors:(NSSet *)author
                      context:(NSManagedObjectContext *) context;


+(instancetype) bookWithDictionary: (NSDictionary *) dict
                           context:(NSManagedObjectContext *) context;

+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI
                                            context:(NSManagedObjectContext *) context;

-(void) setWithDictionary:(NSDictionary *) dict;

-(void) updateImage;

-(NSData*) archiveURIRepresentation;

-(NSString *) tagsDescription;

-(NSString *) authorDescription;


@end
