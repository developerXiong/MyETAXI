//
//  JDECOtherButton.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDECOtherButton.h"

#define Width self.bounds.size.width
#define Height self.bounds.size.height

#define Color [UIColor colorWithRed:9/255.0 green:177/255.0 blue:255/255.0 alpha:1]

@interface JDECOtherButton ()

@property (nonatomic, strong) UILabel *otherLabel;

@property (nonatomic, strong) UILabel *favourLabel;

@end

@implementation JDECOtherButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 设置圆角
        self.layer.borderColor = Color.CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 3.0;
        self.layer.masksToBounds = YES;
        
        
        _otherLabel = [[UILabel alloc] init];
        _otherLabel.text = @"其他";
        _otherLabel.font = [UIFont systemFontOfSize:22];
        [self addSubview:_otherLabel];
        _otherLabel.textColor = Color;
        _otherLabel.textAlignment = NSTextAlignmentCenter;
        
        _favourLabel = [[UILabel alloc] init];
        _favourLabel.text = @"98折优惠";
        _favourLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_favourLabel];
        _favourLabel.textColor = Color;
        _favourLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _otherLabel.frame = CGRectMake(0, 20, Width, 30);
    
    _favourLabel.frame = CGRectMake(0, CGRectGetMaxY(_otherLabel.frame), Width, 25);
}

@end
