//
//  JDInputPassAgainViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/28.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDInputPassAgainViewController.h"

#import "JDInputPasswordView.h"
#import "HeadFile.pch"

#import "JDManagePasswordViewController.h"

@interface JDInputPassAgainViewController ()<JDInputPassDelegate>

@property (nonatomic, weak)JDInputPasswordView *inputView;

@end

@implementation JDInputPassAgainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationBar:@"支付密码"];
    
    CGFloat x = 26, y = 0, w = JDScreenSize.width-2*x, h = w/6;
    JDInputPasswordView *inputView = [[JDInputPasswordView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    _inputView = inputView;
    inputView.delegate = self;
    [self.inputPassView addSubview:inputView];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_inputView.textField becomeFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [_inputView.textField becomeFirstResponder];
    
}

#pragma mark - 输密码框的delegate
-(void)inputViewDidEndInputPassword:(NSString *)password
{
    if (![self.password isEqualToString:password]) {
        [GetData addAlertViewInView:self title:@"温馨提示" message:@"您两次输入的密码不一致，请重输" count:0 doWhat:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }else{ // 输入的密码一致
        [GetData addAlertViewInView:self title:@"温馨提示" message:@"密码设置成功" count:0 doWhat:^{
            JDManagePasswordViewController *MPVC = [[JDManagePasswordViewController alloc] init];
            [self.navigationController pushViewController:MPVC animated:YES];
        }];
    }
}


@end
