//
//  DetailViewController.h
//  FurnitureTracker
//
//  Created by Chloe on 2016-02-07.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

