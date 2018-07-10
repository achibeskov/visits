//
//  OrganizationJsonMapper.m
//  visit
//
//  Created by Artem Chibeskov on 7/8/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "OrganizationJsonMapper.h"
#import "Organization.h"

@implementation OrganizationJsonMapper

- (NSDictionary<NSNumber*, Organization*>*) map:(NSData*)data error:(NSError**)error {
	NSArray *resp = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];

	NSMutableDictionary *organizations = [NSMutableDictionary dictionary];
	for (NSDictionary* dict in resp) {
		Organization *organization = [Organization new];
		organization.name = [dict objectForKey:@"title"];
		CLLocationCoordinate2D position;
		position.latitude = [[dict objectForKey:@"latitude"] floatValue];
		position.longitude = [[dict objectForKey:@"longitude"] floatValue];
		organization.position = position;
		NSInteger identifier = [[dict objectForKey:@"organizationId"] integerValue];
		organization.identifier = identifier;
		[organizations setObject:organization forKey:@(identifier)];
	}

	return organizations;
}

@end
