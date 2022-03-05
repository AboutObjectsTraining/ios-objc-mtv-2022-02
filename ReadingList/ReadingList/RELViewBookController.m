// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELViewBookController.h"
#import "RELEditBookController.h"
#import <ReadingListModel/ReadingListModel.h>

@interface RELViewBookController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@end

@implementation RELViewBookController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.titleLabel.text = self.book.title;
    self.yearLabel.text = self.book.year;
    self.firstNameLabel.text = self.book.author.firstName;
    self.lastNameLabel.text = self.book.author.lastName;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navController = segue.destinationViewController;
    RELEditBookController *controller = navController.childViewControllers.firstObject;
    controller.book = self.book;
}

- (IBAction)cancel:(UIStoryboardSegue *)unwindSegue {
    
}

@end
