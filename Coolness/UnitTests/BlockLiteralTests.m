// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface BlockLiteralTests : XCTestCase
@end

void SayHello(void) {
    printf("Hello!\n");
}

void SayGoodbye(void) {
    printf("Goodbye!\n");
}

void PerformNTimes(int count, void (*thingToPerform)(void)) {
    for (int i = 0; i < count; i++) {
        thingToPerform();
    }
}

void PerformNTimesWithBlock(int count, void (^blockToPerform)(void)) {
    for (int i = 0; i < count; i++) {
        blockToPerform();
    }
}

void PerformNTimesWithBlockWithArg(int count, void (^blockToPerform)(NSString *greeting)) {
    for (int i = 0; i < count; i++) {
        blockToPerform(@"Hello");
    }
}

@implementation BlockLiteralTests

- (void)testBlockLiteralWithArgument {
    PerformNTimesWithBlockWithArg(3, ^(NSString *greeting) {
        printf("%s world!\n", greeting.UTF8String);
    });
}

- (void)testPassingBlockLiteral {
    char *message = "but cool";
    int __block percentage = 100;
    
    PerformNTimesWithBlock(3, ^{
        percentage++;
        printf("Blocks are weird %s %d%%!\n", message, percentage);
    });
    
    printf("percentage is %d\n", percentage);
}

- (void)testBlockLiteralSyntax {
    void (^myBlock)(void);
    
    const char *message = "class";
    
    myBlock = ^{
        printf("Hello %s!\n", message);
    };
    
    myBlock();
    NSLog(@"%@", [myBlock description]);
    
    id copyOfMyBlock = [myBlock copy];
    NSLog(@"%@", [copyOfMyBlock description]);
}

- (void)testFunctionPointerSyntax {
    void (*thingToSay)(void);
    
    thingToSay = SayHello;
    thingToSay();
    
    thingToSay = SayGoodbye;
    thingToSay();
    
    PerformNTimes(3, SayHello);
}

@end
