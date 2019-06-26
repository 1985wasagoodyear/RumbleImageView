//
//  AppDelegate.m
//  RumbleImageViewDriver
//
//  Created by K Y on 6/26/19.
//  Copyright © 2019 KY. All rights reserved.
//

#import "AppDelegate.h"
#import "DriverViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    DriverViewController *vc = [[DriverViewController alloc] init];
    [self.window setRootViewController:vc];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
