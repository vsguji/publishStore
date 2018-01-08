//
//  RTAttachmentFileModel.h
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 文本 + 文本框 + 附件
#import "RTLabelAndFieldModel.h"

@interface RTAttachmentFileModel : RTLabelAndFieldModel
{
    /*Elements*/
   @protected
    NSAttributedString *_fileTitle;
    NSAttributedString *_fileDes;
}

/**Attribute*/
@property (nonatomic,copy) NSAttributedString *fileTitle;
@property (nonatomic,copy) NSAttributedString *fileDes;

@end
