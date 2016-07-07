//
//  JDCallCarListViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/4/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDCallCarListViewController.h"

#import "JDOrderListCell.h"

#import "JDCallCarListViewModel.h"
#import "JDCallCarData.h"
#import "JDCallCarTool.h"

#import "JDOrderListImageView.h"
#import "JDOrderListBottomView.h"

#import "HeadFile.pch"

#import "MJRefresh.h"

#import "JDNoMessageView.h"

#define NowUseCarImage [UIImage imageNamed:@"现在用车_list"]
#define FeaUseCarImage [UIImage imageNamed:@"预约用车_list"]

@interface JDCallCarListViewController () <UITableViewDelegate,UITableViewDataSource,JDOrderListDetegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *modelArr;

@end

@implementation JDCallCarListViewController

-(NSMutableArray *)modelArr
{
    if (_modelArr == nil) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableView];
    self.view.backgroundColor = COLORWITHRGB(216, 216, 216, 1);
    
}

- (void)setUpTableView
{
    self.tableView.rowHeight = [NowUseCarImage size].height + 12 + 9;
    self.tableView.separatorStyle = 0;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getData)];
    [self.tableView.mj_header beginRefreshing];
}

-(void)getData
{
    // 移除没有消息s时的界面
    for (UIView *view in self.tableView.subviews) {
        if ([view isKindOfClass:[JDNoMessageView class]]) {
            [view removeFromSuperview];
        }
    }
    
    [JDCallCarTool getCallCarListWithType:@"2" inVC:self Success:^(NSMutableArray *modelArr, int orderCount) {
        
        // 结束下拉刷新
        [self.tableView.mj_header endRefreshing];
        
        // 给模型数组赋值
        self.modelArr = modelArr;
        // 刷新单元格
        [self.tableView reloadData];
        
        if (modelArr.count==0) {
            
//            [GetData addMBProgressWithView:self.view style:1];
//            [GetData showMBWithTitle:@"当前没有接单!"];
//            [GetData hiddenMB];
            // 添加没有召车信息的界面
            JDNoMessageView *noMessView = [[JDNoMessageView alloc] initWithFrame:CGRectMake(0, 0, JDScreenSize.width, self.tableView.bounds.size.height*2/3)];
            noMessView.message = @"当前没有接单";
            [self.tableView addSubview:noMessView];
            
        }
        
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - tableView delegate & datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.modelArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    JDOrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[JDOrderListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" indexPath:indexPath];
        cell.selectionStyle = 0;
    }
    
    JDCallCarData *data = self.modelArr[indexPath.row];
    
    JDCallCarListViewModel *viewModel = [[JDCallCarListViewModel alloc] init];
    
    viewModel.callCarData = data;
    
    cell.viewModel = viewModel;
    
    cell.orderBottomView.delegate = self;
    
    JDLog(@"%@",data.orderStatus);
    if ([data.orderStatus isEqualToString:@"5"]) {
        [cell.orderBottomView showPayStyleView];
    }
    
//    if ([data.useType intValue]==0) { // 现在用车
//        
//        cell.orderImageView.image = NowUseCarImage;
//        
//    }else{ // 预约用车
//        
//        cell.orderImageView.image = FeaUseCarImage;
//        
//    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDCallCarData *data = self.modelArr[indexPath.section];
    
    JDCallCarListViewModel *viewModel = [[JDCallCarListViewModel alloc] init];
    
    viewModel.callCarData = data;
    
    return viewModel.cellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

#pragma mark order bottom view delegate
// 点击乘客已上车
-(void)orderListClickOnCarAtIndexPath:(NSIndexPath *)indexPath
{
    JDCallCarData *data = self.modelArr[indexPath.section];
    JDOrderListCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    
    [JDCallCarTool getCallCarInfoWithType:@"4" inVC:self Num:data.number Success:^(NSMutableArray *modelArr, int status) {
        
        [cell.orderBottomView showPayStyleView];
        
    } failure:^(NSError *error) {
        
       
    }];
    
}
// 点击现金支付
-(void)orderListClickMoneyPayAtIndexPath:(NSIndexPath *)indexPath
{
//    JDLog(@"%ld",(long)indexPath.section);
    
    JDCallCarData *data = self.modelArr[indexPath.section];
    
//    JDLog(@"click money pay!--%ld",(long)indexPath.section);
    [JDCallCarTool getCompleteOrderWithType:@"0" number:data.number inVc:self success:^{
       
//        JDLog(@"现金支付成功!");
        [GetData addAlertViewInView:self title:@"温馨提示" message:@"订单已完成！" count:0 doWhat:^{
//            [self.modelArr removeObjectAtIndex:indexPath.section];
//            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
            
            [self getData];
        }];
        
        
    } failure:^(NSError *error) {
        
    }];
}
// 点击在线支付
-(void)orderListClickOnlinePayAtIndexPath:(NSIndexPath *)indexPath
{
    JDCallCarData *data = self.modelArr[indexPath.section];
//    JDLog(@"click online pay!--%ld",(long)indexPath.section);
    JDLog(@"%@",data.number);
    // 请求在线支付接口
    [JDCallCarTool getCompleteOrderWithType:@"1" number:data.number inVc:self success:^{
        
//        JDLog(@"在线支付成功!");
        
    } failure:^(NSError *error) {
        
    }];
}

@end
