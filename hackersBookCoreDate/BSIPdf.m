#import "BSIPdf.h"
#import "BSIBook.h"

@interface BSIPdf ()

// Private interface goes here.

@end

@implementation BSIPdf

+(instancetype) pdfWithData:(NSData *) pdfData
                       book:(BSIBook *)book
                    context:(NSManagedObjectContext *)context{
    
    BSIPdf *p =[self insertInManagedObjectContext:context];
    p.pdfData = pdfData;
    p.book = book;
    
    return p;
    
}

@end
