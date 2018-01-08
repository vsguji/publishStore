//
//  NewShopHSHSAuditStatus.m
//  darongtong
//
//  Created by xie on 17/12/23.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopHSHSAuditStatus.h"
#import "NewShopAuditFlowView.h"
#import "CommonServer.h"
#import "UIView+network.h"
#import "SecretAuditModel.h"
#import "EditSecretFileLivelyVC.h"
#import "KNavigation.h"

@interface NewShopHSHSAuditStatus()
@property (strong, nonatomic) IBOutlet NewShopAuditFlowView *flowProcess;
@property (strong, nonatomic) IBOutlet UIView *hshsContentView;
@property (strong, nonatomic) IBOutlet UIImageView *auditStatusIV;
@property (strong, nonatomic) IBOutlet UILabel *reasonLabel;
@property (strong, nonatomic) IBOutlet UIButton *stopBtn;
@property (strong, nonatomic) IBOutlet UIButton *update;

@property (strong, nonatomic) Person_S_LivelyCell* cell;

@property (strong,nonatomic) NewShopSecretListModel* editModel;




@end

@implementation NewShopHSHSAuditStatus


- (void) awakeFromNib{
    [super awakeFromNib];
    
    //添加
//    [self makeUI];
    
}

#pragma mark -- 创建界面 --
- (void) makeUI{

    _cell = (Person_S_LivelyCell*)[CommonServer getViewByXib:@"Person_S_LivelyCell"];
    _cell.frame = CGRectMake(0, 0, kScreenW, 510);
    [self.hshsContentView addSubview:_cell];
    __weak typeof (self) waskSelf = self;
    _cell.clickStatus = ^(NSDictionary* param ,UIView* btn){//
        __weak typeof (btn) weakbtn = btn;
        __block typeof (param) weakparam = param;
        NSInteger index = 3;
        NSDictionary* dic = @{@"op": ((UIButton*)btn).selected ? @"add" : @"del" ,@"id":param[@"id"]
                              ,@"typeurl":param[@"type"],@"index":@(index)
                              };
        
        [waskSelf.superview uploadDataWith:dic call:^{
            NSString* msg = @"";
            if([weakparam[@"type"] isEqualToString:@"follow"]){
                if(((UIButton*)weakbtn).selected){
                    msg = @"关注成功";
                }else{
                    msg = @"取消关注";
                }
            }else if([weakparam[@"type"] isEqualToString:@"collect"]){
                if(((UIButton*)weakbtn).selected){
                    msg = @"收藏成功";
                }else{
                    msg = @"取消收藏";
                }
            }
            [SVProgressHUD  showWithStatus:msg];
            [SVProgressHUD dismissWithDelay:0.8];
        }];
    };
    [self uploadDataWith];
    
}


- (void) setModel:(WZCLivelyListModel *)model{
    _model = model;
    _cell.cardModel = model;
    //设置绘声绘色 审核状态
    [self mappingAuditStatus:model];
    if(model.is_stop.integerValue == 1){//已经截止
        [self.stopBtn  setImage: [UIImage imageWithColor: [UIColor colorWithHexString:@"AFAF9B"]] forState:UIControlStateNormal];
        [self.update  setImage: [UIImage imageWithColor: [UIColor colorWithHexString:@"7C7969"]] forState:UIControlStateNormal];
    }
    
    
}

- (void) mappingAuditStatus:(WZCLivelyListModel *)model{
    //4|已发布，待审核，审核中  5|审核成功、通过  6|审核未通过  7|待认证，认证中 8|认证通过，认证成功  9|认证失败
    NSInteger step = model.status;
    NSInteger position = 0;
    _reasonLabel.text = model.status_message;
    if(step ==  4 || step ==  3){//审核中
        position = 0;
        _auditStatusIV.image = [UIImage imageNamed:@"newShop_1审核申请"];
    }else if(step ==  5){//审核成功
        position = 1;
        _auditStatusIV.image = [UIImage imageNamed:@"newShop_2审核中"];
    }else if(step ==  6){//审核失败
        position = 1;
        _auditStatusIV.image = [UIImage imageNamed:@"newShop_审核失败"];
    }else if(step ==  7){//认证中
        position = 2;
        _auditStatusIV.image = [UIImage imageNamed:@"newShop_3认证中"];
    }else if(step ==  8){//认证成功
        position = 3;
        _auditStatusIV.image = [UIImage imageNamed:@"newShop_认证成功"];
    }else if(step ==  9){//认证失败
        position = 3;
        _auditStatusIV.image = [UIImage imageNamed:@"newShop_认证失败"];

    }
    
    if(model.is_stop.integerValue == 1){//截止
        //高亮
        [_stopBtn setTitleColor:[UIColor colorWithHexString:@"AFAF9B"] forState:UIControlStateNormal];
         [_update setTitleColor:[UIColor colorWithHexString:@"7C7969"] forState:UIControlStateNormal];
    }else if(model.is_stop.integerValue == 2){//修改
        [_stopBtn setTitleColor:[UIColor colorWithHexString:@"7C7969"] forState:UIControlStateNormal];
        [_update setTitleColor:[UIColor colorWithHexString:@"AFAF9B"] forState:UIControlStateNormal];
    }
    
    
    // 小于  position 的都是正常的
    NSMutableArray*  statusArray = [[NSMutableArray alloc]init];
    for(int i = 0;i < 4; i++){
        SecretAuditModel* model = [[SecretAuditModel alloc]init];
        model.position = i;
        if(i == position){//当前状态  if
            model.statusFont = [UIColor whiteColor];
            model.statusCircle = [UIColor colorWithHexString:@"63a5ff"];
            if(step == 6){//审核失败
                model.statusCircle = [UIColor colorWithHexString:@"ff6a55"];
                model.statusText = @"审核失败";
                model.statusFont = [UIColor redColor];
            }else if(step == 9){//认证失败
                model.statusCircle = [UIColor colorWithHexString:@"ff6a55"];
                model.statusText = @"认证失败";
                model.statusFont = [UIColor redColor];
            }
        }else if(i < position){// 已经通过状态
            model.statusFont = [UIColor whiteColor];
            model.statusCircle = [UIColor colorWithHexString:@"29c700"];
        }else{//未到达的状态
            model.statusFont = [UIColor colorWithHexString:@"dcddbf"];
            model.statusCircle = [UIColor colorWithHexString:@"a0a389"];
        }
        [statusArray addObject:model];
    }
    
    [_flowProcess selectedStep:statusArray];


}





#pragma mark----- 获取单条绘声绘色接口 -----
- (void)    uploadDataWith {
    
    DaRongTongUser* userSingle = [DaRongTongUser sharedSingleton];
    if (userSingle.tokenString == nil || userSingle.tokenString.length < 1) {
        KPostNotification(KLoginOutNotification);
        return ;
    }else{
        __weak  typeof (self) weakSelf = self;
        NSDictionary* dicParam = @{ @"token":userSingle.tokenString,
                                    @"customer_id":userSingle.customer_id,
                                    @"id":_hshs_id,
                                    };
        [SVProgressHUD show];
        [[NetworkManager sharedInstance] POST:KGetHSHSLDetailListUrl parameters:dicParam success:^(id responseObject) {
            int code = [responseObject[@"code"] intValue];
            NSDictionary *dict = (NSDictionary *)responseObject;
            [SVProgressHUD dismiss];
            switch (code){
                case 200:
                {
                    
                    NSDictionary* dic =  dict[@"data"];
                    WZCLivelyListModel* model = [WZCLivelyListModel mj_objectWithKeyValues:dic];
                    [weakSelf setModel:model];
                    weakSelf.editModel = [NewShopSecretListModel mj_objectWithKeyValues:dic];
                    
                }
                    break;
                case 201:
                {
                    KPostNotification(KLoginOutNotification);
                }
                    break;
                default:
                    [SVProgressHUD showErrorWithStatus:dict[@"message"]];
                    [SVProgressHUD dismissWithDelay:1.5];
                    break;
            }
            
        } failure:^(NSError *error) {
            NSLog(@"========%@",error);
            [SVProgressHUD dismiss];
        }];
    }
    
}


#pragma mark----- 截止店铺密档 -----
- (void)    endShopSecretFile{
    
    __weak typeof(self) weakSelf = self;
    DaRongTongUser* userSingle = [DaRongTongUser sharedSingleton];
    if (userSingle.tokenString == nil || userSingle.tokenString.length < 1) {
        KPostNotification(KLoginOutNotification);
        return ;
    }else{
        NSDictionary* dicParam = @{ @"token":userSingle.tokenString,
                                    @"customer_id":userSingle.customer_id,
                                    @"id":_hshs_id,
                                    @"status":@"2",
                                    };
        [SVProgressHUD show];
        [[NetworkManager sharedInstance] POST:kEndShopSecretUrl parameters:dicParam success:^(id responseObject) {
            int code = [responseObject[@"code"] intValue];
            NSDictionary *dict = (NSDictionary *)responseObject;
            [SVProgressHUD dismiss];
            switch (code){
                case 200:
                {
                    [SVProgressHUD showWithStatus:@"截止成功"];
                    [SVProgressHUD dismissWithDelay:0.8];
                    weakSelf.model.is_stop = @"1";
                }
                    break;
                case 201:
                {
                    KPostNotification(KLoginOutNotification);
                }
                    break;
                default:
                    [SVProgressHUD showErrorWithStatus:dict[@"message"]];
                    [SVProgressHUD dismissWithDelay:1.5];
                    break;
            }
            
        } failure:^(NSError *error) {
            NSLog(@"========%@",error);
            [SVProgressHUD dismiss];
        }];
    }
    
}



- (IBAction)stopAudit:(id)sender {
    
    [self endShopSecretFile];
    [self.stopBtn  setImage: [UIImage imageWithColor: [UIColor colorWithHexString:@"7C7969"]] forState:UIControlStateNormal];
    [self.update  setImage: [UIImage imageWithColor: [UIColor colorWithHexString:@"AFAF9B"]] forState:UIControlStateNormal];

    
    
}


- (IBAction)updateHSHS:(id)sender {
    
    if(_model.is_stop.integerValue == 1){//已截止
        
        __block EditSecretFileLivelyVC *meipian = [[EditSecretFileLivelyVC alloc] init];
        meipian.editModel = _editModel;
        DaRongTongUser* user  = [DaRongTongUser sharedSingleton];
        meipian.custom_id = user.customer_id;
        meipian.secretTitle = _editModel.name;
        [[KNavigation getNavigation] pushViewController:meipian animated:YES];
        
    }else{
        [SVProgressHUD showWithStatus:@"请先”截止“在进行编辑！"];
        [SVProgressHUD dismissWithDelay:0.8];
    }

    
}



@end
