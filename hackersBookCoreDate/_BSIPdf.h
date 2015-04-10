// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSIPdf.h instead.

@import CoreData;
#import "BSIHackersBookBaseClass.h"

extern const struct BSIPdfAttributes {
	__unsafe_unretained NSString *pdfData;
} BSIPdfAttributes;

extern const struct BSIPdfRelationships {
	__unsafe_unretained NSString *book;
} BSIPdfRelationships;

@class BSIBook;

@interface BSIPdfID : NSManagedObjectID {}
@end

@interface _BSIPdf : BSIHackersBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BSIPdfID* objectID;

@property (nonatomic, strong) NSData* pdfData;

//- (BOOL)validatePdfData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) BSIBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _BSIPdf (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (BSIBook*)primitiveBook;
- (void)setPrimitiveBook:(BSIBook*)value;

@end
