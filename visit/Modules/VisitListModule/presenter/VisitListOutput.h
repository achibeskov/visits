//
//  VisitListOutput.h
//  visit
//
//  Created by Artem Chibeskov on 6/23/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Visit;

@protocol VisitListOutput <NSObject>

- (void) didSelectVisit:(Visit*)visit;
- (void) didDeselectVisit:(Visit*)visit;
- (void) viewIsReady;

@end
