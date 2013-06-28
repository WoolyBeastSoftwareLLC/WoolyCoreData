//
//  NSManagedObject+WoolyCoreData.m
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
#if !__has_feature(objc_arc)
	[request autorelease];
#endif
	return request;
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
- (BOOL)isEqualToManagedObject:(NSManagedObject *)other
{
	NSManagedObjectID *obj1ID = [self objectID];
	NSManagedObjectID *obj2ID = [other objectID];
	return [obj1ID isEqual:obj2ID];
}

@end
