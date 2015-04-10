#import "_BSIPdf.h"
@class BSIBook;


@interface BSIPdf : _BSIPdf {}

+(instancetype) pdfWithData:(NSData *) pdfData
                       book:(BSIBook *)book
                    context:(NSManagedObjectContext *)context;

@end
