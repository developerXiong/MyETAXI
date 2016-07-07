//
//  JDExchangeCreditsViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDExchangeCreditsViewController.h"

#import "HeadFile.pch"

#import "JDExchangeCreditsView.h"

#import "JDBackPointViewController.h"

#import "JDECBtnView.h"
#import "JDECOtherViewController.h"

@interface JDExchangeCreditsViewController () <JDECBtnDelegate>



@end

@implementation JDExchangeCreditsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addNavigationBar:@"兑换积分"];
    
    [self addRightBtnWithTitle:@"返点记录" font:12 action:@selector(clickRightBtn)];
    
    self.view.backgroundColor = COLORWITHRGB(237, 237, 237, 1);
    
    JDExchangeCreditsView *ecView = [[JDExchangeCreditsView alloc] initWithFrame:CGRectMake(0, 64, JDScreenSize.width, JDScreenSize.height-64)];
    [self.view addSubview:ecView];
    
    ecView.btnView.delegate = self;
    
}

#pragma mark btn view delegate
-(void)ECBtnClickIndex:(NSInteger)index
{
    JDLog(@"click ==== %ld",index);
    
    JDECOtherViewController *otherVc = [[JDECOtherViewController alloc] init];
    
    [self.navigationController pushViewController:otherVc animated:YES];
}

// 点击navigationBar右侧按钮
-(void)clickRightBtn
{
    JDLog(@"click right button!!!");
    
    JDBackPointViewController *backVc = [[JDBackPointViewController alloc] init];
    
    [self.navigationController pushViewController:backVc animated:YES];
}





@end
