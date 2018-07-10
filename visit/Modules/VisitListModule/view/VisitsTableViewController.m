//
//  VisitsTableViewController.m
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "VisitsTableViewController.h"
#import "VisitListOutput.h"
#import "Visit.h"

@interface VisitsTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<Visit*> *visits;
@property (nonatomic, strong) NSMutableArray<NSIndexPath*> *selectedRows;

@end

@implementation VisitsTableViewController

- (nullable instancetype) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		_selectedRows = [NSMutableArray array];
		return self;
	}
	return nil;
}

- (void) viewDidLoad {
	[super viewDidLoad];
	[self.output viewIsReady];
}

#pragma mark - Table view data source

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.visits.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"visitCell" forIndexPath:indexPath];

	cell.selectedBackgroundView = [UIView new];
	cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:.0f green:1.f blue:.0f alpha:.5f];

	Visit *visit = self.visits[indexPath.row];
	cell.textLabel.text = visit.name;
	cell.detailTextLabel.text = visit.organizationName;

	return cell;
}

- (void) selectRow:(NSIndexPath*)indexPath {
	UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	cell.selected = YES;
	[self.selectedRows addObject:indexPath];
}

- (void) deselectRow:(NSIndexPath*)indexPath {
	UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	cell.selected = NO;
	[self.selectedRows removeObject:indexPath];
}

- (void) cleanSelections {
	for (NSIndexPath *indexPath in self.selectedRows) {
		UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
		cell.selected = NO;
	}
	[self.selectedRows removeAllObjects];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// reset native selection
	[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
	// support own exclusive selection
	[self cleanSelections];
	[self selectRow:indexPath];
	[self.output didSelectVisit:[self.visits objectAtIndex:indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self deselectRow:indexPath];
	[self.output didDeselectVisit:[self.visits objectAtIndex:indexPath.row]];
}

#pragma mark - Visit list input

- (void) updateWithVisits:(NSArray<Visit*>*)visits {
	self.visits = visits;
	[self.tableView reloadData];
}

- (void) updateVisitsWithError {
	// show error dialog
}

- (NSArray<NSIndexPath*>*) getIndexPathsByOrganizationId:(NSInteger)identifier {
	NSMutableArray<NSIndexPath*> *indexes = [NSMutableArray array];
	for (int i = 0; i < self.visits.count; ++i) {
		if (self.visits[i].organizationId == identifier) {
			[indexes addObject:[NSIndexPath indexPathForRow:i inSection:0]];
		}
	}
	return indexes;
}

- (void) highlightVisitsByOrganizationId:(NSInteger)identifier {
	NSArray<NSIndexPath*> *indexes = [self getIndexPathsByOrganizationId:identifier];
	for (NSIndexPath *indexPath in indexes) {
		[self selectRow:indexPath];
	}
}

- (void) dimVisitsByOrganizationId:(NSInteger)identifier {
	NSArray<NSIndexPath*> *indexes = [self getIndexPathsByOrganizationId:identifier];
	for (NSIndexPath *indexPath in indexes) {
		[self deselectRow:indexPath];
	}
}

@end
