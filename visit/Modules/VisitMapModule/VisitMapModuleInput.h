//
//  VisitMapModuleInput.h
//  visit
//
//  Created by Artem Chibeskov on 6/24/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VisitMapModuleInput <NSObject>

- (void) highlightOrganizationsById:(NSInteger)identifier;
- (void) dimOrganizationsById:(NSInteger)identifier;

@end
