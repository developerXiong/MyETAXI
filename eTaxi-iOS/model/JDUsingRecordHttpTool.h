//
//  JDUsingRecordHttpTool.h
//  eTaxi-iOS
//
//  Created by jeader on 16/5/24.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface JDUsingRecordHttpTool : NSObject

/**
 *  请求所有积分支出情况接口
 *
 *  @param Vc      控制器
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+(void)getUsingRecordDataInVC:(UIViewController *)Vc success:(void(^)(NSArray *modelArr))success failure:(void(^)(NSError *error))failure;

@end
