//
//  SplitViewController.h
//  visit
//
//  Created by Artem Chibeskov on 7/7/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerWithPresenter.h"

@protocol SplitOutput;

@interface SplitViewController : UISplitViewController<ViewControllerWithPresenter>

@property (nonatomic, strong) IBOutlet id<SplitOutput> output;

@end
