//
//  NewShopPulishScretFileView.h
//  darongtong
//
//  Created by xie on 17/12/20.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "BaseViewController.h"
typedef  NS_ENUM(NSInteger,NewShopsecretType){
    NewShopsecretTypeDefault = 0,//密档提纲
    NewShopsecretTypeManageCategory = 1,//店铺经营主体类别
    
};

@interface NewShopPulishScretFileView : UIView
@property (nonatomic,copy) void (^setContentHeight)(CGFloat contentHeight) ;
@property (strong, nonatomic) NSMutableArray*  dataArray;//数据源
@property (strong, nonatomic) NSMutableArray* arrayList;
@property (copy, nonatomic) NSString* appendStr;
@property (nonatomic, assign) NewShopsecretType  type;
@property  (nonatomic, copy) NSString * p_id;




@end
