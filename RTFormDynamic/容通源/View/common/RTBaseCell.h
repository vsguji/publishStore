//
//  RTBaseCell.h
//  darongtong
//
//  Created by zy on 2017/9/20.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTCellProtocal.h"

typedef enum : NSUInteger {
    kRegisterUnuse = 0,
    kRegisterUse,
} kRegister;


// 卡片基类
@interface RTBaseCell : UITableViewCell<RTCellProtocal>{
    /**Elments*/
@protected
    UIImageView  *_headerIcon;
    UILabel      *_userTitle;
    UILabel      *_userNick;
    
@protected
    UIImage      *_normal;
    UIImage      *_selected;
    
@protected
    BOOL         _isSelected;

}
/**Attribute*/
@property (nonatomic,strong,readonly) UIImageView *headerIcon;
@property (nonatomic,strong,readonly) UILabel     *userTitle;
@property (nonatomic,strong,readonly) UILabel     *userNick;
@property (nonatomic,assign,readonly) BOOL isSelected;
@property (nonatomic,weak) id<RTCellProtocal> delegate;

+ (void)regsisterCell:(UITableView *)tab;

+ (instancetype)initWithStyle:(UITableViewCellStyle)style tableView:(UITableView *)tab indexPath:(kRegister)cellRegister;

+ (NSString *)cellIdentity;


- (void)baseCellSelected:(BOOL)status;

// 自定义扩展图标
- (void)customerAccessView:(UIImage *)image;

- (void)loadViews __attribute__((objc_requires_super));

- (void)setTapGesture:(UIView *)gesture;

- (void)gestureAction:(UIGestureRecognizer *)gesture;

// lipeng 2017.11.15
- (void)clearBgColorCell;

@end
