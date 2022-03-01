// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

// Convenience initializer. May call a designated initializer or another convenience initalizer.
- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName {
    return [self initWithFirstName:aFirstName lastName:aLastName age:0];
}

// Designated initializer. Must call super.
- (instancetype)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName age:(NSInteger)anAge {
    self = [super init];
    if (self == nil) return nil;
    
    _firstName = aFirstName;
    _lastName = aLastName;
    _age = anAge;
    
    // Okay to call our own methods here.
    
    return self;
}

// Class factory method
+ (instancetype)personWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName age:(NSInteger)anAge {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName age:anAge];
}

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = newValue; // TODO: memory management and mutability issue here.
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = newValue;
}

- (NSInteger)age {
    return _age;
}
- (void)setAge:(NSInteger)newValue {
    _age = newValue;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@, %ld", [self firstName], [self lastName], [self age]];
}

@end
