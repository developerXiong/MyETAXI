//
//  JDInputPasswordView.h
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JDInputPassDelegate <NSObject>

@optional
-(void)inputViewDidEndInputPassword:(NSString *)password;

@end

@interface JDInputPasswordView : UIView

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, weak) id<JDInputPassDelegate>delegate;

@property (nonatomic, weak) UIButton *inputButton;

-(void)removePoint;

@end
