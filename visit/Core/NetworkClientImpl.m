//
//  NetworkClientImpl.m
//  visit
//
//  Created by Artem Chibeskov on 6/17/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "NetworkClientImpl.h"

@interface NetworkClientImpl()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation NetworkClientImpl

- (instancetype) init {
	if (self = [super init]) {
		_session = NSURLSession.sharedSession;
		return self;
	}
	return nil;
}

- (void) sendRequest:(NSURLRequest *)request
	completionBlock:(NetworkClientCompletionBlock)block {
	NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		if (block) {
			block(data, error);
		}
	}];
	[dataTask resume];
}

@end
