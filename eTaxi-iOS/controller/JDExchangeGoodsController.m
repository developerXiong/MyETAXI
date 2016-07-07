//
//  JDExchangeGoodsController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/17.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDExchangeGoodsController.h"

#import "PeccCell.h"
#import "JDNoMessageView.h"

#import "JDExchangeGoodsHttpTool.h"
#import "JDUsingRecordData.h"

#import "UIImageView+WebCache.h"

#import "JDUsingRecordDetailViewController.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height


@interface JDExchangeGoodsController ()
/**
 *  装模型的数组
 */
@property (nonatomic, strong) NSMutableArray *modelArr;
@end

@implementation JDExchangeGoodsController

-(NSMutableArray *)modelArr
{
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 配置tableview
    [self configureTableView];
    
    // 网络请求
    [self networkRequest];
    
}

-(void)networkRequest
{
    [JDExchangeGoodsHttpTool getExchangeGoods:self success:^(NSMutableArray *modelArr) {
        
        if (modelArr.count==0) {
            JDNoMessageView *messView = [[JDNoMessageView alloc] initWithFrame:CGRectMake(0, 64, Width, Height-64)];
            messView.message = @"当前没有已兑换的物品!";
        }else {
            [self.modelArr addObjectsFromArray:modelArr];
            [self.tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)configureTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Width, Height-64) style:UITableViewStylePlain];
    self.tableView.separatorStyle = 0;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.modelArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 93;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID =@"cell2";
    PeccCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"PeccCell" owner:nil options:nil]objectAtIndex:1];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    JDUsingRecordData *data = self.modelArr[indexPath.row];
    
    //    if ([data.useStatus intValue]) { // 已经兑换过的物品栏显示灰色
    //        cell.goodsName.textColor = [UIColor grayColor];
    //        cell.goodsTime.textColor = [UIColor grayColor];
    //        cell.goodsPoint.textColor = [UIColor grayColor];
    //    }else{
    //        cell.goodsName.textColor = [UIColor blackColor];
    //        cell.goodsTime.textColor = [UIColor blackColor];
    //        cell.goodsPoint.textColor = [UIColor blackColor];
    //    }
    
    cell.goodsName.text=data.costName;
    cell.goodsTime.text=data.updateDate;
    cell.goodsPoint.text=[NSString stringWithFormat:@"%@积分",data.cost];
    //通过本地的存储找到 相对应的图片
    [cell.goodsImg sd_setImageWithURL:[NSURL URLWithString:data.imageUrl] placeholderImage:[UIImage imageNamed:@"站位图80"]];
    
    return cell;
}

// 选中一栏单元格调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDUsingRecordData *data = self.modelArr[indexPath.row];

//    if (data.orderNo) {

        JDUsingRecordDetailViewController *detailVc = [[JDUsingRecordDetailViewController alloc] initWithRecordData:data];
        [self.navigationController pushViewController:detailVc animated:YES];

//    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
