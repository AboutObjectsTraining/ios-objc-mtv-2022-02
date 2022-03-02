// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface ClassClusterTests : XCTestCase
@end

@implementation ClassClusterTests

- (void)testStringClassAsFactory {
    NSString *s1 = [NSString alloc];
    NSString *s2 = [[NSString alloc] init];
    NSString *s4 = [NSString alloc];
    NSMutableString *s3 = [NSMutableString alloc];
    NSLog(@"Class is %@", [s3 class]);
    NSLog(@"Class is %@", [s4 class]);
    
    s1 = [s1 initWithFormat:@"%@ %@!", @"Hello", @"World"];
    
    NSLog(@"Class is %@, value is %@", [s1 class], s1);
    NSLog(@"Class is %@, value is %@", [s2 class], s2);
    
//    [(NSMutableString *)s1 appendString:@" Woo!"];
//    NSLog(@"Class is %@, value is %@", [s1 class], s1);

    s3 = [s3 initWithFormat:@"%@ %@!", @"Hello", @"Mutable World"];
    NSLog(@"Class is %@, value is %@", [s3 class], s3);
}

@end
