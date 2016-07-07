//
//  JDWriteCardInfoViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/23.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDWriteCardInfoViewController.h"

#import "HeadFile.pch"

#import "JDWriteCardInfoCell.h"

#import "JDWriteCarNumViewController.h"

#define XieyiGou [UIImage imageNamed:@"xieyi_gou"]
#define XieyiNoGou [UIImage imageNamed:@"xieyi_no_gou"]

@interface JDWriteCardInfoViewController ()

@end

@implementation JDWriteCardInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 添加tableview
    [self addTableView];
    
    
}

-(void)addTableView
{
    [self addNavigationBar:@"填写卡信息"];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, JDScreenSize.width, JDScreenSize.height-64) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = 0;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section==0) {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JDWriteCardInfoCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.section == 0||1) {
        
        cell = [[NSBundle mainBundle] loadNibNamed:@"JDWriteCardInfoCell" owner:nil options:nil][0];
        cell.titleLabel.text = @"姓名";
        
        cell.detailTextField.text = @"fujianxiang";
    }
    
    if (indexPath.section==2) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"JDWriteCardInfoCell" owner:nil options:nil][1];
        
//        [cell.nextButton addTarget:self action:@selector(clickNextButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    cell.selectionStyle = 0;
    
    // Configure the cell...
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==2) {
        return 144/2;
    }
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
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
        return @"银行卡信息";
    } else if (section==1){
        return @"请填写银行预留信息";
    }
    return nil;
}

// 用户协议
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==2) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JDScreenSize.width, 30)];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(18, 7, 15, 15)];
        [btn setBackgroundImage:XieyiNoGou forState:UIControlStateNormal];
        [view addSubview:btn];
        btn.selected = YES;
        [btn addTarget:self action:@selector(clickSeletImage:) forControlEvents:UIControlEventTouchUpInside];
        
        // label
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame)+5, 0, 100, 30)];
        label.font = [UIFont systemFontOfSize:14];
        label.text = @"我已阅读并同意";
        [view addSubview:label];
        
        UIButton *proptol = [UIButton buttonWithType:UIButtonTypeCustom];
        [proptol setFrame:CGRectMake(CGRectGetMaxX(label.frame), 0, 120, 30)];
        [proptol setTitle:@"《用户服务协议》" forState:UIControlStateNormal];
        [proptol setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        proptol.titleLabel.font = [UIFont systemFontOfSize:14];
        [view addSubview:proptol];
        
        
        return view;
        
    }
    return nil;
}

-(void)clickSeletImage:(UIButton *)sender
{
    if (sender.selected) { // 选中状态
        [sender setBackgroundImage:XieyiGou forState:UIControlStateNormal];
    }else{
        [sender setBackgroundImage:XieyiNoGou forState:UIControlStateNormal];
    }
    
    sender.selected =! sender.selected;
}

#pragma mark textfield失去第一响应
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2&&indexPath.row==0) {
        
        JDWriteCarNumViewController *numVc = [[JDWriteCarNumViewController alloc] init];
        
        [self.navigationController pushViewController:numVc animated:YES];
    }
    
    [self textFieldResignFirstResponder:tableView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UITableView *tableView = (UITableView *)scrollView;
    
    [self textFieldResignFirstResponder:tableView];
    
}

-(void)textFieldResignFirstResponder:(UITableView *)tableView
{
    for (UITableViewCell *cell in tableView.visibleCells) {
        
        if ([cell isKindOfClass:[JDWriteCardInfoCell class]]) {
            
            JDWriteCardInfoCell *cell1 = (JDWriteCardInfoCell *)cell;
            
            [cell1.detailTextField resignFirstResponder];
        }
        
    }
}

// 点击下一步调用
//-(void)clickNextButton:(UIButton *)sender
//{
//    
//}

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
