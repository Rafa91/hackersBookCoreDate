// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSIAuthor.h instead.

@import CoreData;
#import "BSIHackersBookBaseClass.h"

extern const struct BSIAuthorAttributes {
	__unsafe_unretained NSString *name;
} BSIAuthorAttributes;

extern const struct BSIAuthorRelationships {
	__unsafe_unretained NSString *books;
} BSIAuthorRelationships;

@class BSIBook;

@interface BSIAuthorID : NSManagedObjectID {}
@end

@interface _BSIAuthor : BSIHackersBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BSIAuthorID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _BSIAuthor (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(BSIBook*)value_;
- (void)removeBooksObject:(BSIBook*)value_;

@end

@interface _BSIAuthor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
