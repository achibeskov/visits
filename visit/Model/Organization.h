//
//  Organization.h
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Organization : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CLLocationCoordinate2D position;
@property (nonatomic, assign) NSInteger identifier;

@end
