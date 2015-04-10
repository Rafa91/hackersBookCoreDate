// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BSIPhoto.m instead.

#import "_BSIPhoto.h"

const struct BSIPhotoAttributes BSIPhotoAttributes = {
	.imageData = @"imageData",
};

const struct BSIPhotoRelationships BSIPhotoRelationships = {
	.frontPage = @"frontPage",
	.noteImage = @"noteImage",
};

@implementation BSIPhotoID
@end

@implementation _BSIPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (BSIPhotoID*)objectID {
	return (BSIPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic imageData;

@dynamic frontPage;

@dynamic noteImage;

@end

