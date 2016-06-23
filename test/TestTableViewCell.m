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
+ (TestTableViewCell *)tableView:(UITableView *)tableView imageUrl:(NSString *)imageUrl titleDataArray:(NSArray *)titleDataArray indexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"TestTableViewCell";
    TestTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TestTableViewCell" owner:self options:nil]firstObject];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.nikeNameLabel.text = titleDataArray[0][0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([imageUrl isEqualToString:@"1.jpg"]) {
        cell.headImageView.image = [UIImage imageNamed:imageUrl];
    } else {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
             // 耗时的操作
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            UIImage *image = [UIImage imageWithData:imageData];
            dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
                cell.headImageView.image = image;
            });
        }); 

        
    }
    
    cell.headImageView.layer.cornerRadius = 30;
    cell.headImageView.clipsToBounds = YES;
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
