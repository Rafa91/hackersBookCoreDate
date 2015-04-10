// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSIPdf.m instead.

#import "_BSIPdf.h"

const struct BSIPdfAttributes BSIPdfAttributes = {
	.pdfData = @"pdfData",
};

const struct BSIPdfRelationships BSIPdfRelationships = {
	.book = @"book",
};

@implementation BSIPdfID
@end

@implementation _BSIPdf

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Pdf" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Pdf";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Pdf" inManagedObjectContext:moc_];
}

- (BSIPdfID*)objectID {
	return (BSIPdfID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic pdfData;

@dynamic book;

@end

