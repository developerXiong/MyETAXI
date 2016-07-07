//
//  JDExchangeGoodsHttpTool.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/17.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDExchangeGoodsHttpTool.h"

#import "HeadFile.pch"

#import "JDUsingRecordData.h"

@implementation JDExchangeGoodsHttpTool

+(void)getExchangeGoods:(UIViewController *)Vc success:(void (^)(NSMutableArray *))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"phoneNo"] = PHONENO;
    params[@"loginTime"] = LOGINTIME;
    
    
    [GetData getDataWithUrl:[NSString urlWithApiName:@"getExchangeGoods.json"] params:params ViewController:Vc success:^(id response) {
       
        JDLog(@"%@",response);
        
        NSInteger returnCode = [response[@"returnCode"] integerValue];
        
        if (returnCode == 0) {
            
            NSMutableArray *modelArr = [NSMutableArray array];
            NSArray *origialArr = response[@"IntegralGoods"];
            
            // 遍历原始数据数组
            for (NSDictionary *dataDict in origialArr) {
                
                // 字典转模型
                JDUsingRecordData *data = [JDUsingRecordData usingrecordDataWithDictionary:dataDict];
                // 将模型添加到模型数组
                [modelArr addObject:data];
                
            }
            
            if (success) {
                success(modelArr);
            }
            
        }
        
    } failure:^(NSError *error) {
        
    }];
}

@end
