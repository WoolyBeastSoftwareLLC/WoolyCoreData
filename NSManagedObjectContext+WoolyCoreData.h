//
//  NSManagedObjectContext+WoolyCoreData.h
//  WoolyCoreData
//
//  Created by Scott Chandler on 4/5/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (WoolyCoreData)

- (NSArray *)fetchObjectsForEntityName:(NSString *)name withPredicate:(NSPredicate *)predicate andSortDescriptors:(NSArray *)sortDescriptors;
- (NSInteger)objectCountForEntityName:(NSString *)name withPredicate:(NSPredicate *)predicate;


- (NSManagedObject *)objectWithURI:(NSURL *)uri;

// retrieve NSManagedObject from this context that was loaded in (presumably) on another context. Extremely convenient for cross-thread contexts.
- (NSManagedObject *)objectWithinManagedObjectContextForObject:(NSManagedObject *)object;
@end
