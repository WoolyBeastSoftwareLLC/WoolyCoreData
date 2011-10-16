//
//  NSManagedObject+Extensions.m
//  WoolyCoreData
//
//  Created by Scott Chandler on 7/21/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSManagedObject+Extensions.h"


@implementation NSManagedObject(WoolyBeast)

//
//
//
- (NSArray *)keys
{
	return [NSArray array];
}

//
//
//
- (NSArray *)attributeKeys
{
	return [NSArray array];
}

//
//
//
- (NSDictionary *)values
{
	NSDictionary *values = [self committedValuesForKeys:self.keys];
	return values;
}

- (void)setValues:(NSDictionary *)values
{
	for ( NSString *key in self.keys ) {
		id value = [values objectForKey:key];
		if ( value == [NSNull null] ) 
			value = nil;
		[self setValue:value forKey:key];
	}
}

- (BOOL)canEditValueForKey:(NSString *)key
{
	return [self.keys containsObject:key];
}


+ (NSFetchRequest *)fetchRequestInManagedObjectContext:(NSManagedObjectContext *)context
{
	NSFetchRequest *request = [NSFetchRequest new];
	NSString *entityName = NSStringFromClass([self class]);
	[request setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:context]];
	return [request autorelease];
}

+ (NSManagedObject *)createInManagedObjectContext:(NSManagedObjectContext *)context
{
	NSParameterAssert(context);
	return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
}

@end
