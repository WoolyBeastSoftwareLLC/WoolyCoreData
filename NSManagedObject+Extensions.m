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
//	Method:
//		
//
//	Synopsis:
//
//
- (NSArray *)keys
{
	return [NSArray array];
}

//
//	Method:
//		
//
//	Synopsis:
//
//
- (NSArray *)attributeKeys
{
	return [NSArray array];
}

//
//	Method:
//		
//
//	Synopsis:
//
//
- (NSDictionary *)values
{
	NSDictionary *values = [self committedValuesForKeys:self.keys];
	return values;
}

//
//	Method:
//		
//
//	Synopsis:
//
//
- (void)setValues:(NSDictionary *)values
{
	for ( NSString *key in self.keys ) {
		id value = [values objectForKey:key];
		if ( value == [NSNull null] ) 
			value = nil;
		[self setValue:value forKey:key];
	}
}

//
//	Method:
//		
//
//	Synopsis:
//
//
- (BOOL)canEditValueForKey:(NSString *)key
{
	return [self.keys containsObject:key];
}


//
//	Method:
//		
//
//	Synopsis:
//
//
+ (NSFetchRequest *)fetchRequestInManagedObjectContext:(NSManagedObjectContext *)context
{
	NSFetchRequest *request = [NSFetchRequest new];
	NSString *entityName = NSStringFromClass([self class]);
	[request setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:context]];
	return [request autorelease];
}

//
//	Method:
//		
//
//	Synopsis:
//
//
+ (NSManagedObject *)createInManagedObjectContext:(NSManagedObjectContext *)context
{
	NSParameterAssert(context);
	return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
}

//
//	Method:
//		
//
//	Synopsis:
//
//
- (NSManagedObject *)managedObjectInManagedObjectContext:(NSManagedObjectContext *)context
{
	NSParameterAssert(context);
	
	NSManagedObject *object = self;
	if ( self.managedObjectContext != context ) {
		NSManagedObjectID *objectID = [self objectID];
		object = [context objectWithID:objectID];
	}
	return object;
}

@end
