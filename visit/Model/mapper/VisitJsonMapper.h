//
//  VisitJsonMapper.h
//  visit
//
//  Created by Artem Chibeskov on 7/8/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Visit;

@interface VisitJsonMapper : NSObject

- (NSArray<Visit*>*) map:(NSData*)data error:(NSError**)error;

@end
