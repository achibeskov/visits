//
//  VisitsMapViewController.h
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VisitMapInput.h"
#import "ViewControllerWithPresenter.h"

@protocol VisitMapOutput;

@interface VisitsMapViewController : UIViewController <VisitMapInput, ViewControllerWithPresenter>

@property (nonatomic, strong) IBOutlet id<VisitMapOutput> output;

@end
