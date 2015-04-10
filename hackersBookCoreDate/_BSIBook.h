// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSIBook.h instead.

@import CoreData;
#import "BSIHackersBookBaseClass.h"

extern const struct BSIBookAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *frontPageURL;
	__unsafe_unretained NSString *isFavorite;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *pdfURL;
	__unsafe_unretained NSString *titleBook;
} BSIBookAttributes;

extern const struct BSIBookRelationships {
	__unsafe_unretained NSString *authors;
	__unsafe_unretained NSString *frontPage;
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *pdf;
	__unsafe_unretained NSString *tags;
} BSIBookRelationships;

@class BSIAuthor;
@class BSIPhoto;
@class BSINote;
@class BSIPdf;
@class BSITag;

@interface BSIBookID : NSManagedObjectID {}
@end

@interface _BSIBook : BSIHackersBookBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) BSIBookID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* frontPageURL;

//- (BOOL)validateFrontPageURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* isFavorite;

@property (atomic) BOOL isFavoriteValue;
- (BOOL)isFavoriteValue;
- (void)setIsFavoriteValue:(BOOL)value_;

//- (BOOL)validateIsFavorite:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pdfURL;

//- (BOOL)validatePdfURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* titleBook;

//- (BOOL)validateTitleBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *authors;

- (NSMutableSet*)authorsSet;

@property (nonatomic, strong) BSIPhoto *frontPage;

//- (BOOL)validateFrontPage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@property (nonatomic, strong) BSIPdf *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;

@end

@interface _BSIBook (AuthorsCoreDataGeneratedAccessors)
- (void)addAuthors:(NSSet*)value_;
- (void)removeAuthors:(NSSet*)value_;
- (void)addAuthorsObject:(BSIAuthor*)value_;
- (void)removeAuthorsObject:(BSIAuthor*)value_;

@end

@interface _BSIBook (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(BSINote*)value_;
- (void)removeNotesObject:(BSINote*)value_;

@end

@interface _BSIBook (TagsCoreDataGeneratedAccessors)
- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(BSITag*)value_;
- (void)removeTagsObject:(BSITag*)value_;

@end

@interface _BSIBook (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSString*)primitiveFrontPageURL;
- (void)setPrimitiveFrontPageURL:(NSString*)value;

- (NSNumber*)primitiveIsFavorite;
- (void)setPrimitiveIsFavorite:(NSNumber*)value;

- (BOOL)primitiveIsFavoriteValue;
- (void)setPrimitiveIsFavoriteValue:(BOOL)value_;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitivePdfURL;
- (void)setPrimitivePdfURL:(NSString*)value;

- (NSString*)primitiveTitleBook;
- (void)setPrimitiveTitleBook:(NSString*)value;

- (NSMutableSet*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSMutableSet*)value;

- (BSIPhoto*)primitiveFrontPage;
- (void)setPrimitiveFrontPage:(BSIPhoto*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

- (BSIPdf*)primitivePdf;
- (void)setPrimitivePdf:(BSIPdf*)value;

- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;

@end
