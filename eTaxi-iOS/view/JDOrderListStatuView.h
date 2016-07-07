//
//  JDOrderListStatuView.h
//  eTaxi-iOS
//
//  Created by jeader on 16/7/2.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    JDOrderListStatuNow = 0,
    JDOrderListStatuFuture,
    JDOrderListStatuOncar
    
}orderStatu;

@interface JDOrderListStatuView : UIView

@property (nonatomic, assign) orderStatu orderStatu;

@end
