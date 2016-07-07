//
//  JDInputPassFirstViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/28.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDInputPassFirstViewController.h"

#import "JDInputPasswordView.h"

#import "HeadFile.pch"
#import "JDInputPassAgainViewController.h"

@interface JDInputPassFirstViewController () <JDInputPassDelegate>

@property (nonatomic, weak) JDInputPasswordView *inputView;

@end

@implementation JDInputPassFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addNavigationBar:@"支付密码"];
    
    CGFloat x = 26, y = 0, w = JDScreenSize.width-2*x, h = w/6;
    JDInputPasswordView *inputView = [[JDInputPasswordView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    _inputView = inputView;
    inputView.delegate = self;
    [self.inputPassView addSubview:inputView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_inputView removePoint];
    [_inputView.textField becomeFirstResponder];
}

#pragma mark - 输密码框的delegate
-(void)inputViewDidEndInputPassword:(NSString *)password
{
    JDInputPassAgainViewController *passVc = [[JDInputPassAgainViewController alloc] init];
    
    passVc.password = password;
    
    [self.navigationController pushViewController:passVc animated:YES];
}

@end
