//
//  UIView+network.m
//  darongtong
//
//  Created by xie on 17/9/13.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "UIView+network.h"
#import "HUBShow.h"
#import "ChatViewControllers.h"
#import "IMAChatViewController.h"
#import "KNavigation.h"
@implementation UIView (network)




#pragma mark----- 关注 和收藏 接口 -----  人 说说 直播 绘生绘色
- (void)uploadDataWith:(NSDictionary*) param call:(void(^)()) call {
    NSArray*  types  = @[@"3",@"1",@"5",@"2",@"4"]; //关注
    
    //type 类型 默认1 1|好友(人,家们家里) 2|坛 3|绘声绘色 4|说说 5|活动 6|直播 //收藏
    //&type=1 选填 1|说说   2|绘声绘色  3|家门家里(人)  4|关注店铺 5|直播  默认1 //关注
    
    __weak typeof(self) weakSelf = self;
    __block typeof(call) weakCall = call;
    NSString* strUrl = kdoFollowPost;
    if([param[@"typeurl"] isEqualToString:@"follow"]){//关注
        if([param[@"op"] isEqualToString:@"del"]){
            strUrl =  kdoDelFollowPost;
        }
    }else if([param[@"typeurl"] isEqualToString:@"collect"]){//收藏
       types  = @[@"1",@"4",@"6",@"3",@"7"]; //收藏
        strUrl =  KHSHSListAddcollectUrl;
        if([param[@"op"] isEqualToString:@"del"]){
            strUrl =  KHSHSListCancel_collectUrl;
        }
    }
    
    DaRongTongUser*  userSingle = [DaRongTongUser sharedSingleton];
    NSDictionary *dicParam = [NSDictionary dictionaryWithObjectsAndKeys:types[[param[@"index"] integerValue]],@"type", userSingle.tokenString,@"token",userSingle.customer_id,@"customer_id",param[@"id"],@"item_id",param[@"id"],@"collect_id",nil];
    
    [[NetworkManager sharedInstance] POST:strUrl parameters:dicParam success:^(id responseObject) {
        int code = [responseObject[@"code"] intValue];
        NSDictionary *dicAll = (NSDictionary *)responseObject;
        NSData *data = [NSJSONSerialization dataWithJSONObject:dicAll options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"返回数据====%@", jsonString);
        switch (code) {
            case 200:
            {
                if(weakCall){
                    weakCall();
                }
            }
                break;
            default:
                break;
        }
    } failure:^(NSError *error) {
        [HUBShow show:weakSelf.superview timer:1];
    }];
}


#pragma mark - 发起约坛接口
- (void)addYueTanRequestAFN:(MySays_CommentModel *)mModel type:(NSString*)ty{
    
        if ([mModel.customer_id isEqualToString:CUSTOMERID]) {
            [Alert showWithTitle:@"自己不能约谈自己"];
            return;
        }
        DaRongTongUser *user = [DaRongTongUser sharedSingleton];
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        [parameter setObject:user.tokenString forKey:@"token"];
        [parameter setObject:user.customer_id forKey:@"customer_id"];
        [parameter setObject:mModel.customer_id forKey:@"f_customer_id"];
        [parameter setObject:mModel.ID forKey:@"from_id"];
        [parameter setObject:ty forKey:@"type"];
        [SVProgressHUD showWithStatus:@"数据加载中..."];
        [[NetworkManager sharedInstance] POST:kgetAltarAddYueAltarUrl parameters:parameter success:^(id responseObject) {
            [SVProgressHUD dismiss];
            NSDictionary *responseData = (NSDictionary *)responseObject;
            int code = [responseData[@"code"] intValue];
            if (code == 200) {
                [SVProgressHUD showWithStatus:responseData[@"message"]];
                [SVProgressHUD dismissWithDelay:1.5];
                [SVProgressHUD dismissWithDelay:1 completion:^{
                    IMAUser *user = [[IMAUser alloc]init];
                    user.userId = mModel.customer_id;
                    user.nickName = mModel.nick_name;
                    user.icon = mModel.head_pic;
                    ChatViewControllers *vc = [[IMAChatViewController alloc] initWith:user];
                    [[KNavigation getNavigation] pushViewController:vc animated:YES];
                }];
            }else{
                [SVProgressHUD showWithStatus:responseData[@"message"]];
                [SVProgressHUD dismissWithDelay:1.5];
            }
        } failure:^(NSError *error) {
            [SVProgressHUD dismiss];
            [SVProgressHUD showErrorWithStatus:@"网络错误"];
            [SVProgressHUD dismissWithDelay:1.5];
        }];

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
