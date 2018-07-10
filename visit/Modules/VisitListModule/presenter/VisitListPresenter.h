//
//  VisitListPresenter.h
//  visit
//
//  Created by Artem Chibeskov on 6/23/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VisitListOutput.h"
#import "VisitListModuleInput.h"

@protocol VisitMapModuleInput;

@interface VisitListPresenter : NSObject <VisitListOutput, VisitListModuleInput>

@property (nonatomic, weak) IBOutlet id<VisitMapModuleInput> mapModule;

@end
