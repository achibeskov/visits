//
//  VisitsMapViewController.m
//  visit
//
//  Created by Artem Chibeskov on 6/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "VisitsMapViewController.h"
#import <MapKit/MapKit.h>
#import "VisitMapOutput.h"
#import "Organization.h"
#import "OrganizationAnnotation.h"

@interface VisitsMapViewController () <MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSMutableDictionary<NSNumber*, OrganizationAnnotation*> *annotationsDictionary;

@end

@implementation VisitsMapViewController

- (nullable instancetype) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		_annotationsDictionary = [NSMutableDictionary dictionary];
		return self;
	}
	return nil;
}

- (void) viewDidLoad {
	[super viewDidLoad];
	[self.output viewIsReady];
}

#pragma mark - Visit map input

- (void) updateWithOrganizations:(NSArray<Organization*>*)organizations {
	[self.mapView removeAnnotations:self.mapView.annotations];
	for (Organization *organization in organizations) {
		OrganizationAnnotation *point = [OrganizationAnnotation new];
		point.isSelected = NO;
		point.coordinate = organization.position;
		point.organization = organization;
		[self.annotationsDictionary setObject:point forKey:@(organization.identifier)];
		[self.mapView addAnnotation:point];
	}
	[self.mapView showAnnotations:self.mapView.annotations animated:NO];
}

- (void) updateVisitsWithError {
	// show error dialog
}

- (void) highlightOrganizationsById:(NSInteger)identifier {
	OrganizationAnnotation *annotation = [self.annotationsDictionary objectForKey:@(identifier)];
	annotation.isSelected = YES;
	[self.mapView selectAnnotation:annotation animated:YES];
}

- (void) dimOrganizationsById:(NSInteger)identifier {
	OrganizationAnnotation *annotation = [self.annotationsDictionary objectForKey:@(identifier)];
	annotation.isSelected = NO;
	[self.mapView deselectAnnotation:annotation animated:YES];
}

#pragma mark - MapView delegate

- (void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
	OrganizationAnnotation *point = view.annotation;
	if (!point.isSelected) {
		point.isSelected = YES;
		[self.output didSelectOrganization:point.organization];
	}
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
	OrganizationAnnotation *point = view.annotation;
	if (point.isSelected) {
		point.isSelected = NO;
		[self.output didDeselectOrganization:point.organization];
	}
}

@end
