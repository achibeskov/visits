//
//  OrganizationJsonMapper.h
//  visit
//
//  Created by Artem Chibeskov on 7/8/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Organization;

@interface OrganizationJsonMapper : NSObject

- (NSDictionary<NSNumber*, Organization*>*) map:(NSData*)data error:(NSError**)error;

@end
