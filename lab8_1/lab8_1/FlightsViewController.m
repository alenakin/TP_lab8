//
//  FlightsViewController.m
//  lab8_1
//
//  Created by Elena on 27.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

#import "FlightsViewController.h"

@interface FlightsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic) NSString *cityFrom;
@property (nonatomic) NSString *cityTo;
@property (nonatomic) NSMutableArray *flights;
@end

@implementation FlightsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithBothCities:(NSString*)cityFrom :(NSString *)cityTo
{
    self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FlightsViewController"];
    if(self)
    {
        _cityFrom = cityFrom;
        _cityTo = cityTo;
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self flights] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Record *flight = _flights[[indexPath row]];
    UITableViewCell *cell = (UITableViewCell*)[[self table] dequeueReusableCellWithIdentifier:@"flightCell"];
    cell.textLabel.numberOfLines = 4;
    cell.textLabel.text = [NSString stringWithFormat:@"From: %@\n To: %@\n Company: %@\n Price: %.2f\n", _cityFrom, _cityTo, (NSString*)[flight valueForKey:@"aviaCompany"], [[flight valueForKey:@"price"] floatValue]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    _flights = [NSMutableArray arrayWithArray:[appDelegate getAllFlights]];
    for (int i = 0; i < [_flights count];)
    {
        if (!([(NSString*)[_flights[i] valueForKey:@"cityFrom"] isEqualToString:_cityFrom] && [(NSString*)[_flights[i] valueForKey:@"cityTo"] isEqualToString:_cityTo]))
        {
            [_flights removeObjectAtIndex:i];
        }
        else
        {
            i++;
        }
    }
    
    [_table reloadData];
    
    
}

@end
