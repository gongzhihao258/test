//
//  ViewController.m
//  test
//
//  Created by 1 on 16/6/21.
//  Copyright © 2016年 1. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewCell.h"

#define UIColorFromRGB(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 *  声明表格属性
 */
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSArray *array;
@property(strong,nonatomic)NSArray *imageName;
@property(strong,nonatomic)NSArray *detailLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    self.array = @[@[@"王小美"],
                   @[@"购物车",@"我的收藏",@"消息通知",@"我的订单"],
                   @[@"我的抵用券",@"我的积分"],
                   @[@"设置"]];
    self.imageName = @[@[@"1.jpg"],
                       @[@"2",@"3",@"4",@"5"],
                       @[@"6",@"7"],@[@"nil"]];
    self.detailLabel = @[@[@""],
                         @[@"0",@"6",@"21",@"357个"],
                         @[@"5张",@"2765积分"],
                         @[@""]];
    
    self.view.backgroundColor = [UIColor  colorWithRed:243/255.0  green:243/255.0  blue:243/255.0 alpha:1.0];
    
//    self.view.backgroundColor = [UIColor yellowColor];
    
    // Do any additional setup after loading the view, typically from a nib.
}
/**
 *  初始化表格
 */
- (void)initView
{
    self.tableView = [[UITableView alloc]init];
    self.tableView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //self.tableView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [self tableViewFootView];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num;
    switch (section) {
        case 0:
            num = 1;
            break;
        case 1:
            num = 4;
            break;
        case 2:
            num = 2;
            break;
        case 3:
            num = 1;
            break;
            
        default:
            break;
    }
    return num;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return nil;
    }else{
    UIView *headView = [[UIView alloc]init];
    headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 10);
    headView.backgroundColor = [UIColor colorWithRed:243/255 green:243/255 blue:243/255 alpha:0.05];
    return headView;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section ==3) {
        return 0;
    }else
    {
        return 10;
    }
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    } else {
        return 44;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [TestTableViewCell tableView:tableView imageDataArray:self.imageName titleDataArray:self.array indexPath:indexPath];
    } else {
    
        NSString *identifier = @"reuseidenfier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        }
        cell.detailTextLabel.text = self.detailLabel[indexPath.section][indexPath.row];
        cell.detailTextLabel.textColor = [UIColor redColor];
        cell.textLabel.text = self.array[indexPath.section][indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.image = [UIImage imageNamed:self.imageName[indexPath.section][indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string1 = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    NSLog(@"%@",string1);
}
/**
 *  设置标尾
 *
 *  @return UIView对象
 */
- (UIView *)tableViewFootView
{
    UIView *footView = [[UIView alloc]init];
    footView.frame = CGRectMake(0, 0, self.view.frame.size.width,54);
//    footView.backgroundColor = [UIColor colorWithRed:243/255 green:243/255 blue:243/255 alpha:0.05];
    footView.backgroundColor = [UIColor clearColor];
    /**
     电话按钮
     */
    UIButton *dialButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, self.view.frame.size.width-20, 44)];
    [dialButton setTitle:@"服务热线400-966-8898" forState:UIControlStateNormal];
    [dialButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [dialButton addTarget:self action:@selector(dial) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:dialButton];
    /*UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-20, 44)];
    [button setTitle:@"清空历史记录" forState:UIControlStateNormal];
    [button setTitle:@"清空" forState:UIControlStateSelected];
    [button setTitle:@"清空" forState:UIControlStateHighlighted];
    //[button setImage:[UIImage imageNamed:@"icon1"] forState:UIControlStateNormal];
    //[button setImageEdgeInsets:UIEdgeInsetsMake(0, -100, 0, 100)];
    //[button setBackgroundImage:[UIImage imageNamed:@"icon1"] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8;
    button.layer.borderWidth = 1;
    //button.titleLabel.textColor = [UIColor blackColor];
    button.layer.borderColor = [UIColor yellowColor].CGColor;
    button.titleLabel.font = [UIFont italicSystemFontOfSize:20];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:button];*/
    return footView;
}
- (void)dataResponds
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://test.ydm01.com/ydmxc/queryCustomerCenter.do?customerId=23266&cMerchantId=410 "]];
    NSData *dataResponds = [[NSURLSessionTask  ];
}
- (void)dial
{
    NSString *num = @"telprompt://4009668898";
    if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)) { // IPAD  没有打电话功能
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
    }
    NSLog(@"正在拨打：400-966-8898");
}
- (void)buttonClick
{
    NSLog(@"清空历史记录");
}

@end
