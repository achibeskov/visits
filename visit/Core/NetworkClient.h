//
//  NetworkClient.h
//  visit
//
//  Created by Artem Chibeskov on 6/17/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ServerResponseModel;

typedef void(^NetworkClientCompletionBlock)(NSData *data, NSError *error);

@protocol NetworkClient <NSObject>

- (void)sendRequest:(NSURLRequest *)request
	completionBlock:(NetworkClientCompletionBlock)block;

@end
