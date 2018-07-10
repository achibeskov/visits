//
//  VisitMapOutput.h
//  visit
//
//  Created by Artem Chibeskov on 6/24/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Organization;

@protocol VisitMapOutput <NSObject>

- (void) didSelectOrganization:(Organization*)organization;
- (void) didDeselectOrganization:(Organization*)organization;
- (void) viewIsReady;

@end
