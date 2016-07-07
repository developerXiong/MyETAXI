//
//  JDBankRechargeViewController.h
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDBankRechargeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *needPayCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bankImageV;
@property (weak, nonatomic) IBOutlet UILabel *bankCardLabel;
@property (weak, nonatomic) IBOutlet UIButton *middleButton;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *inputPayPassLabel;

@end
