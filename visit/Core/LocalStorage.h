//
//  LocalStorage.h
//  visit
//
//  Created by Artem Chibeskov on 6/17/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const visitsKey;
extern NSString* const organizationsKey;

@protocol LocalStorage <NSObject>

- (void) saveObject:(id)object forKey:(NSString*)key;
- (id) getObjectForKey:(NSString*)key;

@end
