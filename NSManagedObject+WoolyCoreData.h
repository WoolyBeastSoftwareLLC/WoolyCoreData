//
//  NSManagedObject+WoolyCoreData.h
//  WoolyCoreData
//
//  Created by Scott Chandler on 7/21/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface NSManagedObject(WoolyCoreData)
+ (NSFetchRequest *)fetchRequestInManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSManagedObject *)createInManagedObjectContext:(NSManagedObjectContext *)context;
@end
