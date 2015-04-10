// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSITag.h instead.

@import CoreData;
#import "BSIHackersBookBaseClass.h"

extern const struct BSITagAttributes {
	__unsafe_unretained NSString *name;
} BSITagAttributes;

extern const struct BSITagRelationships {
	__unsafe_unretained NSString *books;
} BSITagRelationships;

@class BSIBook;

@interface BSITagID : NSManagedObjectID {}
@end

@interface _BSITag : BSIHackersBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BSITagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _BSITag (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(BSIBook*)value_;
- (void)removeBooksObject:(BSIBook*)value_;

@end

@interface _BSITag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
