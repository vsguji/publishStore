//
//  buttonView.h
//  darongtong
//
//  Created by liuxin on 2017/7/4.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "storePublishModel.h"
@protocol buttonViewDelegate <NSObject>

-(void)getdateModel:(storePublishModel *)model;

@end
@interface buttonView : UIView
@property(nonatomic,copy)NSString * titleStr;
@property(nonatomic,copy)NSString * btnImgName;
@property(nonatomic,copy)NSString * backImgName;
@property(nonatomic,copy)NSString * lableName;
@property(nonatomic,copy)NSString * arrowImgName;
@property (nonatomic, weak) id<buttonViewDelegate> delegate;
@property(nonatomic,strong)UILabel * datailLabel;
-(void)buildDefaultViewWithTitle:(NSString *)title backImg:(NSString *)backImg buttonImage:(NSString *)btnImg;

-(void)buildBigViewWithTitle:(NSString *)title backImg:(NSString *)backImg buttonImage:(NSString *)btnImg labelStr:(NSString *)labStr arrowImg:(NSString *)arrowImg;

@end
