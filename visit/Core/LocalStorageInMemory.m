//
//  LocalStorageInMemory.m
//  visit
//
//  Created by Artem Chibeskov on 6/17/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "LocalStorageInMemory.h"

NSString* const visitsKey = @"visits";
NSString* const organizationsKey = @"organizations";

@interface LocalStorageInMemory()

@property (nonatomic, strong) NSMutableDictionary *storage;

@end

@implementation LocalStorageInMemory

+ (instancetype) shared {
	static LocalStorageInMemory *shared = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		shared = [[LocalStorageInMemory alloc] initWithStorage];
	});
	return shared;
}

- (instancetype) awakeAfterUsingCoder:(NSCoder *)aDecoder {
	return [LocalStorageInMemory shared];
}

- (instancetype) initWithStorage {
	if (self = [super init]) {
		_storage = [NSMutableDictionary dictionary];
		return self;
	}
	return nil;
}

- (void) saveObject:(id)object forKey:(NSString*)key {
	@synchronized(self.storage) {
		[self.storage setObject:object forKey:key];
	}
}

- (id) getObjectForKey:(NSString*)key {
	@synchronized(self.storage) {
		return [self.storage objectForKey:key];
	}
}

@end
