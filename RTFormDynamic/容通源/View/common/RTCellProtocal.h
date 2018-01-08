//
//  RTCellProtocal.h
//  darongtong
//
//  Created by zy on 2017/9/21.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RTBaseModel.h"

@protocol RTCellProtocal <NSObject>
@optional
// 重用单元格
- (instancetype)initWithCellIdentifier:(NSString *)reuseIdentifier;
// 添加点击事件
- (void)handlerCurrentCell:(UITableViewCell *)cell;
- (void)handlerCurrentCollectionCell:(UICollectionViewCell *)cnCell;
// 数据源
- (void)setCellWithModel:(RTBaseModel *)model;
// 代理
- (void)setCurrentDelegate:(id)parentVC;
@end

// 子视图 添加数据
@protocol RTFormDynamicDataSource <NSObject>

@end

// 子视图事件
@protocol RTFormViewDynamicDelegate <NSObject>

- (void)popViewController;

@end
