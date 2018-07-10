//
//  Visit.h
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Visit : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *organizationName;
@property (nonatomic, assign) NSInteger organizationId;

@end
