//
//  JDCallCarTool.m
//  eTaxi-iOS
//
//  Created by jeader on 16/4/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDCallCarTool.h"

#import "HeadFile.pch"
#import "GetData.h"

#import "JDCallCarData.h"

#import "NSString+StringForUrl.h"

@implementation JDCallCarTool

+(void)getCallCarInfoWithType:(NSString *)type inVC:(UIViewController *)Vc Num:(NSString *)number Success:(void (^)(NSMutableArray *, int))success failure:(void (^)(NSError *))failure
{
    
//    params.phoneNo = PHONENO;
//    params.password = PASSWORD;
//    params.loginTime = LOGINTIME;
//    params.type = type;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"phoneNo"] = PHONENO;
    params[@"password"] = PASSWORD;
    params[@"loginTime"] = LOGINTIME;
    params[@"type"] = type;
    if ([type isEqualToString:@"1"]||[type isEqualToString:@"4"]) { // 接单和乘客已上车
//        params.number = number;
        params[@"number"] = number;
    }

    if (!PHONENO||!LOGINTIME) return;
    
    [GetData getDataWithUrl:[NSString urlWithApiName:@"getCallCarInfo.json"] params:params success:^(id response) {
       
        int returnCode = [response[@"returnCode"] intValue];
        
        JDLog(@"response--->%@",response);
        
        if (returnCode==0) {
            
            if ([type isEqualToString:@"0"]) { // 召车信息
                
                NSArray *dataArr = response[@"callCarInfoArr"];
                NSMutableArray *modelArr = [NSMutableArray array];
                
                for (NSDictionary *dict in dataArr) {
                    
                    JDCallCarData *data = [JDCallCarData callCarDataWithDictionary:dict];
                    
                    [modelArr addObject:data];
                }
                
                if (success) {
                    success(modelArr,10);
                }
                
            }else if([type isEqualToString:@"1"]){ // 接单
                
                // Status 0：接单成功 ，1：接单失败
                int status = [response[@"status"] intValue];
                
                if (success) {
                    success(nil,status);
                }
                
                JDLog(@"····%@",response);
                
            }else if([type isEqualToString:@"2"]){ // 请求当前已接单(废弃)
                
                JDLog(@"····%@",response);
                
            }else if([type isEqualToString:@"4"]){ // 乘客已上车
                if (success) {
                    success(nil,10);
                }
            }
                
           
        }else if (returnCode == 2){
            
            if (Vc == nil) return ;
            [GetData addAlertViewInView:Vc title:@"温馨提示" message:[NSString stringWithFormat:@"%@",response[@"msg"]] count:0 doWhat:^{
                
                /**
                 *  执行强制退出
                 */
                PersonalVC *p = [[PersonalVC alloc] init];
                [p removeFileAndInfo];
                
            }];
            
        }
      
     
    } failure:^(NSError *error) {
        
        JDLog(@"%@",error);
        if (error) {
            failure(error);
        }
        
    }];
    
}

+(void)getCallCarListWithType:(NSString *)type inVC:(UIViewController *)Vc Success:(void (^)(NSMutableArray *, int))success failure:(void (^)(NSError *))failure
{
    
    if (!PHONENO||!LOGINTIME) return;
    
//    JDCallCarParam *params = [[JDCallCarParam alloc] init];
//    params.phoneNo = PHONENO;
//    params.password = PASSWORD;
//    params.loginTime = LOGINTIME;
//    params.type = type;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"phoneNo"] = PHONENO;
    params[@"password"] = PASSWORD;
    params[@"loginTime"] = LOGINTIME;
    params[@"type"] = type;
    
    [GetData getDataWithUrl:[NSString urlWithApiName:@"getCallCarInfo.json"] params:params success:^(id response) {
        
        int returnCode = [response[@"returnCode"] intValue];
        
        JDLog(@"response--->%@----%@",response,[response[@"msg"] description]);
        
        if (returnCode==0) {
            
            NSArray *dataArr = response[@"callCarInfoArr"];
            NSMutableArray *modelArr = [NSMutableArray array];
            
            for (NSDictionary *dict in dataArr) {
                
                JDCallCarData *data = [JDCallCarData callCarDataWithDictionary:dict];
                
                [modelArr addObject:data];
            }
            
            int orderCount = 0;
            if ([type isEqualToString:@"2"]) { // 我的订单列表
                orderCount = [response[@"orderCount"] intValue];
            }
            
            if ([type isEqualToString:@"3"]) { // 获取消息列表
                if (modelArr.count>20) {
                    // 只取前20条数据
                    [modelArr removeObjectsInRange:NSMakeRange(20, modelArr.count-20)];
                }
                
                // 倒序排序
                modelArr = (NSMutableArray *)[[modelArr reverseObjectEnumerator] allObjects];
               
            }
            
            if (success) {
                success(modelArr,orderCount);
            }
            
        }else if (returnCode == 2){
            
            [GetData addAlertViewInView:Vc title:@"温馨提示" message:[NSString stringWithFormat:@"%@",response[@"msg"]] count:0 doWhat:^{
                
                /**
                 *  执行强制退出
                 */
                PersonalVC *p = [[PersonalVC alloc] init];
                [p removeFileAndInfo];
                
            }];
            
        }
        
        
    } failure:^(NSError *error) {
        
        JDLog(@"%@",error);
        
    }];
}

+(void)getCompleteOrderWithType:(NSString *)type number:(NSString *)number inVc:(UIViewController *)Vc success:(void (^)())success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"phoneNo"] = PHONENO;
    params[@"number"] = number;
    params[@"loginTime"] = LOGINTIME;
    params[@"type"] = type;
    
    [GetData getDataWithUrl:[NSString urlWithApiName:@"completeOrder.json"] params:params ViewController:Vc success:^(id response) {
       
        NSInteger returnCode = [response[@"returnCode"] integerValue];
        
        if (returnCode==0) {
            
            if (success) {
                success();
            }
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
