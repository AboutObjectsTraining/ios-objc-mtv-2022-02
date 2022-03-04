// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNSceneDelegate.h"
#import "CLNCoolController.h"

@implementation CLNSceneDelegate

       - (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
             options:(UISceneConnectionOptions *)connectionOptions
{
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.backgroundColor = UIColor.systemYellowColor;
    
//    CLNCoolController *controller = [[CLNCoolController alloc] init];
//    UIView *backgroundView = controller.view;
//    [self.window addSubview:backgroundView];
    
    self.window.rootViewController = [[CLNCoolController alloc] initWithNibName:@"CoolStuff" bundle:nil];
    [self.window makeKeyAndVisible];
}

@end
