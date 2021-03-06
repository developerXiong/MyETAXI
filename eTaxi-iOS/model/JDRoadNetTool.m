//
//  JDRoadNetTool.m
//  eTaxi-iOS
//
//  Created by jeader on 16/4/9.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDRoadNetTool.h"

#import "HeadFile.pch"
#import "JDRoadDataTool.h"
#import "JDRoadData.h"
#import "JDIsNetwork.h"

@implementation JDRoadNetTool

+(void)roadDataInVC:(UIViewController *)Vc Success:(void (^)(NSMutableArray *))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"type"] = @"1"; //请求申报记录
    params[@"phoneNo"] = PHONENO;
    params[@"password"] = PASSWORD;
    params[@"loginTime"] = LOGINTIME;
    
    [GetData getDataWithUrl:[NSString urlWithApiName:@"getLostAndRoadRecord.json"] params:params success:^(id response) {
        
//        NSLog(@"%@",response);
        
        int returnCode = [response[@"returnCode"] intValue];
        
        NSArray *dictArr = (NSArray *)response[@"roadArr"];
        
        NSMutableArray *dataArr = [NSMutableArray array];
        if (returnCode == 0) {
            
            NSInteger count = 0;
            // 只取100条数据
            if (dictArr.count<=100) {
                
                count = dictArr.count;
                
            }else{
                
                count = 100;
                
            }
            
            for (int i = 0; i < count; i++) {
                
                NSDictionary *dict = (NSDictionary *)response[@"roadArr"][i];
                
                JDRoadData *roadData = [JDRoadData roadDataWithDict:dict];
                
                [dataArr addObject:roadData];
                
            }
            
            success(dataArr);
            
        }else if(returnCode ==2){//强制退出
            
            [GetData addAlertViewInView:Vc title:@"温馨提示" message:[NSString stringWithFormat:@"%@",response[@"msg"]] count:0 doWhat:^{
                
                /**
                 *  执行强制退出
                 */
                PersonalVC *p = [[PersonalVC alloc] init];
                [p removeFileAndInfo];
                
            }];
            
        }
        
        
    } failure:^(NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}

//上传路况信息
+(void)sendRoadDataInVC:(UIViewController *)Vc RoadType:(NSString *)styleStr image:(UIImage *)image location:(CLLocation *)location Success:(void (^)())success failure:(void (^)(NSError *))failure
{
    CLGeocoder *geocder = [[CLGeocoder alloc] init];
    
    [geocder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        //        NSLog(@"placemarks----%@",placemarks);
        
        if (placemarks) {
            
            CLPlacemark *placemark = [placemarks firstObject];
            
            NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
            fmt.dateFormat = @"YYYY/MM/dd HH:mm:ss";
            
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            params[@"phoneNo"] = PHONENO;
            params[@"password"] = PASSWORD;
            params[@"loginTime"] = LOGINTIME;
            params[@"role"] = @"0";
            params[@"trafficType"] = styleStr;
            params[@"trafficTime"] = [fmt stringFromDate:[NSDate date]];
            //            params[@"trafficTime"] = (NSString *)[NSDate date];
            params[@"longitude"] = [NSString stringWithFormat:@"%f",location.coordinate.longitude];
            params[@"latitude"] = [NSString stringWithFormat:@"%f",location.coordinate.latitude];
            params[@"address"] = placemark.thoroughfare;
            
            //            NSLog(@"time--->%@",[fmt stringFromDate:[NSDate date]]);
            //            NSLog(@"addStr---->%@",placemark.name);
            //            NSLog(@"经度%f---维度%f",self.coordinate.longitude,self.coordinate.latitude);
            if (![JDIsNetwork sharedInstance]) {
                
                [GetData addAlertViewInView:Vc title:@"温馨提示" message:@"网络无连接" count:0 doWhat:^{
                    
                }];
                
            }else{
                
                [GetData addMBProgressWithView:Vc.view style:0];
                [GetData showMBWithTitle:@"正在提交"];
                //2秒延时之后隐藏MB
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [GetData hiddenMB];
                });
                
                NSString *url = @"trafficReport.json";
                
                [GetData postDataWithUrl:[NSString urlWithApiName:url] params:params imageDatas:@[image] success:^(id response) {
                    
                    int returnCode = [response[@"returnCode"] intValue];
                    
                    if (returnCode == 0) {
                        
                        [GetData hiddenMB];
                        
                        [GetData addAlertViewInView:Vc title:@"温馨提示" message:@"上传成功！感谢您的参与！" count:0 doWhat:^{
                            
                            
                            
                        }];
                        
                        success();
                        
                    }else if(returnCode == 2){
                        
                        [GetData addAlertViewInView:Vc title:@"温馨提示" message:[NSString stringWithFormat:@"%@",response[@"msg"]] count:0 doWhat:^{
                            
                            /**
                             *  执行强制退出
                             */
                            PersonalVC *p = [[PersonalVC alloc] init];
                            [p removeFileAndInfo];
                        }];
                        
                    }else{

                        
                        [GetData hiddenMB];
                        [GetData addAlertViewInView:Vc title:@"温馨提示" message:[NSString stringWithFormat:@"%@",response[@"msg"]] count:0 doWhat:^{
                            
                        }];
                    }
                    
                } failure:^(NSError *error) {
                    
                    //            NSLog(@"%@",error);
                    
                    if (error) {
                        
                        failure(error);
                        [GetData addAlertViewInView:Vc title:@"温馨提示" message:@"上传失败！" count:0 doWhat:^{
                            
                        }];
                    }
                    
                    
                }];
                
                
            }
            
            
        }else{
            
            [GetData addAlertViewInView:Vc title:@"温馨提示" message:@"无法定位当前位置信息！" count:0 doWhat:^{
                
            }];
            
        }
        
    }];

}



    
    



@end
