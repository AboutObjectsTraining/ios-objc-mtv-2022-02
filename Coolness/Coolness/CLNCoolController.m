// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolViewCell.h"

@implementation CLNCoolController

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.systemBrownColor;
    
    UIView *view1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    UIView *view2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 170, 200, 40)];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    
    view1.backgroundColor = UIColor.purpleColor;
    view2.backgroundColor = UIColor.orangeColor;
}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = touches.anyObject;
//    if (touch.view == self.view) return;
//    
//    CGPoint currLocation = [touch locationInView:nil];
//    CGPoint prevLocation = [touch previousLocationInView:nil];
//    
//    CGFloat deltaX = currLocation.x - prevLocation.x;
//    CGFloat deltaY = currLocation.y - prevLocation.y;
//    
//    touch.view.frame = CGRectOffset(touch.view.frame, deltaX, deltaY);
//}

@end
