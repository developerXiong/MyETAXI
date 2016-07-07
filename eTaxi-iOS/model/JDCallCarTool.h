//
//  JDCallCarTool.h
//  eTaxi-iOS
//
//  Created by jeader on 16/4/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JDCallCarTool : NSObject

/**
 *  请求召车信息/接单
 *  
 *  @param type 请求的类型 0：请求召车信息，1：接单
 *  @param number 单子编号，，type为1 的时候必填
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+(void)getCallCarInfoWithType:(NSString *)type inVC:(UIViewController *)Vc Num:(NSString *)number Success:(void(^)(NSMutableArray *modelArr,int status))success failure:(void(^)(NSError *error))failure;

/**
 *  获取我的订单列表/消息列表
 *
 *  @param type    处理类型 2：获取当前已接单列表 3：已完成和已取消的订单数据（消息界面）
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+(void)getCallCarListWithType:(NSString *)type inVC:(UIViewController *)Vc Success:(void(^)(NSMutableArray *modelArr,int orderCount))success failure:(void(^)(NSError *error))failure;

/**
 *  请求订单完成的接口
 *
 *  @param type    0：表示现金支付，1：在线支付
 *  @param number 订单编号
 *  @param success
 *  @param failure 
 */
+(void)getCompleteOrderWithType:(NSString *)type number:(NSString *)number inVc:(UIViewController *)Vc success:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
