//
//  JDExchangeCreditsView.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDExchangeCreditsView.h"

#import "HeadFile.pch"

#import "JDECBtnView.h"

#define TextFont [UIFont systemFontOfSize:12]

@interface JDExchangeCreditsView ()

@property (nonatomic, weak) UILabel *topLabel;

@property (nonatomic, weak) UIView *bottomView;

@property (nonatomic, weak) UIView *boToView;

@property (nonatomic, weak) UIImageView *imageV;

@property (nonatomic, weak) UILabel *botoLabel;

@end

@implementation JDExchangeCreditsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addChildViews];
        
        self.backgroundColor = COLORWITHRGB(237, 237, 237, 1);
        
    }
    return self;
}

-(void)addChildViews
{
    UILabel *topLabel = [[UILabel alloc] init];
    [self addSubview:topLabel];
    _topLabel = topLabel;
    topLabel.text = @"快捷兑换";
    topLabel.textColor = COLORWITHRGB(128, 128, 128, 1);
    topLabel.font = TextFont;
    
    /********底部的视图*******/
    UIView *bottomView = [[UIView alloc] init];
    [self addSubview:bottomView];
    _bottomView = bottomView;
    bottomView.backgroundColor = [UIColor whiteColor];
    
    // 底部视图 的 顶部 图片和label
    UIView *boToView = [[UIView alloc] init];
    _bottomView = bottomView;
    [bottomView addSubview:boToView];
    boToView.backgroundColor = [UIColor whiteColor];
    
    // 图片
    UIImageView *imageV = [[UIImageView alloc] init];
    [boToView addSubview:imageV];
    imageV.image = [UIImage imageNamed:@"zeng"];
    _imageV = imageV;
    // label
    UILabel *botoLabel = [[UILabel alloc] init];
    [boToView addSubview:botoLabel];
    _botoLabel = botoLabel;
    botoLabel.text = @"充值按%5充值金额赠送积分";
    botoLabel.font = TextFont;
    botoLabel.textColor = [UIColor blackColor];
    
    // 底部视图 的 按钮视图
    NSArray *creidits = @[@"100积分",@"300积分",@"500积分",@"800积分",@"1000积分",@"3000积分",@"5000积分",@"other"];
    NSArray *moneys = @[@"10元",@"28元",@"46元",@"75元",@"95元",@"295元",@"495元"];
    
    JDECBtnView *btnView = [[JDECBtnView alloc] initWithCreidits:creidits Moneys:moneys Frame:CGRectZero];
    _btnView = btnView;
    [bottomView addSubview:btnView];
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _topLabel.frame = CGRectMake(20, 0, JDScreenSize.width-20, 30);
    
    
    _boToView.frame = CGRectMake(0, 0, JDScreenSize.width, 34);
    
    _imageV.frame = CGRectMake(5, 17/2, 16, 16);
    
    _botoLabel.frame = CGRectMake(CGRectGetMaxX(_imageV.frame)+5, 10, JDScreenSize.width-30, 15);
    
    _btnView.frame = CGRectMake(0, 34, JDScreenSize.width, _btnView.Height);
    
    _bottomView.frame = CGRectMake(0, CGRectGetMaxY(_topLabel.frame), JDScreenSize.width, CGRectGetMaxY(_btnView.frame));
    
    
}

@end
