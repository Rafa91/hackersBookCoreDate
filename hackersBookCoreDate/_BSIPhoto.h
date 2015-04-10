// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSIPhoto.h instead.

@import CoreData;
#import "BSIHackersBookBaseClass.h"

extern const struct BSIPhotoAttributes {
	__unsafe_unretained NSString *imageData;
} BSIPhotoAttributes;

extern const struct BSIPhotoRelationships {
	__unsafe_unretained NSString *frontPage;
	__unsafe_unretained NSString *noteImage;
} BSIPhotoRelationships;

@class BSIBook;
@class BSINote;

@interface BSIPhotoID : NSManagedObjectID {}
@end

@interface _BSIPhoto : BSIHackersBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BSIPhotoID* objectID;

@property (nonatomic, strong) NSData* imageData;

//- (BOOL)validateImageData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) BSIBook *frontPage;

//- (BOOL)validateFrontPage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) BSINote *noteImage;

//- (BOOL)validateNoteImage:(id*)value_ error:(NSError**)error_;

@end

@interface _BSIPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;

- (BSIBook*)primitiveFrontPage;
- (void)setPrimitiveFrontPage:(BSIBook*)value;

- (BSINote*)primitiveNoteImage;
- (void)setPrimitiveNoteImage:(BSINote*)value;

@end
