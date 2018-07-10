//
//  Organization.m
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "Organization.h"

@implementation Organization

- (id) copyWithZone:(NSZone*)zone {
	Organization *organization = [[[self class] allocWithZone:zone] init];

	organization.name = self.name;
	organization.position = self.position;
	organization.identifier = self.identifier;

	return organization;
}

@end
