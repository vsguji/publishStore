//
//  RTFormStoreViewController.h
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 投 -- 动态表单
#import "RootViewController.h"
@protocol RTFormViewControllerDelegate<NSObject>
- (NSString *) validateForm:(NSDictionary *)completedForm;
- (void) handleForm:(NSDictionary *)completedForm;
@optional
- (UIView *) specialHeader;
- (CGFloat) specialHeaderHeight;

- (UIView *) specialFooter;
- (CGFloat) specialFooterHeight;

- (BOOL) popFormWhenCompleted;

- (void) handleAction:(NSString *)action;

- (NSString *)initialValueForFieldAtIndex:(NSUInteger)index;
@end

@interface RTFormStoreViewController : RootViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    @protected
    UITableView *_formTable;
}
@property(nonatomic, readonly) NSDictionary *completedForm;
@property(nonatomic, weak) id<RTFormViewControllerDelegate> delegate;
@property(nonatomic, strong, readonly) UITableView *tableView;
@property(nonatomic, strong, readonly) NSArray *form;
@property(nonatomic, strong, readonly) NSArray *actions;

- (id)initWithForm:(NSArray *)form;
- (id)initWithForm:(NSArray *)form andActions:(NSArray *)actions;

- (void)clearForm;

- (void)handleErrorResult:(NSObject *)obj;
- (void)finishedWithForm:(NSString *)error;
- (void)donePressed:(id)sender;

@end
