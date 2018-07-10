//
//  VisitService.h
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VisitsCompletionBlock)(NSError *error);
@class Visit;

@protocol VisitService <NSObject>

- (void) updateVisitsWithCompletionBlock:(VisitsCompletionBlock)completionBlock;
- (NSArray<Visit*>*) obtainVisits;

@end
