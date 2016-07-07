//
//  JDECButton.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDECButton.h"

#define Color [UIColor colorWithRed:9/255.0 green:177/255.0 blue:255/255.0 alpha:1]

#define Width self.bounds.size.width
#define Height self.bounds.size.height

@interface JDECButton ()
/**
 *  积分label
 */
@property (nonatomic, weak) UILabel *creditsLabel;

@property (nonatomic, weak) UIView *bottomView;
/**
 *  人民币label
 */
@property (nonatomic, weak) UILabel *moneyLabel;
/**
 *  优惠
 */
@property (nonatomic, weak) UILabel *favour;

@end

@implementation JDECButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addChildViews];
        
        self.backgroundColor = [UIColor whiteColor];
        
        // 设置圆角
        self.layer.borderColor = Color.CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 3.0;
        self.layer.masksToBounds = YES;
        
    }
    return self;
}

-(void)addChildViews
{
    UILabel *credits = [[UILabel alloc] init];
    [self addSubview:credits];
    credits.textColor = Color;
    credits.font = [UIFont systemFontOfSize:18];
    _creditsLabel = credits;
    credits.textAlignment = NSTextAlignmentCenter;
    
    UIView *bottomView = [[UIView alloc] init];
    [self addSubview:bottomView];
    _bottomView = bottomView;
    bottomView.backgroundColor = Color;
    
    UILabel *money = [[UILabel alloc] init];
    [bottomView addSubview:money];
    money.textColor = [UIColor whiteColor];
    money.font = [UIFont systemFontOfSize:18];
    _moneyLabel = money;
    money.textAlignment = NSTextAlignmentRight;
    
    UILabel *favour = [[UILabel alloc] init];
    [bottomView addSubview:favour];
    favour.textColor = [UIColor whiteColor];
    favour.font = [UIFont systemFontOfSize:10];
    _favour = favour;
    favour.text = @"优惠";
    favour.textAlignment = NSTextAlignmentLeft;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _creditsLabel.frame = CGRectMake(0, 0, Width, Height*2/3);
    
    _bottomView.frame = CGRectMake(0, CGRectGetMaxY(_creditsLabel.frame), Width, Height/3);
    
    _moneyLabel.frame = CGRectMake(0, 0, Width*2/3, Height/3);
    
    _favour.frame = CGRectMake(CGRectGetMaxX(_moneyLabel.frame)+2, 5, Width/3, 13);
    
}

#pragma mark accessor

-(void)setCredits:(NSString *)credits
{
    _credits = credits;
    
    _creditsLabel.text = credits;
    
}

-(void)setMoney:(NSString *)money
{
    _money = money;
    
    _moneyLabel.text = money;
    
}

@end
