//
//  SplitPresenter.m
//  visit
//
//  Created by Artem Chibeskov on 7/8/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitPresenter.h"
#import "ViewControllerWithPresenter.h"
#import "VisitListPresenter.h"
#import "VisitMapPresenter.h"

@implementation SplitPresenter

- (void) viewWasLoadedWithViewControllers:(NSArray<UIViewController<ViewControllerWithPresenter>*>*)viewControllers {
	// initialize inter module connections
	VisitListPresenter *listPresenter = viewControllers[0].output;
	VisitMapPresenter *mapPresenter = viewControllers[1].output;

	mapPresenter.listModule = listPresenter;
	listPresenter.mapModule = mapPresenter;
}

@end
