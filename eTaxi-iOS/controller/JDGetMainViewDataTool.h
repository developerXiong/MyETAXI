//
//  JDGetMainViewDataTool.h
//  eTaxi-iOS
//
//  Created by jeader on 16/4/7.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JDGetMainViewDataTool : NSObject

/**
 *  获取个人信息
 *
 *  @param VC      <#VC description#>
 *  @param plate   <#plate description#>
 *  @param engine  <#engine description#>
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
+(void)GetVipInfoWithVc:(UIViewController *)VC plate:(id)plate engine:(id)engine success:(void(^)(NSMutableDictionary *dictArr))success failure:(void(^)(NSError *error))failure;

/**
 *  自动登录调用
 *
 *  @param VC      <#VC description#>
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
+(void)autoLoginWithViewController:(UIViewController *)VC Success:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
