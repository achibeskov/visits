//
//  OrganizationAnnotation.h
//  visit
//
//  Created by Artem Chibeskov on 6/24/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <MapKit/MapKit.h>

@class Organization;

@interface OrganizationAnnotation : MKPointAnnotation

@property (nonatomic, copy) Organization *organization;
@property (nonatomic, assign) BOOL isSelected;

@end
