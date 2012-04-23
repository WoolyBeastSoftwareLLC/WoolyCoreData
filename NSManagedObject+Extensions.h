//
//  NSManagedObject+Extensions.h
//  WoolyCoreData
//
//  Created by Scott Chandler on 7/21/10.
//  Copyright 2010 Wooly Beast Software, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface NSManagedObject(WoolyBeast)
@property (nonatomic,readonly,copy) NSArray *keys;
@property (nonatomic,readonly,copy) NSArray *attributeKeys;
@property (nonatomic,copy) NSDictionary *values;

- (BOOL)canEditValueForKey:(NSString *)key;

+ (NSFetchRequest *)fetchRequestInManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSManagedObject *)createInManagedObjectContext:(NSManagedObjectContext *)context;

- (NSManagedObject *)managedObjectInManagedObjectContext:(NSManagedObjectContext *)context;
@end
