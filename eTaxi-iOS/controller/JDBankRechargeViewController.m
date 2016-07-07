//
//  JDBankRechargeViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDBankRechargeViewController.h"

#import "HeadFile.pch"

#import "JDInputPasswordView.h"

@interface JDBankRechargeViewController () <JDInputPassDelegate>

@property (nonatomic, weak)JDInputPasswordView *inputView;

@end

@implementation JDBankRechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addNavigationBar:@"银行卡充值"];
    
    JDInputPasswordView *inputView = [[JDInputPasswordView alloc] initWithFrame:CGRectMake(18, 44, JDScreenSize.width-36, (JDScreenSize.width-36)/6)];
    _inputView = inputView;
    inputView.delegate = self;
    [self.bottomView addSubview:inputView];
    
}

-(void)inputViewDidEndInputPassword:(NSString *)password
{
    JDLog(@"密码输入完成---%@",password);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_inputView.textField becomeFirstResponder];
}


@end
