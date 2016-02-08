//
//  DetailViewController.h
//  FurnitureTracker
//
//  Created by Chloe on 2016-02-07.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Room *detailItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RLMResults<Furniture *> *furnitureList;

@end

