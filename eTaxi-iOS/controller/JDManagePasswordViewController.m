//
//  JDManagePasswordViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/28.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDManagePasswordViewController.h"

#import "HeadFile.pch"

@interface JDManagePasswordViewController ()
{
    NSArray *sections;
}
@end

@implementation JDManagePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addNavigationBar:@"支付密码" LeftButtonAction:@selector(backToSetting)];
    
    sections = @[@"修改支付密码",@"找回支付密码"];
    
    self.tableView.rowHeight = 60;
}

// 点击返回按钮调用
-(void)backToSetting
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark tableView delegate datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return sections.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mpCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mpCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    cell.textLabel.text = sections[indexPath.row];
    
    return cell;
}


@end
