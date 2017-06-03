//
//  AppDelegate.h
//  lab8_1
//
//  Created by Elena on 27.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
- (NSArray*)getAllFlights;


@end

