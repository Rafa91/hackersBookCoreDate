// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSILocation.h instead.

@import CoreData;
#import "BSIHackersBookBaseClass.h"

extern const struct BSILocationAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
} BSILocationAttributes;

extern const struct BSILocationRelationships {
	__unsafe_unretained NSString *notes;
} BSILocationRelationships;

@class BSINote;

@interface BSILocationID : NSManagedObjectID {}
@end

@interface _BSILocation : BSIHackersBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BSILocationID* objectID;

@property (nonatomic, strong) NSString* address;

//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* latitude;

@property (atomic) double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* longitude;

@property (atomic) double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) BSINote *notes;

//- (BOOL)validateNotes:(id*)value_ error:(NSError**)error_;

@end

@interface _BSILocation (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;

- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;

- (BSINote*)primitiveNotes;
- (void)setPrimitiveNotes:(BSINote*)value;

@end
