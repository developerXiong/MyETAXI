//
//  JDECBtnView.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDECBtnView.h"

#import "JDECButton.h"
#import "JDECOtherButton.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height


@interface JDECBtnView ()

@end

@implementation JDECBtnView

- (instancetype)initWithCreidits:(NSArray *)creidits Moneys:(NSArray *)moneys Frame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.creidits = creidits;
        self.moneys = moneys;
        
        [self addChildViews];
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//        [self addChildViews];
//        
//    }
//    return self;
//}

-(void)addChildViews
{
    NSInteger count = self.creidits.count;
    
    for (int i = 0; i < count; i++) {
        
        
        if ([[self.creidits[i] description] isEqualToString:@"other"]) {
            JDECOtherButton *button = [[JDECOtherButton alloc] init];
            [self addSubview:button];
            button.tag = i;
            [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        }else {
            JDECButton *btn = [[JDECButton alloc] init];
            
            btn.credits = [self.creidits[i] description];
            btn.money = [self.moneys[i] description];
            btn.tag = i;
            
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:btn];
        }
        
    }
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat x = 0,y = 0,w = 0, h = 0;
    
    w = (ScreenW - 23*2-10)/3, h = w;
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[JDECButton class]]) {
            
            JDECButton *btn = (JDECButton *)view;
            
            NSInteger index = btn.tag;
            // 列  行
            CGFloat col = index % 3, row = index / 3;
            
            x = (w+23)*col+5,y = (h+10)*row;
            
            [btn setFrame:CGRectMake(x, y, w, h)];
            
        }
        
        if ([view isKindOfClass:[JDECOtherButton class]]) {
            JDECOtherButton *btn = (JDECOtherButton *)view;
            
            [btn setFrame:CGRectMake((w+23)*1+5, (h+10)*2, w, h)];
        }
    }
    
}

-(void)clickBtn:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(ECBtnClickIndex:)]) {
        [_delegate ECBtnClickIndex:sender.tag];
    }
}

-(CGFloat)Height
{
    CGFloat height = 0.0;
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[JDECButton class]]) {
            
            JDECButton *btn = (JDECButton *)view;
            
            height = CGRectGetMaxY(btn.frame)+34;
        }
    }
    
    return height;
}

@end
