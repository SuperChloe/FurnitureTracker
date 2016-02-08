//
//  DetailViewController.m
//  FurnitureTracker
//
//  Created by Chloe on 2016-02-07.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"room = %@", self.detailItem];
    self.furnitureList = [Furniture objectsWithPredicate:pred];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add Furniture"
                                                                   message:@"Furniture name to add:"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Furniture name";
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                         UITextField *textField = alert.textFields.firstObject;
                                                         Furniture *furniture = [[Furniture alloc] init];
                                                         furniture.name = textField.text;
                                                         furniture.room = self.detailItem;
                                                         RLMRealm *realm = [RLMRealm defaultRealm];
                                                         [realm beginWriteTransaction];
                                                         [realm addObject:furniture];
                                                         [realm commitWriteTransaction];
                                                         
                                                         NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.furnitureList.count - 1) inSection:0];
                                                         [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                                                     }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.furnitureList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FurnitureCell" forIndexPath:indexPath];
    Furniture *furniture = self.furnitureList[indexPath.row];
    cell.textLabel.text = furniture.name;
    return cell;
}

@end
