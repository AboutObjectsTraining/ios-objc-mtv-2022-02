// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PeepsTests : XCTestCase

@end

@implementation PeepsTests

- (void)testCreatePerson {
    Person *person = [Person alloc];
    person = [person init];
    NSLog(@"%@", person);

    [person setFirstName:@"Fred"];
    [person setLastName:@"Smith"];
    [person setAge:42];
    
    NSLog(@"%@", person);
}

- (void)testCustomInitializers {
    Person *person1 = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith"];
    NSLog(@"%@", person1);
    
    Person *person2 = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith" age:42];
    NSLog(@"%@", person2);
}

- (void)testFactoryMethod {
    Person *person = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:42];
    NSLog(@"%@", person);
}

@end
