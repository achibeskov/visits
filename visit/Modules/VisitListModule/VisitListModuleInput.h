//
//  VisitListModuleInput.h
//  visit
//
//  Created by Artem Chibeskov on 6/24/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VisitListModuleInput <NSObject>

- (void) highlightVisitsByOrganizationId:(NSInteger)identifier;
- (void) dimVisitsByOrganizationId:(NSInteger)identifier;

@end
