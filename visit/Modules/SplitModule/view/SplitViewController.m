//
//  SplitViewController.m
//  visit
//
//  Created by Artem Chibeskov on 7/7/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "SplitViewController.h"
#import "SplitOutput.h"

@implementation SplitViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.output viewWasLoadedWithViewControllers:self.viewControllers];
}

@end
