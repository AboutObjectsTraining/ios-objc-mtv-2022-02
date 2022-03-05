// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "UIStoryboardSegue+RELAdditions.h"

@implementation UIStoryboardSegue (RELAdditions)

- (id)rel_destinationViewController {
    UIViewController *controller = self.destinationViewController;
    if ([controller isKindOfClass:UINavigationController.class]) {
        return controller.childViewControllers.firstObject;
    }
    return controller;
}

@end
