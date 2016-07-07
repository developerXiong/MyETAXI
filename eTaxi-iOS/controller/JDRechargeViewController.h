//
//  JDRechargeViewController.h
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NoSelectImage [UIImage imageNamed:@"no_Selected_recharge"]
#define SelectImage [UIImage imageNamed:@"Selected_recharge"]

@interface JDRechargeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
