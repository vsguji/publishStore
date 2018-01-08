//
//  StoreMainBadyView.h
//  darongtong
//
//  Created by liuxin on 2017/7/3.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "buttonView.h"
#import "storePublishModel.h"
#import "SPMenuView.h"
#import "ZYQAssetPickerController.h"

@interface StoreMainBadyView : UIView<UIActionSheetDelegate,buttonViewDelegate,ZYQAssetPickerControllerDelegate,
UIImagePickerControllerDelegate>
{
    UIButton * licenseBtn;//选择执照
    UILabel * numberLab;  //照片数量
    UILabel * dateLabel;//发布目期
    storePublishModel * spModel;
    buttonView * enterPrise;
}
@property(nonatomic,strong)NSMutableArray * licenseArray;
@end
