// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import <ReadingListModel/ReadingListModel.h>

@implementation RELReadingListController

// MARK: - Unwind segues

- (IBAction)done:(UIStoryboardSegue *)unwindSegue {
    // TODO: save model and refresh UI
}

- (IBAction)cancel:(UIStoryboardSegue *)unwindSegue {
    
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100; // FIXME: compute this value!
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Book Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
    
    return cell;
}

@end
