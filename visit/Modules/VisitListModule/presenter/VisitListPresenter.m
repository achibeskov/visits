//
//  VisitListPresenter.m
//  visit
//
//  Created by Artem Chibeskov on 6/23/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "VisitListPresenter.h"
#import "VisitService.h"
#import "OrganizationService.h"
#import "VisitListInput.h"
#import "Visit.h"
#import "Organization.h"
#import "VisitMapModuleInput.h"

@interface VisitListPresenter()

@property (nonatomic, weak) IBOutlet id<VisitListInput> view;
@property (nonatomic, strong) IBOutlet id<VisitService> visitService;
@property (nonatomic, strong) IBOutlet id<OrganizationService> organizationService;

@end

@implementation VisitListPresenter

#pragma mark - Visit list output

- (void) didSelectVisit:(Visit*)visit {
	[self.mapModule highlightOrganizationsById:visit.organizationId];
}

- (void) didDeselectVisit:(Visit*)visit {
	[self.mapModule dimOrganizationsById:visit.organizationId];
}

- (void) viewIsReady {
	__weak typeof(self) weakSelf = self;
	[self.organizationService updateOrganizationsWithCompletionBlock:^(NSError *error) {
		__strong typeof(self) strongSelf = weakSelf;
		[strongSelf.visitService updateVisitsWithCompletionBlock:^(NSError *error) {
			if (error) {
				[strongSelf.view updateVisitsWithError];
				return;
			}
			NSArray *visits = [strongSelf.visitService obtainVisits];
			NSDictionary *organizations = [strongSelf.organizationService obtainOrganizations];
			for (Visit *visit in visits) {
				Organization *organization = [organizations objectForKey:@(visit.organizationId)];
				visit.organizationName = organization.name;
			}
			[strongSelf.view updateWithVisits:visits];
		}];
	}];
}

#pragma mark - Visit list module input

- (void) highlightVisitsByOrganizationId:(NSInteger)identifier {
	[self.view highlightVisitsByOrganizationId:identifier];
}

- (void) dimVisitsByOrganizationId:(NSInteger)identifier {
	[self.view dimVisitsByOrganizationId:identifier];
}

@end
