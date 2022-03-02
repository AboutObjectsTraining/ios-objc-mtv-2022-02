// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"
#import "Dog.h"

@implementation Person

// MARK: - Initializers

// Convenience initializer. May call a designated initializer or another convenience initalizer.
- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName {
    return [self initWithFirstName:aFirstName lastName:aLastName age:0];
}

// Designated initializer. Must call super.
- (instancetype)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName age:(NSInteger)anAge {
    if (!(self = [super init])) return nil;
    
    // Set ivars
    
    _firstName = [aFirstName copy];
    _lastName = [aLastName copy];
    _age = anAge;
    
    // Okay to call our own methods here.
    
    return self;
}

// Class factory method
+ (instancetype)personWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName age:(NSInteger)anAge {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName age:anAge];
}

// MARK: - Forwarding

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    return [self.dog respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.dog respondsToSelector:aSelector]) {
        return self.dog;
    }
    return nil;
}

// MARK: - Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@, %ld", self.firstName, self.lastName, self.age];
}

@end
