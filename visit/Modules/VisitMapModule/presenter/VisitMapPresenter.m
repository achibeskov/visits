//
//  VisitMapPresenter.m
//  visit
//
//  Created by Artem Chibeskov on 6/23/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "VisitMapPresenter.h"
#import "OrganizationService.h"
#import "VisitMapInput.h"
#import "VisitListModuleInput.h"
#import "Organization.h"

@interface VisitMapPresenter()

@property (nonatomic, weak) IBOutlet id<VisitMapInput> view;
@property (nonatomic, strong) IBOutlet id<OrganizationService> organizationService;

@end

@implementation VisitMapPresenter

#pragma mark - Visit map output

- (void) didSelectOrganization:(Organization*)organization {
	[self.listModule highlightVisitsByOrganizationId:organization.identifier];
}

- (void) didDeselectOrganization:(Organization*)organization {
	[self.listModule dimVisitsByOrganizationId:organization.identifier];
}

- (void) viewIsReady {
	__weak typeof(self) weakSelf = self;
	[self.organizationService updateOrganizationsWithCompletionBlock:^(NSError *error) {
		__strong typeof(self) strongSelf = weakSelf;
		if (error) {
			[strongSelf.view updateVisitsWithError];
			return;
		}
		NSDictionary *organizations = [strongSelf.organizationService obtainOrganizations];
		[strongSelf.view updateWithOrganizations:organizations.allValues];
	}];
}

#pragma mark - Visit map module input

- (void) highlightOrganizationsById:(NSInteger)identifier {
	[self.view highlightOrganizationsById:identifier];
}

- (void) dimOrganizationsById:(NSInteger)identifier {
	[self.view dimOrganizationsById:identifier];
}

@end
