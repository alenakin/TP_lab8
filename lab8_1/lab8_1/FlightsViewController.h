//
//  FlightsViewController.h
//  lab8_1
//
//  Created by Elena on 27.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Record.h"
#import "AppDelegate.h"

@interface FlightsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

-(id)initWithBothCities:(NSString*)cityFrom :(NSString *)cityTo;

@end
