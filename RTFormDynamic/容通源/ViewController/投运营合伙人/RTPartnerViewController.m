//
//  RTPartnerViewController.m
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTPartnerViewController.h"
#define SUBMIT_ACTION @"发布"

#import "RTLabelAndIconModel.h"
#import "RTBaseModel+RTForm.h"
#import "RTLabelAndIconAttriModel.h"
#import "RTFormHeaderView.h"
#import "UIView+Altar.h"
#import "RTLabelAndFieldModel.h"
#import "RTButtonsGroupModel.h"
#import "RTFormPartnerModel.h"
#import "RTBriefModel.h"
#import "UtilsMacro.h"
@interface RTPartnerViewController ()<RTFormViewControllerDelegate>

@end

@implementation RTPartnerViewController


- (id)init {
    NSArray *form = [self makeForm];
    NSArray *actions = [self makeActions];
    
    self = [super initWithForm:form andActions:actions];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (NSArray *)makeActions {
    return nil;// [NSArray arrayWithObject:SUBMIT_ACTION];
}

- (NSArray *)makeForm {
    // 合伙人拍照
    NSError *error = nil;
    NSArray *cellForm = [[RTLabelAndIconModel modelFromRTPartnerJsonPath:@"kPartnerJson"] objectForKey:@"partnerForm"];
    NSMutableArray *models = [NSMutableArray arrayWithCapacity:10];
    for (NSDictionary *item in cellForm) {
        RTBaseModel *model = nil;
        NSString *key = [item allKeys][0];
        NSDictionary *value = [item objectForKey:key];
        if ([key isEqualToString:@"photo"]) {
            model = [MTLJSONAdapter modelOfClass:[RTFormPartnerModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"fields"]){
            model = [MTLJSONAdapter modelOfClass:[RTLabelAndFieldModels class] fromJSONDictionary:item error:&error];
        }
        else if([key isEqualToString:@"ways"]){
            model = [MTLJSONAdapter modelOfClass:[RTFormButtonsGroupModel class] fromJSONDictionary:item error:&error];
        }
        else if ([key isEqualToString:@"entityProduct"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormSectionHeaderModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"fields3"]){
            model = [MTLJSONAdapter modelOfClass:[RTLabelAndFieldModels3 class] fromJSONDictionary:item error:&error];
        }
        else if ([key isEqualToString:@"business"]){
           model = [MTLJSONAdapter modelOfClass:[RTFormSectionHeaderModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"fields2"]){
            model = [MTLJSONAdapter modelOfClass:[RTLabelAndFieldModels2 class] fromJSONDictionary:item error:&error];
        }
        else if ([key isEqualToString:@"area"]){
            model = [MTLJSONAdapter modelOfClass:[RTFormSectionHeaderModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"locations"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormPartnerAreasModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"culture"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormSectionHeaderModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"brief"]) {
            model = [MTLJSONAdapter modelOfClass:[RTFormBriefModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"capacitive"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormSectionHeaderModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"subCapacitive"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormCapacitiveModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"subCapacitivePartTwo"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormCapacitivePartTwoModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"subCapacitivePartThree"]){
            model = [MTLJSONAdapter modelOfClass:[RTFormCapacitivePartThreeModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"capital"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormCapitalModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"invisibleCapital"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormInvisibleCapitalModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"capital232"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormCapitalModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"footer"]){
             model = [MTLJSONAdapter modelOfClass:[RTFormBottomButtonsModel class] fromJSONDictionary:value error:&error];
        }
        if (model) {
              [models addObject:model];
        }
    }

    return [models copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - RTFormViewControllerDelegate Methods
- (UIView *)specialHeader {
    RTFormHeaderView *formImg = [[RTFormHeaderView alloc] initWithLeftCornerTitle:@"投运营合伙人照片"];
    [self.view addSubview:formImg];
    [formImg setFrameAndLayout:CGRectMake(0, 0,kScreenW, 230)];
    [formImg relayoutFrameOfSubViews];
    return formImg;
}

-(CGFloat)specialHeaderHeight {
    return 230;
}

- (void)handleAction:(NSString *)action {
    if ([action isEqualToString:SUBMIT_ACTION]) {
        [self donePressed:self];
    }
}

- (NSString *)validateForm:(NSDictionary *)completedForm {
//    if (![PGUtility validateEmail:completedForm[@"email"]]) {
//        return @"A valid email is required";
//    }
    return nil;
}

- (void)handleForm:(NSDictionary *)completedForm {
    // attempt to authorize the email to the account
   // [self authorizeEmail:completedForm[@"email"]];
}


@end
