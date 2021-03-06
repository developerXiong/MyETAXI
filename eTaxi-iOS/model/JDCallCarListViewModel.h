//
//  JDCallCarListViewModel.h
//  eTaxi-iOS
//
//  Created by jeader on 16/4/23.
//  Copyright © 2016年 jeader. All rights reserved.
//  

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JDCallCarData;
@interface JDCallCarListViewModel : NSObject

@property (nonatomic, strong) JDCallCarData *callCarData;

@property (nonatomic, assign) CGRect statuViewFrame;

/**
 *  联系方式Label
 */
@property (nonatomic, assign) CGRect phoneNoLabelFrame;
/**
 *  出发时间label
 */
@property (nonatomic, assign) CGRect goTimeLabelFrame;
/**
 *  上车地点label
 */
@property (nonatomic, assign) CGRect addressLabelFrame;
/**
 *  目的地label
 */
@property (nonatomic, assign) CGRect destinationLabelFrame;


/**
 *  联系方式
 */
@property (nonatomic, assign) CGRect phoneNoFrame;

@property (nonatomic, assign) CGRect callPhoneFrame;
/**
 *  出发时间
 */
@property (nonatomic, assign) CGRect goTimeFrame;
/**
 *  上车地点
 */
@property (nonatomic, assign) CGRect addressFrame;
/**
 *  目的地
 */
@property (nonatomic, assign) CGRect destinationFrame;
/**
 *  cellHeight
 */
@property (nonatomic, assign) CGFloat cellHeight;

@end
