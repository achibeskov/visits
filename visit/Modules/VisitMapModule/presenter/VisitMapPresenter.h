//
//  VisitMapPresenter.h
//  visit
//
//  Created by Artem Chibeskov on 6/23/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VisitMapOutput.h"
#import "VisitMapModuleInput.h"

@protocol VisitListModuleInput;

@interface VisitMapPresenter : NSObject <VisitMapOutput, VisitMapModuleInput>

@property (nonatomic, weak) IBOutlet id<VisitListModuleInput> listModule;

@end
