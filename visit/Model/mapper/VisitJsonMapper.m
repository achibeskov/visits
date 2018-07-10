//
//  VisitJsonMapper.m
//  visit
//
//  Created by Artem Chibeskov on 7/8/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "VisitJsonMapper.h"
#import "Visit.h"

@implementation VisitJsonMapper

- (NSArray<Visit*>*) map:(NSData*)data error:(NSError**)error {
	NSArray *resp = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];

	NSMutableArray *visits = [NSMutableArray array];
	for (NSDictionary* dict in resp) {
		Visit *visit = [Visit new];
		visit.name = [dict objectForKey:@"title"];
		visit.organizationId = [[dict objectForKey:@"organizationId"] integerValue];
		[visits addObject:visit];
	}

	return visits;
}

@end
