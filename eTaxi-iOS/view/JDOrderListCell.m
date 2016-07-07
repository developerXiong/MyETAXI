//
//  JDOrderListCell.m
//  eTaxi-iOS
//
//  Created by jeader on 16/4/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDOrderListCell.h"
#import "JDOrderListImageView.h"
#import "HeadFile.pch"
#import "JDCallCarListViewModel.h"
#import "JDOrderListBottomView.h"

#define NowUseCarImage [UIImage imageNamed:@"现在用车_list"]
#define FeaUseCarImage [UIImage imageNamed:@"预约用车_list"]

@interface JDOrderListCell ()

@property (nonatomic, strong) UILabel *line;

@end

@implementation JDOrderListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        
        self.indexPath = indexPath;
        
        [self setUpAllChildViews];
//        self.contentView.backgroundColor = COLORWITHRGB(216, 216, 216, 1);
        
    }
    return self;
}

-(void)setUpAllChildViews
{

    // 上半部分视图
    _orderImageView = [[JDOrderListImageView alloc] init];
    [self addSubview:_orderImageView];
    
    // 线
    _line = [[UILabel alloc] init];
    [self addSubview:_line];
    _line.backgroundColor = COLORWITHRGB(216, 216, 216, 1);
    
    // 底部视图
    _orderBottomView = [[JDOrderListBottomView alloc] init];
    [self addSubview:_orderBottomView];
    _orderBottomView.indexPath = self.indexPath;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
//    CGSize imageS = [NowUseCarImage size];
    _orderImageView.frame = CGRectMake(0, 0, JDScreenSize.width, self.bounds.size.height-112/2);
    
    _line.frame = CGRectMake(20, CGRectGetMaxY(_orderImageView.frame), JDScreenSize.width-40, 0.5);
    
    _orderBottomView.frame = CGRectMake(0, CGRectGetMaxY(_orderImageView.frame), JDScreenSize.width, 112/2);
}

-(void)setViewModel:(JDCallCarListViewModel *)viewModel
{
    _viewModel = viewModel;
    
    _orderImageView.listViewModel = viewModel;
}

@end
