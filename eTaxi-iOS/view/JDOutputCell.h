//
//  JDOutputCell.h
//  eTaxi-iOS
//
//  Created by jeader on 16/6/23.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDOutputCell : UITableViewCell

// 银行
@property (weak, nonatomic) IBOutlet UIImageView *bankIcon;
@property (weak, nonatomic) IBOutlet UILabel *backName;

// 金额
@property (weak, nonatomic) IBOutlet UILabel *outMoneyLabel;
@property (weak, nonatomic) IBOutlet UITextField *outMoneyTextfield;

// 确认按钮
@property (weak, nonatomic) IBOutlet UIButton *sureButton;


@end
