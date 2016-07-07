//
//  JDECBtnView.h
//  eTaxi-iOS
//
//  Created by jeader on 16/6/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JDECBtnDelegate <NSObject>

@optional
-(void)ECBtnClickIndex:(NSInteger)index;

@end

@interface JDECBtnView : UIView

@property (nonatomic, strong) NSArray *creidits;

@property (nonatomic, strong) NSArray *moneys;

@property (nonatomic, assign) CGFloat Height;

@property (nonatomic, weak) id<JDECBtnDelegate>delegate;

-(instancetype)initWithCreidits:(NSArray *)creidits Moneys:(NSArray *)moneys Frame:(CGRect)frame;

@end
