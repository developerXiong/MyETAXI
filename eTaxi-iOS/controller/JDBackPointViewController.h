//
//  JDBackPointViewController.h
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDBackPointViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *backPointCountLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
