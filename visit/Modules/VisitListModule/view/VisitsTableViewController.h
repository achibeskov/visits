//
//  VisitsTableViewController.h
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VisitListInput.h"
#import "ViewControllerWithPresenter.h"

@protocol VisitListOutput;

@interface VisitsTableViewController : UIViewController <VisitListInput, ViewControllerWithPresenter>

@property (nonatomic, strong) IBOutlet id<VisitListOutput> output;

@end
