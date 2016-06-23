//
//  TestTableViewCell.m
//  test
//
//  Created by 1 on 16/6/22.
//  Copyright © 2016年 1. All rights reserved.
//

#import "TestTableViewCell.h"


@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

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
+ (TestTableViewCell *)tableView:(UITableView *)tableView imageDataArray:(NSArray *)imageDataArray titleDataArray:(NSArray *)titleDataArray indexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"TestTableViewCell";
    TestTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TestTableViewCell" owner:self options:nil]firstObject];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.nikeNameLabel.text = titleDataArray[indexPath.section][indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.headImageView.image = [UIImage imageNamed:imageDataArray[indexPath.section][indexPath.row]];
    cell.headImageView.layer.cornerRadius = 30;
    cell.headImageView.clipsToBounds = YES;
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
