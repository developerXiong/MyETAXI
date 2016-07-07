//
//  JDOrderListBottomView.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/17.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDOrderListBottomView.h"

#import "HeadFile.pch"

// 保存选择状态的key
//#define kSeletedStatuKey @"callcarSelectedStatuKey"

@interface JDOrderListBottomView ()

/**
 *  乘客已上车按钮
 */
@property (nonatomic, strong) UIButton *onCar;


/*******付款方式按钮*******/
@property (nonatomic, strong) UILabel *payStyle;
/**
 *  在线支付
 */
@property (nonatomic, strong) UIButton *onlinePay;
/**
 *  现金支付
 */
@property (nonatomic, strong) UIButton *moneyPay;
/**
 *  等待支付
 */
@property (nonatomic, strong) UILabel *waitPay;

@end

@implementation JDOrderListBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpAllChildViews];
        self.backgroundColor = [UIColor whiteColor];
        
        
    }
    return self;
}

-(void)setUpAllChildViews
{
    // 乘客已上车
    _onCar = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_onCar];
    [_onCar addTarget:self action:@selector(clickOnCar:) forControlEvents:UIControlEventTouchUpInside];
    _onCar.layer.cornerRadius = 5.0;
    [_onCar setTitle:@"乘客已上车" forState:UIControlStateNormal];
    [_onCar setBackgroundColor:COLORWITHRGB(250, 58, 58, 1)];
    
    // 支付方式
    _payStyle = [[UILabel alloc] init];
    [self addSubview:_payStyle];
    _payStyle.text = @"车资结算方式";
    _payStyle.textColor = [UIColor blackColor];
    _payStyle.font = [UIFont systemFontOfSize:14];
    
    // 在线支付
    _onlinePay = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_onlinePay];
    _onlinePay.layer.cornerRadius = 5.0;
    [_onlinePay setTitle:@"在线支付" forState:UIControlStateNormal];
    [_onlinePay setBackgroundColor:COLORWITHRGB(58, 130, 250, 1)];
    [_onlinePay addTarget:self action:@selector(clickOnlinePay) forControlEvents:UIControlEventTouchUpInside];
    
    // 现金支付
    _moneyPay = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_moneyPay];
    _moneyPay.layer.cornerRadius = 5.0;
    [_moneyPay setTitle:@"现金支付" forState:UIControlStateNormal];
    [_moneyPay setBackgroundColor:COLORWITHRGB(250, 58, 58, 1)];
    [_moneyPay addTarget:self action:@selector(clickMoneyPay) forControlEvents:UIControlEventTouchUpInside];
    
    // 等待支付
    _waitPay = [[UILabel alloc] init];
    [self addSubview:_waitPay];
    _waitPay.text = @"等待乘客付款...";
    _waitPay.textAlignment = NSTextAlignmentCenter;
    _waitPay.font = [UIFont systemFontOfSize:14];
    
    
    [self showOnCarView];
    
//    NSInteger statu = [[NSUserDefaults standardUserDefaults] integerForKey:kSeletedStatuKey];
//    switch (statu) {
//        case 0:
//        {
//            // 显示乘客已上车
//            [self showOnCarView];
//        }
//            break;
//        case 1:
//        {
//            // 显示支付方式界面
//            [self showPayStyleView];
//        }
//            break;
//        case 2:
//        {
//            // 显示等待支付
//            [self showWaitPayView];
//        }
//            break;
//            
//        default:
//            break;
//    }
    
}

// 显示乘客已上车
-(void)showOnCarView
{
    _payStyle.hidden = YES;
    _onlinePay.hidden = YES;
    _moneyPay.hidden = YES;
    _waitPay.hidden = YES;
    
    _onCar.hidden = NO;
}
// 显示支付方式
-(void)showPayStyleView
{
    _payStyle.hidden = NO;
    _onlinePay.hidden = NO;
    _moneyPay.hidden = NO;
    
    _waitPay.hidden = YES;
    _onCar.hidden = YES;
}
// 显示等待支付界面
-(void)showWaitPayView
{
    _payStyle.hidden = YES;
    _onlinePay.hidden = YES;
    _moneyPay.hidden = YES;
    _onCar.hidden = YES;
    
    _waitPay.hidden = NO;
}

-(void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_onCar setFrame:CGRectMake((self.bounds.size.width-120)/2, 13-5, 120, 44)];
    
    _payStyle.frame = CGRectMake(20, 25-5, [self textWidthWithHeight:20 textFont:[UIFont systemFontOfSize:14] Sting:@"车资结算方式"], 20);
    
    [_onlinePay setFrame:CGRectMake(CGRectGetMaxX(_payStyle.frame)+12, 12-5, 80, 44)];
    
    [_moneyPay setFrame:CGRectMake(CGRectGetMaxX(_onlinePay.frame)+10, 12-5, 80, 44)];
    
    _waitPay.frame = self.bounds;
}

// 点击乘客已上车
-(void)clickOnCar:(UIButton *)sender
{
//    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:kSeletedStatuKey];
    if ([_delegate respondsToSelector:@selector(orderListClickOnCarAtIndexPath:)]) {
        [_delegate orderListClickOnCarAtIndexPath:_indexPath];
        
    }
//    [self showPayStyleView];
}
// 点击在线支付
-(void)clickOnlinePay
{
//    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:kSeletedStatuKey];
    
    if ([_delegate respondsToSelector:@selector(orderListClickOnlinePayAtIndexPath:)]) {
        [_delegate orderListClickOnlinePayAtIndexPath:_indexPath];
    }
    [self showWaitPayView];
    
}
// 点击现金支付
-(void)clickMoneyPay
{
    
    if ([_delegate respondsToSelector:@selector(orderListClickMoneyPayAtIndexPath:)]) {
        [_delegate orderListClickMoneyPayAtIndexPath:_indexPath];
    }
}

-(CGFloat)textWidthWithHeight:(CGFloat)height textFont:(UIFont *)font Sting:(NSString *)str
{
    CGFloat width = 0;
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    width = rect.size.width;
    
    return width;
}

@end
