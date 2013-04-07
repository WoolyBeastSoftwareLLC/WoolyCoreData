//
//  NSManagedObject+WoolyCoreData.m
//  WoolyCoreData
//
//  Created by Scott Chandler on 7/21/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSManagedObject+WoolyCoreData.h"


@implementation NSManagedObject(WoolyCoreData)


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

@end
