//
//  JDInputPasswordView.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//  填写支付密码界面

#import "JDInputPasswordView.h"

#define Width self.bounds.size.width
#define Height self.bounds.size.height

@interface JDInputPasswordView () <UITextFieldDelegate>

@end

@implementation JDInputPasswordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.textField = [[UITextField alloc] init];
        self.textField.borderStyle = UITextBorderStyleNone;
        self.textField.tintColor = [UIColor clearColor];
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
        self.textField.delegate = self;
        self.textField.textColor = [UIColor clearColor];
        [self.textField setReturnKeyType:UIReturnKeyDefault];
        [self addSubview:self.textField];
        
        for (int i = 0; i < 6; i++) {
            
            UIButton *box = [UIButton buttonWithType:UIButtonTypeCustom];
            _inputButton = box;
            box.layer.borderColor = [UIColor blackColor].CGColor;
            box.layer.borderWidth = 1.0;
            box.tag = i;
            [self addSubview:box];
            
        }
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textField.frame = CGRectMake(0, 0, Width, Height); // 宽高不重要
    
    CGFloat w = Width/6, h = Height;
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            
            NSInteger index = btn.tag;
            
            CGFloat x = index*w-index, y = 0;
            
            [btn setFrame:CGRectMake(x, y, w, h)];
            
        }
    }
    
}

#pragma mark textfield

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%ld---%ld---%@",range.length,range.location,string);
    //如果超过6字，就会禁止输入
    NSInteger loc =  range.location;
    NSInteger len = range.length;
    
    if (len>0) { // 删除的时候调用
        
//        if (loc==0) {
//            [self removePointOnButton:0];
//            return NO;
//        }else{
            [self removePointOnButton:loc];
//        }
        return YES;
    }else {
        if (loc>5) {
            return NO;
        }else if (loc == 5){
            [self addPointOnButton:loc];
            NSString *text = [NSString stringWithFormat:@"%@%@",self.textField.text,string];
            if ([_delegate respondsToSelector:@selector(inputViewDidEndInputPassword:)]) {
                    [_delegate inputViewDidEndInputPassword:text];
                }
        }else if (loc < 5){
            [self addPointOnButton:loc];
        }
    }
    
//    NSString *text = [NSString stringWithFormat:@"%@%@",self.textField.text,string];
//    
//    NSLog(@"\n%@---%@",text,self.textField.text);
//    
//    if (loc==5) {
//        
//        [self addPointOnButton:loc];
//        if (len>0) { // 删除的时候调用
//            [self removePointOnButton:loc];
//            return YES;
//        }
//        
//        if ([_delegate respondsToSelector:@selector(inputViewDidEndInputPassword:)]) {
//            [_delegate inputViewDidEndInputPassword:text];
//        }
//
//        return YES;
//    }else if (loc>5) {
//        
//        if (len>0) { // 删除的时候调用
//            [self removePointOnButton:loc];
//            return YES;
//        }
//        
//        return NO;
//    }else if(loc<5){
//
//        [self addPointOnButton:loc];
//        if (len>0) { // 删除的时候调用
//            
//            [self removePointOnButton:loc];
//            
//        }
//        
//        return YES;
//    }
    
    return YES;
}

-(void)removePoint
{
    for (int i = 0; i<6; i++) {
        [self removePointOnButton:i];
        self.textField.text = @"";
    }
}

//
-(void)addPointOnButton:(NSInteger)index
{
    UIButton *btn = (UIButton *)[self viewWithTag:index];
    
    CGFloat wh = 12 , x = (Width/6 - wh)/2, y = x;
    
    UIImageView *point = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, wh, wh)];
    point.backgroundColor = [UIColor blackColor];
    point.layer.cornerRadius = 6;
    
    [btn addSubview:point];
  
}

-(void)removePointOnButton:(NSInteger)index
{
    UIButton *btn = (UIButton *)[self viewWithTag:index];
//    NSLog(@"%@",btn.subviews);
//    [btn.subviews[0] removeFromSuperview];
    
    for (UIView *view in btn.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            UIImageView *imageV = (UIImageView *)view;
            [imageV removeFromSuperview];
        }
    }
    
}

@end
