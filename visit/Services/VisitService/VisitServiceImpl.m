//
//  VisitServiceImpl.m
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "VisitServiceImpl.h"
#import "Visit.h"
#import "LocalStorage.h"
#import "NetworkClient.h"
#import "VisitJsonMapper.h"

@interface VisitServiceImpl()

@property (nonatomic, strong) IBOutlet VisitJsonMapper *mapper;
@property (nonatomic, strong) IBOutlet id<LocalStorage> storage;
@property (nonatomic, strong) IBOutlet id<NetworkClient> networkClient;

@end

@implementation VisitServiceImpl

- (void) updateVisitsWithCompletionBlock:(VisitsCompletionBlock)completionBlock {
	// load data
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://demo2060934.mockable.io/getVisitsListTest"]];
	__weak typeof(self) weakSelf = self;
	[self.networkClient sendRequest:request completionBlock:^(NSData *data, NSError *error) {
		__strong typeof(self) strongSelf = weakSelf;
		if (error) {
			dispatch_async(dispatch_get_main_queue(), ^{completionBlock(error);});
			return;
		}
		NSError *parseError;
		// map data
		NSArray *visits = [strongSelf.mapper map:data error:&parseError];
		if (parseError) {
			dispatch_async(dispatch_get_main_queue(), ^{completionBlock(parseError);});
			return;
		}
		// store data
		[strongSelf.storage saveObject:visits forKey:visitsKey];
		// notify ui
		dispatch_async(dispatch_get_main_queue(), ^{completionBlock(error);});
	}];
}

- (NSArray<Visit*>*) obtainVisits {
	return [self.storage getObjectForKey:visitsKey];
}

@end
