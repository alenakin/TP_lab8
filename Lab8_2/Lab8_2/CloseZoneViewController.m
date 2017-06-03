//
//  CloseZoneViewController.m
//  Lab8_2
//
//  Created by Elena on 26.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

#import "CloseZoneViewController.h"

@interface CloseZoneViewController ()

@end

@implementation CloseZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)exitCloseZone:(id)sender {
    //NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    //[NSUserDefaults resetStandardUserDefaults];
    [self performSegueWithIdentifier:@"loginZone" sender:self];
}

@end
