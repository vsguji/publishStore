//
//  RTBaseModel+RTForm.m
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTBaseModel+RTForm.h"
#import "RTModelTools.h" // lipeng 2017.12.07
#import "RTFormCell.h"
#import "RTFormFieldCell.h"
#import "RTFormAreaSpaceCell.h"

@implementation RTBaseModel (RTForm)

// 容通源 我有可投运营合伙人
+ (NSDictionary *)modelFromRTPartnerJsonPath:(NSString *)path {
    return [RTModelTools jsonLocalDic:path];
}

- (Class)showTableCellByModel:(RTBaseModel *)model {
    return [RTBaseCell class];
}
@end


@implementation RTLabelAndIconModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormPartnerMemberCell class];
}

@end

@implementation RTLabelAndFieldModels (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormFieldCell class];
}

@end

@implementation RTLabelAndFieldModels2 (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormFieldCell class];
}

@end


@implementation RTLabelAndFieldModels3 (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormFieldStyle2Cell class];
}

@end

@implementation RTLabelAndFieldModels4 (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormFieldStyle3Cell class];
}

@end

@implementation RTFormButtonsGroupModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormButtonGroupCell class];
}

@end

//@implementation RTButtonsGroupModel (RTForm)

//- (Class)showTableCellByModel:(RTBaseModel *)model;{
//    return [RTFormButtonGroupCell class];
//}

//@end


@implementation RTButtonItemModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormButtonGroupCell class];
}

@end


@implementation RTFormSectionHeaderModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormSectionHeaderCell class];
}

@end


@implementation RTFormPartnerModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormPartnerMemberCell class];
}

@end

@implementation RTFormPartnerAreasModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormAreaCell class];
}

@end


@implementation RTFormBriefModel (RTForm)
- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormBriefCell class];
}
@end



@implementation RTFormCapacitiveModel (RTForm)
- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormCapacitiveCell class];
}
@end

@implementation RTFormCapacitivePartTwoModel (RTForm)
- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormCapacitiveCell class];
}
@end

@implementation RTFormCapacitivePartThreeModel (RTForm)
- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormCapacitive2Cell class];
}
@end

@implementation RTFormCapitalModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormCapitalCell class];
}

@end


@implementation RTFormInvisibleCapitalModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormInvisibleCapitalCell class];
}

@end

@implementation RTFormBottomButtonsModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormFooterCell class];
}
@end

@implementation RTAreaCondition (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormAreaSpaceCell class];
}

@end

@implementation RTFormAreaCapitalModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormAreaConditionSecretCell class];
}

@end

@implementation RTFormCommonAddAreaModel (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormAreaCommonAddCell class];
}

@end

@implementation RTAreaDevicesCondition (RTForm)

- (Class)showTableCellByModel:(RTBaseModel *)model{
    return [RTFormAreaDeviceCell class];
}

@end
