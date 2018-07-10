//
//  OrganizationService.h
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^OrganizationsCompletionBlock)(NSError *error);
@class Organization;

@protocol OrganizationService <NSObject>

- (void) updateOrganizationsWithCompletionBlock:(OrganizationsCompletionBlock)completionBlock;
- (NSDictionary<NSNumber*, Organization*>*) obtainOrganizations;

@end
