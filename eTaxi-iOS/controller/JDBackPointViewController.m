//
//  JDBackPointViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDBackPointViewController.h"

#import "HeadFile.pch"

#import "JDBackPointCell.h"

@interface JDBackPointViewController ()

@end

@implementation JDBackPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addNavigationBar:@"返点记录"];
    
}

#pragma mark table view datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDBackPointCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell = [[NSBundle mainBundle] loadNibNamed:@"JDBackPointCell" owner:nil options:nil][0];
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
