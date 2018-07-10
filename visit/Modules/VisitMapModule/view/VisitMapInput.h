//
//  VisitMapInput.h
//  visit
//
//  Created by Artem Chibeskov on 6/24/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Organization;

@protocol VisitMapInput <NSObject>

- (void) updateWithOrganizations:(NSArray<Organization*>*)organizations;
- (void) updateVisitsWithError;
- (void) highlightOrganizationsById:(NSInteger)identifier;
- (void) dimOrganizationsById:(NSInteger)identifier;

@end
