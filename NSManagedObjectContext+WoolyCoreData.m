//
//  NSManagedObjectContext+WoolyCoreData.m
//
//	The MIT License (MIT)
//
//	Copyright (c) 2013 Wooly Beast Software
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "NSManagedObjectContext+WoolyCoreData.h"

@implementation NSManagedObjectContext (WoolyCoreData)
/*
 *
 *
 *
 */
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
#if !__has_feature(objc_arc)
		[request release];
#endif
		
		if ( entities== nil) {
			NSLog(@"Error fetching records for entity \"%@\".\nError details: %@",name,error);
		}
	}
	
	return entities;
}

/*
 *
 *
 *
 */
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
#if !__has_feature(objc_arc)
		[request release];
#endif
	}
	
	return count;
}

/*
 *
 *
 *
 */
- (NSManagedObject *)objectWithURI:(NSURL *)uri
{
    NSParameterAssert(uri);
    
    NSManagedObject *object = nil;
    NSManagedObjectID *objectID = [[self persistentStoreCoordinator] managedObjectIDForURIRepresentation:uri];
    if ( objectID ) {
        NSError *error = nil;
        object = [self existingObjectWithID:objectID error:&error];
        if ( object == nil ) {
            NSLog(@"Error fetching object from URI: %@",error);
        }
    }
    return object;
}

/*
 *
 *
 *
 */
- (NSManagedObject *)objectWithinManagedObjectContextForObject:(NSManagedObject *)object
{
	NSManagedObject *newObject = object;
	if ( object && self != object.managedObjectContext ) {
		NSManagedObjectID *objectID = [object objectID];
		newObject = [self objectWithID:objectID];
	}
	return newObject;
}

@end
