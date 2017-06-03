//
//  ViewController.m
//  Lab8_2
//
//  Created by Elena on 26.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *enterView;
@property (weak, nonatomic) IBOutlet UITextField *loginText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *checkPasswordText;
@property (weak, nonatomic) IBOutlet UISwitch *agreeSwitch;
@property (weak, nonatomic) IBOutlet UIButton *enterBt;
@property (weak, nonatomic) IBOutlet UITextField *loginEText;
@property (weak, nonatomic) IBOutlet UITextField *enterEText;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"login"] != nil && [user objectForKey:@"password"] != nil)
        [self performSegueWithIdentifier:@"closeZone" sender:self];
}

- (IBAction)changeView:(id)sender {
    NSInteger selected = _segControl.selectedSegmentIndex;
    if (selected == 0)
    {
        _loginView.hidden = YES;
        _enterView.hidden = NO;
    }
    else
    {
        _loginView.hidden = NO;
        _enterView.hidden = YES;
    }
}

- (IBAction)login:(id)sender {
    if ([_loginText.text isEqual:@""] || [_emailText.text isEqual:@""] || [_passwordText.text isEqual:@""])
        _errorLabel.text = @"Заполните все поля!";
    else if (!_agreeSwitch.on)
        _errorLabel.text = @"Согласитесь с нашими правилами";
    else if (![_passwordText.text isEqual:_checkPasswordText.text])
        _errorLabel.text = @"Пароли должны совпадать";
    else
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:_loginText.text forKey:@"login"];
        [user setObject:_passwordText.text forKey:@"password"];
        [self performSegueWithIdentifier:@"closeZone" sender:self];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
