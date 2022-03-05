// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELViewBookController.h"
#import <ReadingListModel/ReadingListModel.h>

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RLMStoreController *storeController;
@property (strong, nonatomic) RLMReadingList *readingList;
@end

@implementation RELReadingListController

// Lazily initializes the readingList property.
- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.storeController.fetchedReadingList;
    }
    return _readingList;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"View Book"]) {
        RELViewBookController *controller = segue.destinationViewController;
        controller.book = [self.readingList bookAtIndexPath:self.tableView.indexPathForSelectedRow];
    } else {
        
    }
}

// MARK: - Unwind segues

- (IBAction)done:(UIStoryboardSegue *)unwindSegue {
    [self.tableView reloadData];
    [self.storeController saveReadingList:self.readingList];
}

- (IBAction)cancel:(UIStoryboardSegue *)unwindSegue {
    
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.readingList.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Cell"];
    RLMBook *book = [self.readingList bookAtIndexPath:indexPath];
    
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", book.year, book.author.fullName];
    
    return cell;
}

@end
