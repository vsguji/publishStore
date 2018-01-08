//
//  NewShopGroupButtonView.h
//  darongtong
//
//  Created by xie on 17/12/22.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewShopSecretTiGangModel.h"

@protocol NewShopGroupButtonViewDelegate <NSObject>

@optional

- (void) selectedFinish:(NewShopSecretTiGangModel *) model;

@end

@interface NewShopGroupButtonView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *arrowsIV;

@property(nonatomic, strong) NSIndexPath * indexPath;

@property (strong, nonatomic) IBOutlet UIView *yuanView;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) IBOutlet UIButton *startusBtn;

@property(nonatomic, strong) NewShopSecretTiGangModel *model;
@property (nonatomic,weak) id<NewShopGroupButtonViewDelegate> delegate;

@property (nonatomic,copy) void (^setContentHeight)(CGFloat contentHeight) ;



@end
