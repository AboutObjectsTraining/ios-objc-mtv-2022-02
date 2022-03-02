// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

//struct C_Person {
//    char *firstName;
//    char *lastName;
//    int age;
//};

@class Dog;

@interface Person : NSObject {
    NSString *_firstName;
    NSString *_lastName;
    NSInteger _age;
    Dog *_dog;
}

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName;

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName
                              age:(NSInteger)anAge;

+ (instancetype)personWithFirstName:(NSString *)aFirstName
                           lastName:(NSString *)aLastName
                                age:(NSInteger)anAge;

- (NSString *)firstName;
- (void)setFirstName:(NSString *)newValue;

- (NSString *)lastName;
- (void)setLastName:(NSString *)newValue;

- (NSInteger)age;
- (void)setAge:(NSInteger)newValue;

- (Dog *)dog;
- (void)setDog:(Dog *)newValue;

@end

