// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Dog.h"

@implementation Dog

- (void)bark {
    printf("Woof! Woof!\n");
}

- (id)copyWithZone:(NSZone *)zone {
    id myCopy = [[[self class] alloc] init];
//    myCopy->name = [self name];
    return myCopy;
}

@end
