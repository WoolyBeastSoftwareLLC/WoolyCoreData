//
//  NSManagedObjectContext+Extensions.h
//  WoolyCoreData
//
//  Created by Scott Chandler on 4/5/12.
//  Copyright (c) 2012 Wooly Beast Software, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Extensions)
- (NSArray *)fetchObjectsForEntityName:(NSString *)name withPredicate:(NSPredicate *)predicate andSortDescriptors:(NSArray *)sortDescriptors;
- (NSInteger)objectCountForEntityName:(NSString *)name withPredicate:(NSPredicate *)predicate;
@end
