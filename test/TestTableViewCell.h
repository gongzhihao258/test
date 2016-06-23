//
//  TestTableViewCell.h
//  test
//
//  Created by 1 on 16/6/22.
//  Copyright © 2016年 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *nikeNameLabel;


/**
 *  生成自定义的cell  并填充数据
 *
 *  @param tableView      表
 *  @param imageDataArray 图片源数组
 *  @param titleDataArray 标题源墅组
 *  @param indexPath      indexPath description
 *
 *  @return cell
 */
+ (TestTableViewCell *)tableView:(UITableView *)tableView imageUrl:(NSString *)imageUrl titleDataArray:(NSArray *)titleDataArray indexPath:(NSIndexPath *)indexPath;


@end
