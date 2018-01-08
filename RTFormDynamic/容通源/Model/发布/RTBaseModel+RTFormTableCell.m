//
//  RTBaseModel+RTFormTableCell.m
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTBaseModel+RTFormTableCell.h"
#import "RTCellProtocal.h"
#import "RTBaseModel+RTForm.h"
#import "RTFormPartnerModel.h" // lipeng 2017.12.19

@implementation RTBaseModel (RTFormTableCell)

// 单元样式
- (UITableViewCell<RTCellProtocal> *)formTableView:(UITableView *)tableView modelStyle:(RTBaseModel *)cellStyle {
     NSString *cellIdentity = [self formCellIdentity];
     UITableViewCell<RTCellProtocal> *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (cell == nil) {
        cell = [[[self formTableViewCell:cellStyle] alloc] initWithCellIdentifier:cellIdentity];
    }
    return cell;
}

// private
- (Class)formTableViewCell:(RTBaseModel *)modelType {
    return [self showTableCellByModel:self];
}

// 单元格标识
- (NSString *)formCellIdentity {
    return [NSString stringWithFormat:@"kCell_%@",_modelType];
}

// 单元高度
- (CGFloat)formTableViewHeight {
    return 0.;
}

// 分区总数
- (NSInteger)formTableViewSections {
    return 0;
}

// 分区标题
- (NSString *)formTableViewSectionTitle {
    return nil;
}

// 水平间距
- (CGFloat)horizontalMargin {
    return 10.;
}

// 竖直间距
- (CGFloat)verticalMargin {
    return 10.;
}

// 顶部间距
- (CGFloat)topMargin {
    return 10.;
}

// 底部间距
- (CGFloat)bottomMargin {
    return 10.;
}

@end


@implementation RTFormPartnerModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    if (self.items.count == 1) {
        return 68.;
    }
    return 815.;
}

@end

@implementation RTLabelAndIconModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    return 815.;
}

@end

@implementation RTLabelAndFieldModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    CGFloat height = 89.;
    if ([self.modelType containsString:@"RTFormFieldsBrief1"]) {
        height =  110.;
    }
    else if ([self.modelType containsString:@"RTFormFieldsBrief2"]){
        height = 110.;
    }
    else if ([self.modelType containsString:@"RTFormFieldsBrief5"]){
        height = 286.;
    }
    else if([self.modelId containsString:@"3000"]){  // 组织结构类别
        height = 110.;
    }
    else if ([self.modelType containsString:@"RTAreaFields1"]){
        height = 96.;
    }
    else if ([self.modelType containsString:@"RTAreaFieldsLocation"]){
        height = 400;
    }
    return height;
}

- (CGFloat)leftMagin{
    return 15.;
}

@end

@implementation RTLabelAndFieldModels (RTFormTableCell)

- (CGFloat)verticalMargin {
    return 20.;
}

- (CGFloat)formTableViewHeight {
    CGFloat height = 0.;
    for (RTLabelAndFieldModel *fieldModel in self.fields) {
        height += [fieldModel formTableViewHeight];
    }
    height += [self verticalMargin];
    return height;
}

@end


@implementation RTLabelAndFieldModels2 (RTFormTableCell)

- (CGFloat)verticalMargin {
    return 20.;
}

- (CGFloat)formTableViewHeight {
    CGFloat height = 0.;
    for (RTLabelAndFieldModel *fieldModel in self.fields2) {
        height += [fieldModel formTableViewHeight];
    }
    height += [self verticalMargin];
    return height;
}

@end


@implementation RTLabelAndFieldModels3 (RTFormTableCell)

- (CGFloat)verticalMargin {
    return 20.;
}

- (CGFloat)formTableViewHeight {
    CGFloat height = 0.;
    for (RTLabelAndFieldModel *fieldModel in self.fields3) {
        height += [fieldModel formTableViewHeight];
    }
    height += [self verticalMargin];
    return height;
}

@end

@implementation RTLabelAndFieldModels4 (RTFormTableCell)

- (CGFloat)verticalMargin {
    return 20.;
}

- (CGFloat)formTableViewHeight {
    CGFloat height = 0.;
    for (RTTitleAndFieldsModel *fieldModel in self.fields4) {
        for (RTLabelAndFieldModel *titleField in fieldModel.items) {
           // TCAVIMLog(@"titleField modelType:%@",titleField.modelType);
             height += [fieldModel formTableViewHeight];
        }
    }
    height += [self verticalMargin];
    return height;
}

@end


@implementation RTFieldAndGroupModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    CGFloat height = 89.;
    NSInteger rows = self.items.count / 3.0 > 0 ? self.items.count / 3 + 1 : self.items.count / 3 ;
    if (self.items) {
        height += 40. * rows;
    }
    return height;
}

@end


@implementation RTFormButtonsGroupModel (RTFormTableCell)

- (CGFloat)verticalMargin {
    return 15.;
}

- (CGFloat)formTableViewHeight {
    CGFloat height = [self topMarginHeight];
    for (RTButtonsGroupModel<RTFormViewProtocol> *btnGroup in self.ways) {
        height += [btnGroup formTableViewHeight];
    }
    height += [self bottomMargin] + 60.;
    return height;
}

- (CGFloat)topMarginHeight {
    return 60.;
}

- (CGFloat)rowHeight {
    return 37.;
}

- (CGFloat)bottomMargin {
    return 60.;
}
@end


@implementation RTButtonsGroupModel (RTFormTableCell)

- (CGFloat)verticalMargin {
    return 14.;
}

- (CGFloat)horizontalMargin {
    return 10.;
}

- (CGFloat)formTableViewHeight {
    CGFloat height = 0.;
   
    height += [self itemTitleHeight]; //  1.是否坐班
    height += [self verticalMargin];  // 2.间距

    if ([self layoutHorizontalOrVertical]) {
        if ([self layoutNumBtnsOfRows] == 2) {
             height += (self.items.count / 2) * [self rowHeight] ; // 3.坐班 , 不坐班
        }
        else {
            NSInteger nums = (self.items.count / 3.0) > 0  ?  (self.items.count / 3.0) + 1 : (self.items.count / 3.0);
            height += nums * ([self rowHeight]) ;  // 投货币,投设备,投项目,投团队,投场地,投智慧,投库存,投市场
        }
    }
    else {
        height += (self.items.count) * [self rowHeight];
    }
      height += [self bottomMargin]; // 4. 底部边距
    return height;
}

- (CGFloat)rowHeight {
    if ([self.modelType isEqualToString:@"formModelType5"]) {
        return 50;
    }
    return 37.;
}

- (CGFloat)topMargin {
    return 60.;
}

- (CGFloat)bottomMargin {
    return 15.;
}

- (CGFloat)rowTitlesWidth {
    CGFloat width = 0.;
    for (RTButtonItemModel *btnItem in self.items) {
        width += ([btnItem buttonWidth] );
    }
    return width;
}

- (CGFloat)leftMagin {
    if ([self layoutHorizontalOrVertical]) {
        return 10.;
    }
    return 36.;
}

@end

@implementation RTButtonItemModel (RTFormTableCell)

- (CGFloat)horizontalMargin {
    return 28.;
}

- (CGFloat)verticalMargin {
    return 20.;
}

- (CGFloat)topMargin {
    return 20.;
}

- (CGFloat)bottomMargin {
    return 15.;
}

- (CGFloat)formTableViewHeight {
    if ([self.modelType isEqualToString:@"formModelType5"]) {
        return 50;
    }
    if ([self buttonIsSelected]) {
       return 37.;
    }
    return 30.;
}

- (CGFloat)rowTitlesWidth {
    return 45.;
}

@end

@implementation RTFormSectionHeaderModel (RTFormTableCell)

- (CGFloat)formTableViewHeight{
    if ([self.modelType isEqualToString:@"RTFormPartnerCulture"]) {
        return 60. + [self verticalMargin];
    }
    else if ([self.modelType isEqualToString:@"RTFormEntityProductOne"]) {
        // 项目组的项目资本
        return 85. + [self verticalMargin];
    }
    else if ([self.modelType isEqualToString:@"RTFormProductEntityProduct"]){
         return 70. + [self verticalMargin];
    }
    else if ([self.modelType isEqualToString:@"RTFormAreaEntityProduct"]) {
        return 45. + [self verticalMargin];
    }
    return 130.;
}

- (CGFloat)verticalMargin {
    return 15.;
}

@end

@implementation RTFormPartnerAreasModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    CGFloat height = 0.;
    for (RTFormPartnerAreaModel *area in self.items) {
        height = [area formTableViewHeight] + [self verticalMargin];
    }
    height += [self bottomMargin] + 160; // 60 底部button;
    return height;
}

- (CGFloat)verticalMargin {
    return 10.;
}

- (CGFloat)bottomMargin {
    return 10.;
}
@end;


@implementation RTFormPartnerAreaModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    return 400;
}

@end


@implementation RTFormBriefModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    CGFloat height = 322. + [self topMargin];
    NSArray *subArray = [self.items subarrayWithRange:NSMakeRange(3, self.items.count - 3)];
    for (RTLabelAndFieldModel<RTFormProtocol> *field in subArray) {
        height += [field formTableViewHeight] + [self verticalMargin];
    }
    height += [self bottomMargin] + 60.;// 60.???
    return height;
}

- (CGFloat)topMargin {
    return 20.;
}

- (CGFloat)verticalMargin {
    return 2.;
}

- (CGFloat)bottomMargin {
  return 50.;
}

@end

@implementation RTLabelAndTextModel (RTFormTableCell)

- (CGFloat)rowHeight {
    return 80.;
}

- (CGFloat)leftMagin {
    return 10.;
}

- (CGFloat)verticalMargin {
    return 2.;
}

@end


@implementation RTFormCapacitiveModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
//    if (self.capacitiveHeader == nil) {
//        return 344. * self.items.count;
//    }
    return 512.;
}

- (CGFloat)leftMagin {
    return 10.;
}

- (CGFloat)verticalMargin {
    return 20.;
}

@end


@implementation RTFormCapacitivePartTwoModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    NSInteger group = self.items.count / 2;
    CGFloat height = [self rowHeight] * (group);
    height +=  [self verticalMargin] *(group - 1);
    height += [self bottomMargin];
    return height;
}

- (CGFloat)leftMagin {
    return 10.;
}

- (CGFloat)verticalMargin {
    return 10.;
}

- (CGFloat)rowHeight {
    return  252.;
}

- (CGFloat)bottomMargin {
    return 80.;
}

@end

@implementation RTFormCapacitivePartThreeModel (RTFormTableCell)

- (CGFloat)topMargin {
    return 89.;
}

- (CGFloat)formTableViewHeight {
    CGFloat height = 0.;
    for (RTLabelAndField3Model *model in self.items) {
        height +=  [self topMargin];
        height +=  [model rowHeight] + 80. + [self verticalMargin]; //  [model rowHeight] => 40. : 权限设置 ;  + 80. =>底部加号
    }
    height += [self bottomMargin] ;
    return height;
}

- (CGFloat)leftMagin {
    return 10.;
}

- (CGFloat)verticalMargin {
    return 10.;
}

- (CGFloat)rowHeight {
    CGFloat height = [self topMargin];
    height += 80.; // 底部加号
    return  height;
}

- (CGFloat)bottomMargin {
    return 10.;
}

@end


@implementation RTFormCapitalModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    CGFloat height = 0.;
    
    if ([self.modelType isEqualToString:@"RTFormSubCapital232"]) {
        height =  660.;
    }
    else {
        height = 710.;
        if (self.items) {
            // RTButtonItems
            NSArray *extenItems = [self.items subarrayWithRange:NSMakeRange(self.items.count - 2, 2)];
            height += extenItems.count * 45. + 10.;  // 45:控件高度 10:间距
         }
    }
    return height;
}

- (CGFloat)leftMagin {
    return 10.;
}

- (CGFloat)verticalMargin {
    return 2.;
}

@end


@implementation RTFormInvisibleCapitalModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    return 744.;
}

- (CGFloat)leftMagin {
    return 10.;
}

- (CGFloat)verticalMargin {
    return 2.;
}

@end


@implementation RTFormBottomButtonsModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    return 104.;
}

- (CGFloat)leftMagin {
    return 10.;
}

- (CGFloat)verticalMargin {
    return 2.;
}

@end

@implementation RTAreaCondition (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    return 1260. * self.items.count;
}

@end

@implementation RTFormAreaCapitalModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    return 719 + 40.;
}

@end

@implementation RTFormCommonAddAreaModel (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    return 80.;
}

@end


@implementation RTAreaDevicesCondition (RTFormTableCell)

- (CGFloat)formTableViewHeight {
    CGFloat height = 0.;
    for (RTLabelAndIcon101Model *item in self.items) {
        for (RTBaseModel *subItem in item.items) {
          //  TCAVIMLog(@"subItem modelType:%@",subItem.modelType);
            height += 541.+ [self verticalMargin];
        }
    }
    height += [self bottomMargin];
    return height;
}

- (CGFloat)verticalMargin {
    return 10.;
}

- (CGFloat)bottomMargin {
    return 15. + 60.;
}

@end
