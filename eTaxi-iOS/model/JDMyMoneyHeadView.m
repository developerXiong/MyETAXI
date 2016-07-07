//
//  JDMyMoneyHeadView.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/21.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDMyMoneyHeadView.h"

#import "HeadFile.pch"

@interface JDMyMoneyHeadView ()

@property (nonatomic, weak) UILabel *balance;

@property (nonatomic, weak) UILabel *balanceNumber;

@end

@implementation JDMyMoneyHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpAllChildView];
        
        self.backgroundColor = COLORWITHRGB(0, 156, 255, 1);
 
    }
    return self;
}

-(void)setUpAllChildView
{
    UILabel *balance = [[UILabel alloc] init];
    [self addSubview:balance];
    balance.text = @"账户余额(元)";
    balance.font = [UIFont systemFontOfSize:12];
    balance.textColor = [UIColor whiteColor];
    _balance = balance;
    
    UILabel *balanceNumber = [[UILabel alloc] init];
    [self addSubview:balanceNumber];
    balanceNumber.text = @"¥ 52833333333333333";
    balanceNumber.font = [UIFont systemFontOfSize:46];
    balanceNumber.textColor = [UIColor whiteColor];
    _balanceNumber = balanceNumber;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _balance.frame = CGRectMake(18, 10, 200, 15);
    
    _balanceNumber.frame = CGRectMake(18, CGRectGetMaxY(_balance.frame)+16, self.bounds.size.width-30, 55);
    
}

@end
