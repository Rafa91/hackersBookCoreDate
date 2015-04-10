// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSINote.h instead.

@import CoreData;
#import "BSIHackersBookBaseClass.h"

extern const struct BSINoteAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *text;
} BSINoteAttributes;

extern const struct BSINoteRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *image;
} BSINoteRelationships;

@class BSIBook;
@class BSIPhoto;

@interface BSINoteID : NSManagedObjectID {}
@end

@interface _BSINote : BSIHackersBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BSINoteID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) BSIBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) BSIPhoto *image;

//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;

@end

@interface _BSINote (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (BSIBook*)primitiveBook;
- (void)setPrimitiveBook:(BSIBook*)value;

- (BSIPhoto*)primitiveImage;
- (void)setPrimitiveImage:(BSIPhoto*)value;

@end
