//
//  OrganizationServiceImpl.m
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "OrganizationServiceImpl.h"
#import "Organization.h"
#import "LocalStorage.h"
#import "NetworkClient.h"
#import "OrganizationJsonMapper.h"

@interface OrganizationServiceImpl()

@property (nonatomic, strong) IBOutlet OrganizationJsonMapper *mapper;
@property (nonatomic, strong) IBOutlet id<LocalStorage> storage;
@property (nonatomic, strong) IBOutlet id<NetworkClient> networkClient;

@end

@implementation OrganizationServiceImpl

- (void) updateOrganizationsWithCompletionBlock:(OrganizationsCompletionBlock)completionBlock {
	// load data
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://demo2060934.mockable.io/getOrganizationListTest"]];
	__weak typeof(self) weakSelf = self;
	[self.networkClient sendRequest:request completionBlock:^(NSData *data, NSError *error) {
		__strong typeof(self) strongSelf = weakSelf;
		if (error) {
			dispatch_async(dispatch_get_main_queue(), ^{completionBlock(error);});
			return;
		}
		NSError *parseError;
		// map data
		NSDictionary *organizations = [strongSelf.mapper map:data error:&parseError];
		if (parseError) {
			dispatch_async(dispatch_get_main_queue(), ^{completionBlock(parseError);});
			return;
		}
		// store data
		[strongSelf.storage saveObject:organizations forKey:organizationsKey];
		// notify ui
		dispatch_async(dispatch_get_main_queue(), ^{completionBlock(error);});
	}];
}

- (NSDictionary<NSNumber*, Organization*>*) obtainOrganizations {
	return [self.storage getObjectForKey:organizationsKey];
}

@end
