//
//  ViewController.m
//  lab8_1
//
//  Created by Elena on 27.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController ()
{
    int isCity;
    MKPointAnnotation *annotationFrom;
    MKPointAnnotation *annotationTo;
}

@property (weak, nonatomic) IBOutlet UITextField *cityFrom;
@property (weak, nonatomic) IBOutlet UITextField *cityTo;
@property (weak, nonatomic) IBOutlet MKMapView *map;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer *longPressGesture =  [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(handleLongPressGesture:)];
    [self.map addGestureRecognizer:longPressGesture];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)handleLongPressGesture:(UIGestureRecognizer*)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        CGPoint point = [sender locationInView:self.map];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        CLLocationCoordinate2D coord = [self.map convertPoint:point
                                         toCoordinateFromView:self.map];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:coord.latitude longitude:coord.longitude];
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            if (error) {
                NSLog(@"Geocode failed with error: %@", error);
                return;
            }
        for (CLPlacemark * placemark in placemarks) {
            [self setAnnotationToMap:isCity :placemark.locality :coord];
            }
            
        }];
        
    }}

-(void)setAnnotationToMap:(int)type :(NSString *)title
                         :(CLLocationCoordinate2D)coordinate
{
    if (type == 0) {
        [_map removeAnnotation:annotationFrom];
        annotationFrom = [[MKPointAnnotation alloc] init];
        annotationFrom.title = title;
        annotationFrom.coordinate = coordinate;
        [_map addAnnotation:annotationFrom];
        self.cityFrom.text = title;
    }
    else
    {
        [_map removeAnnotation:annotationTo];
        annotationTo = [[MKPointAnnotation alloc] init];
        annotationTo.title = title;
        annotationTo.coordinate = coordinate;
        [_map addAnnotation:annotationTo];
        self.cityTo.text = title;
    }
}

- (IBAction)showFlights:(id)sender {
    FlightsViewController *flights = [[FlightsViewController alloc] initWithBothCities: self.cityFrom.text :self.cityTo.text];
    [self presentViewController:flights animated:YES completion:nil];
}


@end
