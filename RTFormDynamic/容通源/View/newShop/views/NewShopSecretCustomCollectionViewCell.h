//
//  NewShopSecretCustomCollectionViewCell.h
//  darongtong
//
//  Created by xie on 17/12/21.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewShopSecretTiGangModel.h"
#import "NewShopPulishScretFileView.h"

@protocol NewShopSecretCustomCollectionViewCellDelegate <NSObject>

@optional


@end

typedef  NS_ENUM(NSInteger,WTTCustomSecretType){
    
    WTTCustomSecretTypeSecretFile = 0,//密档
    WTTCustomSecretTypeShopCategory = 1,//经营店铺规模类别
    
    
};


@interface NewShopSecretCustomCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) NewShopSecretTiGangModel*  model;
@property (nonatomic,copy)   NSString* p_id;//父id
@property (assign,nonatomic) NewShopsecretType type;

@property(nonatomic, copy) void (^resetHeightBlock)(CGFloat height);

@property (nonatomic,copy) void (^setContentHeight)(CGFloat contentHeight) ;

@property (strong, nonatomic) NSMutableArray*  dataArray;//数据源
@property (strong, nonatomic) NSMutableArray* arrayList;

@property (nonatomic,strong) NSArray*  dataCustom;



@end
