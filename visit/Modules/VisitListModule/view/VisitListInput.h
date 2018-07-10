//
//  VisitListInput.h
//  visit
//
//  Created by Artem Chibeskov on 6/23/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Visit;

@protocol VisitListInput <NSObject>

- (void) updateWithVisits:(NSArray<Visit*>*)visits;
- (void) updateVisitsWithError;
- (void) highlightVisitsByOrganizationId:(NSInteger)id;
- (void) dimVisitsByOrganizationId:(NSInteger)id;

@end
