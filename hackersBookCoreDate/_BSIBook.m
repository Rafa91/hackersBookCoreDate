// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSIBook.m instead.

#import "_BSIBook.h"

const struct BSIBookAttributes BSIBookAttributes = {
	.creationDate = @"creationDate",
	.frontPageURL = @"frontPageURL",
	.isFavorite = @"isFavorite",
	.modificationDate = @"modificationDate",
	.pdfURL = @"pdfURL",
	.titleBook = @"titleBook",
};

const struct BSIBookRelationships BSIBookRelationships = {
	.authors = @"authors",
	.frontPage = @"frontPage",
	.notes = @"notes",
	.pdf = @"pdf",
	.tags = @"tags",
};

@implementation BSIBookID
@end

@implementation _BSIBook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (BSIBookID*)objectID {
	return (BSIBookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"isFavoriteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isFavorite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic creationDate;

@dynamic frontPageURL;

@dynamic isFavorite;

- (BOOL)isFavoriteValue {
	NSNumber *result = [self isFavorite];
	return [result boolValue];
}

- (void)setIsFavoriteValue:(BOOL)value_ {
	[self setIsFavorite:@(value_)];
}

- (BOOL)primitiveIsFavoriteValue {
	NSNumber *result = [self primitiveIsFavorite];
	return [result boolValue];
}

- (void)setPrimitiveIsFavoriteValue:(BOOL)value_ {
	[self setPrimitiveIsFavorite:@(value_)];
}

@dynamic modificationDate;

@dynamic pdfURL;

@dynamic titleBook;

@dynamic authors;

- (NSMutableSet*)authorsSet {
	[self willAccessValueForKey:@"authors"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"authors"];

	[self didAccessValueForKey:@"authors"];
	return result;
}

@dynamic frontPage;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@dynamic pdf;

@dynamic tags;

- (NSMutableSet*)tagsSet {
	[self willAccessValueForKey:@"tags"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tags"];

	[self didAccessValueForKey:@"tags"];
	return result;
}

@end

