//
//  AppDelegate.m
//  iOS_trainee_Cleveroad
//
//  Created by Ivashin Dmitry on 11/5/16.
//  Copyright © 2016 Ivashin Dmitry. All rights reserved.
//

#import "AppDelegate.h"
#import "NotesViewController.h"
#import "DataAPI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UINavigationController *navigationController = (UINavigationController *) self.window.rootViewController;
    NotesViewController *viewController = (NotesViewController *) navigationController.visibleViewController;
    viewController.data = [DataAPI sharedInstance];
    
    [self configureSatusBarAppearance];
    [self configureNavigationBarAppearance];
    
    return YES;
}

-(void) configureNavigationBarAppearance
{
    UIColor* navigationBarColor = [UIColor colorWithRed:0.175f green:0.458f blue:0.831f alpha:1.0f];
    [[UINavigationBar appearance] setBarTintColor:navigationBarColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

-(void) configureSatusBarAppearance
{
    [[UIApplication sharedApplication] setStatusBarHidden:false];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];    
}


@end
