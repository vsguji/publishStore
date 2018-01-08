//
//  RTAreaConditionViewController.m
//  darongtong
//
//  Created by zy on 2018/1/5.
//  Copyright © 2018年 darongtong. All rights reserved.
//

#import "RTAreaConditionViewController.h"

#import "RTProjectViewController.h"

#import "RTMoneyViewController.h"
#define SUBMIT_ACTION @"发布"

#import "RTLabelAndIconModel.h"
#import "RTBaseModel+RTForm.h"
#import "RTLabelAndIconAttriModel.h"
#import "UIView+Altar.h"
#import "RTLabelAndFieldModel.h"
#import "RTButtonsGroupModel.h"
#import "RTFormPartnerModel.h"
#import "RTBriefModel.h"

#import "RTAreaTipView.h"
#import "UtilsMacro.h"

@interface RTAreaConditionViewController ()<RTFormViewControllerDelegate>

@end

@implementation RTAreaConditionViewController

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
    return nil;//[NSArray arrayWithObject:SUBMIT_ACTION];
}

- (NSArray *)makeForm {
    // 合伙人拍照
    NSError *error = nil;
    NSArray *cellForm = [[RTLabelAndIconModel modelFromRTPartnerJsonPath:@"kPartnerJson41"] objectForKey:@"partnerForm"];
    NSMutableArray *models = [NSMutableArray arrayWithCapacity:10];
    for (NSDictionary *item in cellForm) {
        RTBaseModel *model = nil;
        NSString *key = [item allKeys][0];
        NSDictionary *value = [item objectForKey:key];
        if ([key isEqualToString:@"fields"]){
            model = [MTLJSONAdapter modelOfClass:[RTLabelAndFieldModels class] fromJSONDictionary:item error:&error];
        }
        else if ([key isEqualToString:@"areaCapital"]){
            model = [MTLJSONAdapter modelOfClass:[RTFormAreaCapitalModel class] fromJSONDictionary:value error:&error];
        }
        else if ([key isEqualToString:@"footer"]){
            model = [MTLJSONAdapter modelOfClass:[RTFormCommonAddAreaModel class] fromJSONDictionary:value error:&error];
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
    self.title = @"要求具备场地条件";
    [self setLeftImageNavigationBar:@"form_close"];
    [self setNavigationBarBackgroundImage:@"defaultNavigationImage"];
    [self setRightImageNavigationBar:@"duihao"];
}


- (void)leftBarItemClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)rightBarItemClicked:(id)sender{
    
}

#pragma mark - RTFormViewControllerDelegate Methods
- (UIView *)specialHeader {
    RTFormAreaConditionView *formImg = [[RTFormAreaConditionView alloc] init];
    [self.view addSubview:formImg];
    [formImg configOwnViewsWidthInfo:nil];
    [formImg setFrameAndLayout:CGRectMake(0, 0,kScreenW, 120.)];
    [formImg relayoutFrameOfSubViews];
    return formImg;
}

-(CGFloat)specialHeaderHeight {
    return 120.;
}

- (void)handleAction:(NSString *)action {
    if ([action isEqualToString:SUBMIT_ACTION]) {
        [self donePressed:self];
    }
}

- (NSString *)validateForm:(NSDictionary *)completedForm {
    return nil;
}

- (void)handleForm:(NSDictionary *)completedForm {
}

@end
