//
//  SplitOutput.h
//  visit
//
//  Created by Artem Chibeskov on 7/8/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;
@protocol ViewControllerWithPresenter;

@protocol SplitOutput <NSObject>

- (void) viewWasLoadedWithViewControllers:(NSArray<UIViewController<ViewControllerWithPresenter>*>*)viewControllers;

@end
