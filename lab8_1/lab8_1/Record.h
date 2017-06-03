//
//  Record.h
//  lab8_1
//
//  Created by Elena on 27.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

#import <Foundation/Foundation.h> 
#import <CoreData/CoreData.h>

@interface Record : NSManagedObject

@property (nonatomic, retain) NSString * cityfrom;
@property (nonatomic, retain) NSString * cityto;
@property (nonatomic, retain) NSString * company;
@property (nonatomic, retain) NSNumber * price;

@end
