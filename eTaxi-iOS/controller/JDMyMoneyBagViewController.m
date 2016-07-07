//
//  JDMyMoneyBagViewController.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/21.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDMyMoneyBagViewController.h"

#import "JDMyMoneyHeadView.h"

#import "HeadFile.pch"

@interface JDMyMoneyBagViewController ()
{
    NSDictionary *dataDict; // 接收plist的数据
    NSArray *sections; // 显示tableview的组
    NSArray *rows; // 显示tableview的行
}
@end

@implementation JDMyMoneyBagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 获取plist文件里面的数据
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"MyMoney" withExtension:@"plist"];
    dataDict = [NSDictionary dictionaryWithContentsOfURL:url];
    
    JDLog(@"%@",dataDict);
    // 初始化组
    sections = [dataDict objectForKey:@"sections"];
    
    [self addNavigationBar:@"我的钱包"];
    // 添加tableview
    [self addTableView];
    
}

-(void)addTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, JDScreenSize.width, JDScreenSize.height-64) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 16, 0, 0);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    rows = [sections objectAtIndex:section];
    return rows.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cellMoney";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = 0;
        
    }
    
    rows = [sections objectAtIndex:indexPath.section];
    
    NSDictionary *dict = rows[indexPath.row];
    
    // Configure the cell...
    // 设置图片
    cell.imageView.image = [UIImage imageNamed:[[dict objectForKey:@"image"] description]];
    // 设置主题
    cell.textLabel.text = [[dict objectForKey:@"title"] description];
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 122;
    }
    return 12;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        JDMyMoneyHeadView *headView = [[JDMyMoneyHeadView alloc] initWithFrame:CGRectMake(0, 0, JDScreenSize.width, 122)];
        
        return headView;
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Class cls = NSClassFromString([sections[indexPath.section][indexPath.row] objectForKey:@"class"]);
    
    JDLog(@"%@",cls);
    
    UIViewController *Vc = (UIViewController *)[[cls alloc] init];
    
    [self.navigationController pushViewController:Vc animated:YES];
    
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
