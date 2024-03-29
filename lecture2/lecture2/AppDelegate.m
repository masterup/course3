//
//  AppDelegate.m
//  lecture2
//
//  Created by Igor Tomych on 10/20/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import "AppDelegate.h"
#import "UIStudentsViewController.h"
#import "StudentsApi.h"

#import "A.h"
#import "B.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    A* a = [[A alloc] init];
    A* b = [[B alloc] init];
    

    
    if ([a respondsToSelector:@selector(say)]) {
        [a say];
    }

    if ([b respondsToSelector:@selector(say)]) {
        [b say];
    }
    
    if (![a respondsToSelector:@selector(bullShit)]) {
        NSLog(@"not responding");
    }
    
    if ([b respondsToSelector:@selector(bullShit:)]) {
        [b bullShit:@"zz"];
    }
    
    if ([b respondsToSelector:@selector(bullShit)]) {
        [b bullShit];
    }
    
    UIStudentsViewController *controller = [[UIStudentsViewController alloc] initWithNibName:@"UIStudentsViewController" bundle:nil];
    
    //UIStudentsViewController *controller = nil;
    
    NSLog(@"%@", [[UIDevice currentDevice] uniqueIdentifier]);
    
    StudentsApi* model = [[StudentsApi alloc] init];
    
    NSLog(@"%d", [model retainCount]);
    controller.studentsApi = model;
    
    //[controller loadData];
    
    NSLog(@"%d", [model retainCount]);
    
    self.window.rootViewController = controller;

    

    [controller release];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
