//
//  NewShopAuditFlowView.m
//  darongtong
//
//  Created by xie on 17/12/23.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopAuditFlowView.h"
#import "Masonry.h"
#import "SecretAuditModel.h"

@implementation NewShopAuditFlowView

- (void) awakeFromNib{
    [super awakeFromNib];
    [self createFlowView];
    
    
}

#pragma mark -- 创建流程图 --
- (void) createFlowView{
    CGFloat sumWidth = kScreenW - 80;
    UILabel*  flowLine = [[UILabel alloc]init];
    flowLine.frame = CGRectMake(0, 0, sumWidth, 2);
    flowLine.backgroundColor = [UIColor whiteColor ];
    [self addSubview:flowLine];
    __weak typeof(self) weakSelf = self;

    [flowLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(2);
        make.width.equalTo(sumWidth);
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf);
    }];
    
    NSArray* steps = @[@"审核中",@"审核成功",@"认证中",@"认证成功"];
    CGFloat space = sumWidth/3;
    
    for(int i = 0; i < steps.count;i++){
        // i 间距 * 本身的宽度
        CGFloat startPosition = i * space  +  80/2/2;
        //创建 step 和 label
        __block UIView*  rectView = [[UIView alloc]init];
        [self addSubview:rectView];
        [rectView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(40);
            make.height.equalTo(40);
            make.left.equalTo(startPosition);
            make.centerY.equalTo(weakSelf).mas_offset(5);
            
        }];
        
        UIButton* circleBtn = [[UIButton alloc]init];
        [rectView addSubview:circleBtn];
        circleBtn.tag = 100+i;
        circleBtn.backgroundColor = [UIColor colorWithHexString:@"a2a28a"];
        circleBtn.layer.masksToBounds = YES;
        [circleBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(20);
            make.height.equalTo(20);
            make.top.equalTo(rectView).mas_offset(5);
            make.centerX.equalTo(rectView);

        }];
        circleBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        circleBtn.layer.borderWidth = 2;
        circleBtn.layer.cornerRadius = 20*0.5;
        [circleBtn  setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        circleBtn.titleLabel.font = [UIFont systemFontOfSize:8];
        [circleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        UILabel*  status = [[UILabel alloc]init];
        [rectView addSubview:status];
        status.text = steps[i];
        status.tag = 200+i;
        status.font = [UIFont systemFontOfSize:10];
        [status mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(rectView);
            make.centerX.equalTo(rectView);

        }];
    }
}

- (void) selectedStep:(NSArray*) array{
    
    for(int i = 0;i < array.count ; i++){
        
        SecretAuditModel* model = array[i];
        if(model.statusText){
            UILabel* label  = [self viewWithTag:200+i];
            label.text = model.statusText;
        }
        UIButton* selectBtn = [self viewWithTag:100+i];
        selectBtn.backgroundColor = model.statusCircle;
        UILabel* label  = [self viewWithTag:200+i];
        label.textColor = model.statusFont;
        

    }
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
