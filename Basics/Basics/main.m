// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Basics.h"
#import <limits.h>

#import <Foundation/Foundation.h>

const unsigned int Sentinel = UINT_MAX;

void PrintMyArray(int *myPointer, int count) {
    for (int i = 0; i < count; i++) {
        printf("%d\n", myPointer[i]);
    }
}

void PrintMyArray2(unsigned int *myPointer) {
    for (; *myPointer != Sentinel; myPointer++) {
        printf("%d\n", *myPointer);
    }
}

void TestArrays(void) {
    int a[20] = { 42, 99 };
    unsigned int b[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } ;
    b[7] = Sentinel;
    
//    int multi[3][5];
    
//    PrintMyArray(a);
//    PrintMyArray(a, 10);
    PrintMyArray2(b);

    printf("Current element of a is %d\n", *(a + 1));
    printf("Current element of a is %d\n", a[1]);
}

void TestPointers(void) {
//    int x = 99;
//    int y = 123;
    int inches = 18;
    int *inchesRef = &inches;
    
    *inchesRef += 2;
    
    printf("value: %d, address: %p\n", *inchesRef, inchesRef);
}

void PrintWords1(char *words[]) {
    for (int i = 0; i < 3; i++) {
        printf("address: %p, value: %s\n", words[i], words[i]);
    }
}

void PrintWords2(char **words) {
    for (int i = 0; i < 3; i++) {
        printf("address: %p, value: %s\n", words[i], words[i]);
    }
}

void TestStrings(void) {
    char letters2[] = "abc";
    char letters[] = { 97, 98, 99 };
    
    char (*words2)[3]; // Pointer to an array of char
    char *words[3];    // Array of pointers to char
    char *words3[] = {
        "Hello",
        "World",
        "Woohoo!"
    };
    
    words[0] = "Hello";
    words[1] = "World";
    words[2] = "Woo!";
    
    PrintWords1(words);
    PrintWords1(words3);
    printf("%p\n", "Hello");
    printf("%p\n", "Hello");

    printf("%s\n", letters);
    printf("%s\n", letters2);
}

void TestMethods(void) {
    NSString *className = [NSArray description];
    NSLog(@"Class name is %@", className);
}

int main(int argc, const char * argv[]) {
//    TestPointers();
//    TestArrays();
//    TestStrings();
    TestMethods();
    return 0;
}
