//
//  Visit.m
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "Visit.h"

@implementation Visit

- (id) copyWithZone:(NSZone*)zone {
	Visit *visit = [[[self class] allocWithZone:zone] init];

	visit.name = self.name;
	visit.organizationName = self.organizationName;
	visit.organizationId = self.organizationId;

	return visit;
}

@end
