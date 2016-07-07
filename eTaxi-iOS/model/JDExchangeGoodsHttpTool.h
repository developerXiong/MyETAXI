//
//  JDExchangeGoodsHttpTool.h
//  eTaxi-iOS
//
//  Created by jeader on 16/6/17.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface JDExchangeGoodsHttpTool : NSObject

+(void)getExchangeGoods:(UIViewController *)Vc success:(void(^)(NSMutableArray *modelArr))success failure:(void(^)(NSError *error))failure;

@end
