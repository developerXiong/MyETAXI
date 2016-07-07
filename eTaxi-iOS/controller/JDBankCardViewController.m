//
//  JDBankCardViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDBankCardViewController.h"

#import "HeadFile.pch"

#import "JDBankCardCell.h"
#import "JDWriteCardInfoViewController.h"

@interface JDBankCardViewController ()

@end

@implementation JDBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addNavigationBar:@"银行卡"];
    
    [self addRightBtnWithTitle:@"编辑" font:13 action:@selector(clickRightButton)];
    
    self.tableView.separatorStyle = 0;
}

-(void)clickRightButton
{
    JDLog(@"click right button");
}

#pragma mark table view datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDBankCardCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell = [[NSBundle mainBundle] loadNibNamed:@"JDBankCardCell" owner:nil options:nil][0];
    cell.selectionStyle = 0;
    
    if (indexPath.row==2) { // 3-1
        cell = [[NSBundle mainBundle] loadNibNamed:@"JDBankCardCell" owner:nil options:nil][1];
        [cell.addBankCardButton addTarget:self action:@selector(clickAddBankCard) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==2) {
        return 66+16;
    }
    return 110;
}

-(void)clickAddBankCard
{
    JDLog(@"click add bank card !!!");
    JDWriteCardInfoViewController *wcVc = [[JDWriteCardInfoViewController alloc] init];
    
    [self.navigationController pushViewController:wcVc animated:YES];
}

@end
