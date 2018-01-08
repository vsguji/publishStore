//
//  RTBaseCell.m
//  darongtong
//
//  Created by zy on 2017/9/20.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTBaseCell.h"
#import "UtilsMacro.h"
#import "UIView+Altar.h"
#import "UIView+CustomAutoLayout.h"
#import "ColorMacro.h"

@interface RTBaseCell()
@property (nonatomic,strong) NSIndexPath *cellPath;
@end
@implementation RTBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self loadViews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self loadViews];
    }
    return self;
}

- (instancetype)initWithCellIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])
    {
         // do something
         [self loadViews];
    }
    return self;
}

+ (void)regsisterCell:(UITableView *)tab{
 
    [tab registerClass:[self class] forCellReuseIdentifier:[self cellIdentity]];
}

+ (instancetype)initWithStyle:(UITableViewCellStyle)style tableView:(UITableView *)tab indexPath:(kRegister)cellRegister {
    if (cellRegister == kRegisterUse) {
         return [tab dequeueReusableCellWithIdentifier:[[self class] cellIdentity]];
    }
    return  [self initWithStyle:style indexPath:[tab indexPathForCell:(UITableViewCell*)self]];
}

+ (instancetype)initWithStyle:(UITableViewCellStyle)style indexPath:(NSIndexPath *)path{
    RTBaseCell *cell = [[RTBaseCell alloc] initWithStyle:style reuseIdentifier:[self cellIdentity]];
    cell.cellPath = path;
    
    return cell;
}

+ (NSString *)cellIdentity {
    return NSStringFromClass([self class]);
}

- (void)loadViews {
    // 头像
    _headerIcon = [[UIImageView alloc] init];
    [self.contentView addSubview:_headerIcon];
    
    // 名称
    _userTitle = [[UILabel alloc] init];
    _userTitle.font = FONT(14);
    [self.contentView addSubview:_userTitle];
    
    // 昵称
    _userNick = [[UILabel alloc] init];
    _userNick.textColor  = [UIColor grayColor];
    _userNick.font = FONT(14);
    [self.contentView addSubview:_userNick];

    _normal = [UIImage imageNamed:@"live_circleNormal"];
    _selected = [UIImage imageNamed:@"circleSelected"];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)baseCellSelected:(BOOL)status {
    _isSelected = status;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 头像
    [_headerIcon layoutParentVerticalCenter];
    [_headerIcon alignParentLeftWithMargin:10];
   /// [_headerIcon alignParentTopWithMargin:LENGTH(18)];
    [_headerIcon setSize:(CGSize){LENGTH(32),LENGTH(32)}];
    [_headerIcon layoutParentVerticalCenter];
    
    if (_userNick.text) { // && _userNick.text.length > 0
        // 名称
        [_userTitle layoutToRightOf:_headerIcon margin:LENGTH(15)];
        [_userTitle alignTop:_headerIcon margin:LENGTH(4)];
        [_userTitle setSize:(CGSize){LENGTH(260),HIGHT(15)}];
        // 昵称
        [_userNick layoutBelow:_userTitle margin:HIGHT(10)];
        [_userNick alignLeft:_userTitle];
        [_userNick setSize:(CGSize){LENGTH(260),HIGHT(15)}];
    }
    else {
        // 名称
        [_userTitle layoutToRightOf:_headerIcon margin:LENGTH(15)];
        [_userTitle setSize:(CGSize){LENGTH(260),HIGHT(15)}];
        [_userTitle alignParentCenter];
    }
}

- (void)customerAccessView:(UIImage *)image {
    self.accessoryView = [[UIImageView alloc] initWithImage:image];
}


- (void)prepareForReuse {
    [super prepareForReuse];
    _userTitle.text = nil;
    _userNick.text = nil;
    _headerIcon.image  = nil;
}

- (void)setTapGesture:(UIView *)gesture {
    
    if ([gesture isEqual:self.accessoryView] == NO) {
        self.accessoryView = nil;
    }

    if ([gesture isKindOfClass:[UIImageView class]]) {
        ((UIImageView *)gesture).userInteractionEnabled = YES;
    }
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [gesture addGestureRecognizer:tapGesture];
}

- (void)gestureAction:(UIGestureRecognizer *)gesture {
 
    if (_delegate && [_delegate respondsToSelector:@selector(handlerCurrentCell:)]) {
        [_delegate performSelector:@selector(handlerCurrentCell:) withObject:self];
    }
}

- (void)setCurrentDelegate:(id)parentVC {
    _delegate = parentVC;
}

+ (NSString *)despription {
   return @"";
}

- (void)clearBgColorCell {
    self.backgroundColor = kClearColor;
}

@end

