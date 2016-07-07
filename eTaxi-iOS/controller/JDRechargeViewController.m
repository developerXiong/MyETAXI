//
//  JDRechargeViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDRechargeViewController.h"

#import "JDRechargeCell.h"

#import "HeadFile.pch"

#import "JDBankRechargeViewController.h"

@interface JDRechargeViewController ()

@end

@implementation JDRechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addNavigationBar:@"充 值"];
}


#pragma mark table datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDRechargeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell = [[NSBundle mainBundle]loadNibNamed:@"JDRechargeCell" owner:nil options:nil][0];
    
    switch (indexPath.section) { // section
        case 0: // pay style
        {
            switch (indexPath.row) { // row
                case 0: // zhifubao
                {
                    cell = [[NSBundle mainBundle]loadNibNamed:@"JDRechargeCell" owner:nil options:nil][0];
                    cell.chooseBank.hidden = YES;
                    cell.titleLabel.text = @"支付宝";
                    cell.BackButton.tag = indexPath.row;
                    [cell.BackButton addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchUpInside];
                    
                }
                    break;
                case 1: // bank card
                {
                    cell = [[NSBundle mainBundle]loadNibNamed:@"JDRechargeCell" owner:nil options:nil][0];
                    cell.titleLabel.text = @"银行卡";
                    cell.BackButton.tag = indexPath.row;
                    cell.SelectImageV.image = NoSelectImage;
                    cell.chooseBank.tintColor = [UIColor clearColor];
                    [cell.BackButton addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchUpInside];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1: // recharge number
        {
            cell.BackButton.hidden = YES;
            cell.SelectImageV.hidden = YES;
            cell.titleLabel.text = @"金额";
            cell.chooseBank.text = @"";
            cell.chooseBank.placeholder = @"请填写金额";
        }
            break;
        case 2: // commit button
        {
            cell.titleLabel.hidden = YES;
            cell.chooseBank.hidden = YES;
            cell.SelectImageV.hidden = YES;
            cell.BackButton.hidden = YES;
            
            tableView.separatorStyle = 0;
            cell.backgroundColor = COLORWITHRGB(237, 237, 237, 1);
            
            UIButton *commitButton = [self addCommitButton];
            [cell.contentView addSubview:commitButton];
        }
            break;
            
        default:
            break;
    }
    
    cell.selectionStyle = 0;
    
    return cell;
    
}
-(UIButton *)addCommitButton
{
    UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [commitButton setFrame:CGRectMake(40, 0, JDScreenSize.width-80, 50)];
    commitButton.layer.cornerRadius = 5.0;
    [commitButton setBackgroundColor:COLORWITHRGB(0, 91, 201, 1)];
    [commitButton setTitle:@"确认充值" forState:UIControlStateNormal];
    commitButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [commitButton addTarget:self action:@selector(clickCommitButton) forControlEvents:UIControlEventTouchUpInside];
    
    return commitButton;
}
// 点击确认充值按钮
-(void)clickCommitButton
{
    JDLog(@"click commit button!!!");
    
    // 调转到银行卡充值界面
    JDBankRechargeViewController *bankVc = [[JDBankRechargeViewController alloc] init];
    [self.navigationController pushViewController:bankVc animated:YES];
}
// 点击选择支付宝or银行卡按钮
-(void)clickBackButton:(UIButton *)sender
{
    JDLog(@"click back button---%ld",sender.tag);
    for (NSInteger i = 0; i<2; i++) {
        JDRechargeCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (i==sender.tag) {
            cell.SelectImageV.image = SelectImage;
        }else {
            cell.SelectImageV.image = NoSelectImage;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==2) {
        return 50;
    }
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2) {
        return 50;
    }
    return 56;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return @"支付方式";
    }
    if (section==1) {
        return @"充值金额";
    }
    return nil;
}

#pragma mark 让textfield失去第一响应
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self textFieldResignFirstResponser];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self textFieldResignFirstResponser];
}

-(void)textFieldResignFirstResponser
{
    JDRechargeCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    JDRechargeCell *cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    
    [cell.chooseBank resignFirstResponder];
    [cell1.chooseBank resignFirstResponder];
}

@end
