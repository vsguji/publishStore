//
//  RTFormStoreViewController.m
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#define INSET 8.0f
#define ROW_HEIGHT 44.0f
#define BUTTON_HEIGHT 41.0f

#define LABEL_TAG 49
#define TEXT_FIELD_TAG 50


#import "RTFormStoreViewController.h"
#import "RTAlert.h" // lipeng 2017.12.07
#import "RTBaseModel+RTForm.h"
#import "RTBaseModel+RTFormTableCell.h"
#import "RTFormProtocol.h" // lipeng 2017.12.11
#import "RTFormCell.h" //  lipeng 2017.12.11

#import "ColorMacro.h"
#import "UtilsMacro.h"

@interface RTFormStoreViewController ()
@property(nonatomic, strong) NSMutableArray *fields;
@property(nonatomic, strong) NSMutableArray *allCapsFields;
@property(nonatomic, strong) UITapGestureRecognizer *tapRecognizer;
@property(nonatomic, assign) BOOL formInTransit;
@end

@implementation RTFormStoreViewController


- (id)initWithForm:(NSArray *)form {
    self = [super init];
    if (!self) return nil;
    
    _fields = [NSMutableArray array];
    _allCapsFields = [NSMutableArray array];
    _form = form;
    
    return self;
}

- (id)initWithForm:(NSArray *)form andActions:(NSArray *)actions {
    self = [super init];
    if (!self) return nil;
    
    _fields = [NSMutableArray array];
    _allCapsFields = [NSMutableArray array];
    _form = form;
    _actions = actions;
    
    return self;
}

- (void)dealloc {
   [[UIApplication sharedApplication].keyWindow removeGestureRecognizer:_tapRecognizer];
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [_tapRecognizer setEnabled:NO];
    [self.view addGestureRecognizer:_tapRecognizer];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.allowsSelection = NO;
    _tableView.backgroundView = nil;
    _tableView.backgroundColor = kClearColor;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = [self formHeaderView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
     [self setCustomRightItem];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Public Methods

- (void)setCustomRightItem
{
 //  UIButton *rightButton = [UIButton addCustomButtonWithFrame:CGRectMake(0, 0, 40, 40) title:@"预览" backgroundColor:[UIColor clearColor] titleColor:[UIColor whiteColor] image:@"sp_预览" font:[UIFont systemFontOfSize:9] type:1 tapAction:^(UIButton *button) {
//       // YYLog(@"预览");
//    }];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setCustomRightNavigationBar:rightButton];
}

- (UIView *)formHeaderView {
    UIView *formHeader = nil;
    if (_delegate && [_delegate respondsToSelector:@selector(specialHeader)]) {
        formHeader = [_delegate specialHeader];
    }
    if (_delegate && [_delegate respondsToSelector:@selector(specialHeaderHeight)]) {
        formHeader.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), [_delegate specialHeaderHeight]);
    }
    return formHeader;
}

- (void)clearForm {
    for (UITableViewCell *cell in _fields) {
        UITextField *textField = nil;//(UITextField *) [cell viewWithTag:TEXT_FIELD_TAG];
        textField.text = @"";
    }
}

- (void)handleErrorResult:(NSObject *)obj {
    NSString *resultError = nil;
    
    if ([obj.class isSubclassOfClass:[NSDictionary class]]) {
        NSDictionary *response = (NSDictionary *) obj;
        
        if ([[response objectForKey:@"error"] boolValue]) {
            NSString *error;
            if ([response[@"message"] isKindOfClass:[NSDictionary class]]) {
                NSDictionary *message = [response objectForKey:@"message"];
                NSArray *errors = [message objectForKey:@"errors"];
                error = [errors objectAtIndex:0];
            } else if ([response[@"message"] isKindOfClass:[NSString class]]) {
                error = response[@"message"];
            } else {
                error = @"Error.";
            }
            
            if (error.length > 0 && ![[error substringFromIndex:(error.length - 1)] isEqualToString:@"."]) {
                error = [NSString stringWithFormat:@"%@.", error];
            }
            
            resultError = error;
        }
        else if (!obj) {
            resultError = @"Error.";
        }
    }
    else if ([obj.class isSubclassOfClass:[NSError class]]) {
        NSError *error = (NSError *)obj;
        resultError = [error localizedDescription];
    }
    else if ([obj.class isSubclassOfClass:[NSString class]]) {
        resultError = (NSString *)obj;
    }
    
    [self finishedWithForm:resultError];
}

- (void)finishedWithForm:(NSString *)error {

    dispatch_async(dispatch_get_main_queue(), ^{
        self.formInTransit = NO;
        
        if (error) {
          //  [];
        } else {
            BOOL popForm = YES;
            if ([self.delegate respondsToSelector:@selector(popFormWhenCompleted)]) {
                popForm = [self.delegate popFormWhenCompleted];
            }
            if (popForm) {
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
    });
}

- (void)donePressed:(id)sender {
    [self dismissKeyboard:nil];
    if (!_formInTransit) {
        NSDictionary *completedForm = self.completedForm;
        NSString *validationError = [self validate:completedForm];
        if (validationError) {
            [RTAlert showAlertTitle:@"提示"
                            withMsg:validationError
                     viewController:self
                          aletBlock:^(NSInteger buttonIdx) {
                              
                          } buttonsStatement:@"确定",nil];
            return;
        }
        _formInTransit = YES;
        [_delegate handleForm:completedForm];
    }
}


#pragma mark - Private Methods

- (void)buttonPressed:(UIButton *)button {
    if ([_delegate respondsToSelector:@selector(handleAction:)]) {
        [_delegate handleAction:[button titleForState:UIControlStateNormal]];
    }
}

- (void)makeActiveFieldVisible {
    for (UITableViewCell *cell in _fields) {
        UIView *textField = nil;//[cell viewWithTag:TEXT_FIELD_TAG];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_fields indexOfObject:cell] inSection:0];
        
        if ([textField isFirstResponder]) {
            [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        }
    }
}

- (NSDictionary *)completedForm {
    NSMutableDictionary *completedForm = [NSMutableDictionary dictionary];
    
    for (NSDictionary *item in _form) {
//        if ([[item objectForKey:PGFORM_TYPE_KEY] isEqualToString:PGFORM_TYPE_TEXTFIELD]) {
//            UITableViewCell *cell = [_fields objectAtIndex:[_form indexOfObject:item]];
//            UITextField *field = (UITextField *)[cell viewWithTag:TEXT_FIELD_TAG];
//
//            NSString *text = field.text ?: @"";
//            text = [text trim]; //trim the leading/trailing whitespace
//
//            [completedForm setValue:text forKey:[item valueForKey:PGFORM_KEY_KEY]];
//        }
//        else { /
//
//        }
    }
    
    return completedForm;
}

- (NSString *)validate:(NSDictionary *)completedForm { //any client side validation we want to do, will be here
    for (UITableViewCell *cell in _fields) {
        UITextField *field = nil;//(UITextField *)[cell viewWithTag:TEXT_FIELD_TAG];
        if (field.text.length <= 0) {
            return @"All fields are required";
        }
    }
    
    if (_delegate) {
        return [_delegate validateForm:completedForm];
    }
    
    return nil;
}


#pragma mark - Keyboard handling

- (void)keyboardWasShown:(NSNotification *)notification {
    [_tapRecognizer setEnabled:YES];
    
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = _tableView.contentInset;
    contentInsets.bottom = keyboardSize.height;
    
    [UIView animateWithDuration:0.2f animations:^{
        self.tableView.contentInset = contentInsets;
        self.tableView.scrollIndicatorInsets = contentInsets;
    } completion:^(BOOL finished) {
        [self makeActiveFieldVisible];
    }];
}

- (void)keyboardWasHidden:(NSNotification *)notification {
    [self.tapRecognizer setEnabled:NO];
    
    UIEdgeInsets contentInsets = self.tableView.contentInset;
    contentInsets.bottom = 0.0f;
    
    [UIView animateWithDuration:0.2f animations:^{
        self.tableView.contentInset = contentInsets;
        self.tableView.scrollIndicatorInsets = contentInsets;
    } completion:nil];
}

- (void)dismissKeyboard:(id)sender {
    for (UITableViewCell *cell in _fields) {
        UITextField *field = nil;//(UITextField *)[cell viewWithTag:TEXT_FIELD_TAG];
        [field resignFirstResponder];
    }
}


#pragma mark - UITableViewDelegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     RTBaseModel *itemModel = _form[indexPath.row];
    return [itemModel formTableViewHeight];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _form.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RTBaseModel *itemModel = _form[indexPath.row];
    UITableViewCell<RTCellProtocal> *cell = [itemModel formTableView:tableView modelStyle:itemModel];
    if ([cell respondsToSelector:@selector(setCellWithModel:)]) {
        [cell setCellWithModel:itemModel];
        [cell setCurrentDelegate:self];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    CGFloat height = _actions.count ? INSET + (_actions.count * (BUTTON_HEIGHT + INSET * 2.0f)) : 0.0f;
    if ([_delegate respondsToSelector:@selector(specialFooterHeight)]) {
        height += [_delegate specialFooterHeight];
    }
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    CGFloat buttonHeight = BUTTON_HEIGHT + INSET * 2.0f;
    UIView *footerContainer = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.bounds.size.width, INSET + (_actions.count * buttonHeight))];
    
    for (NSString *action in _actions) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *buttonImage = [[UIImage imageNamed:@"splash-btn"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 5.0f, 0.0f, 5.0f)];
        [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
        button.titleLabel.font = FONT(LENGTH(10));
        [button setTitle:action forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        CGRect f = CGRectMake(0.0f, [_actions indexOfObject:action] * buttonHeight + 2.0f * INSET, tableView.bounds.size.width, BUTTON_HEIGHT);
        button.frame = f;
        [footerContainer addSubview:button];
    }
    
    if ([_delegate respondsToSelector:@selector(specialFooter)]) {
        CGFloat yStart = INSET + (_actions.count * (BUTTON_HEIGHT + INSET * 2.0f));
        UIView *extraView = [_delegate specialFooter];
        
        CGRect extraFrame = extraView.frame;
        extraFrame.origin.y = yStart;
        extraView.frame = extraFrame;
        
        [footerContainer addSubview:extraView];
    }
    
    return footerContainer;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger index = -1;
    for (UITableViewCell *cell in _fields) {
        if ([cell viewWithTag:TEXT_FIELD_TAG] == textField) {
            index = [_fields indexOfObject:cell];
        }
    }
    [textField resignFirstResponder];
    
    if (index == _fields.count - 1) {
        [self donePressed:nil];
    }
    else { //otherwise, move to the next field
        [[[_fields objectAtIndex:(index + 1)] viewWithTag:TEXT_FIELD_TAG] becomeFirstResponder];
    }
    
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (![_allCapsFields containsObject:textField]) {
        return YES;
    }
    NSRange lowercaseCharRange = [string rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]];
    if (lowercaseCharRange.location != NSNotFound) {
        textField.text = [textField.text stringByReplacingCharactersInRange:range withString:[string uppercaseString]];
        return NO;
    }
    return YES;
}

@end
