//
//  NSManagedObjectContext+Extensions.m
//  WoolyCoreData
//
//  Created by Scott Chandler on 4/5/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import "NSManagedObjectContext+Extensions.h"

@implementation NSManagedObjectContext (Extensions)
- (NSArray *)fetchObjectsForEntityName:(NSString *)name withPredicate:(NSPredicate *)predicate andSortDescriptors:(NSArray *)sortDescriptors
{
	NSParameterAssert(name);
	NSArray *entities = [NSArray array];
	if ( name ) {
		NSFetchRequest *request = [NSFetchRequest new];
		[request setEntity:[NSEntityDescription entityForName:name inManagedObjectContext:self]];
		if ( predicate ) {
			[request setPredicate:predicate];
		}
		if ( sortDescriptors ) {
			[request setSortDescriptors:sortDescriptors];
		}
		
		NSError *error = nil;
		entities = [self executeFetchRequest:request error:&error];
		[request release];
		
		if ( entities== nil) {
			NSLog(@"Error fetching records for entity \"%@\".\nError details: %@",name,error);
		}
	}
	
	return entities;
}

- (NSInteger)objectCountForEntityName:(NSString *)name withPredicate:(NSPredicate *)predicate
{
	NSParameterAssert(name);

	NSInteger count = 0;
	if ( name ) {
		NSFetchRequest *request = [NSFetchRequest new];
		[request setEntity:[NSEntityDescription entityForName:name inManagedObjectContext:self]];
		if ( predicate ) {
			[request setPredicate:predicate];
		}
		
		NSError *error = nil;
		count = [self countForFetchRequest:request error:&error];
		[request release];
	}
	
	return count;
}

@end
