//
//  JDOrderListBottomView.h
//  eTaxi-iOS
//
//  Created by jeader on 16/6/17.
//  Copyright © 2016年 jeader. All rights reserved.
//  接单列表的cell的底部视图

#import <UIKit/UIKit.h>

@protocol JDOrderListDetegate <NSObject>

@optional
/**
 *  点击乘客已上车
 */
-(void)orderListClickOnCarAtIndexPath:(NSIndexPath *)indexPath;
/**
 *  点击在线支付
 */
-(void)orderListClickOnlinePayAtIndexPath:(NSIndexPath *)indexPath;
/**
 *  点击现金支付
 */
-(void)orderListClickMoneyPayAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface JDOrderListBottomView : UIView

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, weak) id<JDOrderListDetegate>delegate;

-(void)showPayStyleView;

@end
