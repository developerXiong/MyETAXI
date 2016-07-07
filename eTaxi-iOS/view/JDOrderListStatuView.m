//
//  JDOrderListStatuView.m
//  eTaxi-iOS
//
//  Created by jeader on 16/7/2.
//  Copyright © 2016年 jeader. All rights reserved.
//  显示单子状态：现在用车，预约用车，已上车

#import "JDOrderListStatuView.h"

#import "HeadFile.pch"

#define YellowColor COLORWITHRGB(247, 177, 44, 1)
#define GreenColor COLORWITHRGB(88, 235, 209, 1)

@interface JDOrderListStatuView ()

@property (nonatomic, weak) UIButton *backView;

//@property (nonatomic, weak) UIView *whiteView;

//@property (nonatomic, weak) UILabel *statuLabel;

@end

@implementation JDOrderListStatuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubviews];
        
        _backView.layer.cornerRadius = 5.0;
        
        
    }
    return self;
}

-(void)addSubviews
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn];
    _backView = btn;
    
//    UILabel *statuLabel = [[UILabel alloc] init];
//    [self addSubview:statuLabel];
//    _statuLabel = statuLabel;
    
//    UIView *whiteView = [[UIView alloc] init];
//    [self addSubview:whiteView];
//    _whiteView = whiteView;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_backView setFrame:CGRectMake((self.bounds.size.width-120)/2, -5, 120, self.bounds.size.height)];
    
}

-(void)setOrderStatu:(orderStatu)orderStatu
{
    _orderStatu = orderStatu;
    
    switch (orderStatu) {
        case 0: // 现在用车
            [_backView setTitle:@"现在用车" forState:UIControlStateNormal];
            [_backView setBackgroundColor:YellowColor];
            break;
        case 1: // 预约用车
            [_backView setTitle:@"预约用车" forState:UIControlStateNormal];
            [_backView setBackgroundColor:GreenColor];
            break;
        case 2: // 已上车
            [_backView setTitle:@"已上车" forState:UIControlStateNormal];
            [_backView setBackgroundColor:YellowColor];
            break;
            
        default:
            break;
    }
}

@end
