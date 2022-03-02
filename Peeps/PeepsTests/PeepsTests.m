// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PeepsTests : XCTestCase

@end

// Declaring methods in a Category
@interface PeepsTests (MyAdditions)
- (void)bark;
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

- (void)testBark {
    id fred = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:42];
    Dog *rover = [[Dog alloc] init];
    [fred setDog:rover];
    
    SEL barkSelector = @selector(bark);
    
    if ([fred respondsToSelector:barkSelector]) {
        [fred performSelector:barkSelector];
    }
    
//    [fred bark];
    
    NSLog(@"%@", fred);
}

- (void)testCopyingBehavior {
    Dog *rover = [[Dog alloc] init];
    Dog *cloneOfRover = [rover copy];
    NSLog(@"%@", cloneOfRover);
    [cloneOfRover bark];
}

@end
