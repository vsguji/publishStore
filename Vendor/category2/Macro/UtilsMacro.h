//
//  UtilsMacro.h
//  darongtong
//
//  Created by pro on 15/7/20.
//  Copyright (c) 2015年 darongtong. All rights reserved.
//

#ifndef darongtong_UtilsMacro_h
#define darongtong_UtilsMacro_h

//1.字体
//主标题
#define KTitleFont [UIFont systemFontOfSize:15]
//详细文本字体
#define KDetailTitleFont14 [UIFont systemFontOfSize:14]
#define KDetailTitleFont [UIFont systemFontOfSize:13]
#define KDetailTitleFont12 [UIFont systemFontOfSize:12]
#define KDetailTitleFont11 [UIFont systemFontOfSize:11]
#define KCellheight 48
#define KCellBackgroundColor RGBA(255, 255, 255, 0.5)

//字体大小适配
#define AdaptFont(floatValue) [UIFont systemFontOfSize:(floatValue*(SCREEN_WIDTH/375))]
//#define AdaptFont(floatValue) [UIFont systemFontOfSize:kFontSizeWithpx(floatValue)*(SCREEN_WIDTH/375)]


//像素转字体大小并适配机型
//#define AdaptFontWithPX(floatValue) [UIFont systemFontOfSize:(kFontSizeWithpx(floatValue))*(SCREEN_WIDTH/375)]

//#define AdaptFontWithPX(floatValue) [UIFont systemFontOfSize:kFontSizeWithpx(floatValue)]

//#define AdaptFontWithPX(floatValue) [UIFont systemFontOfSize:floatValue/96 *72*(SCREEN_WIDTH/375)]

//像素转磅
#define kFontSizeWithpx(px) ((px/96) * 72)*(SCREEN_WIDTH/375)
//#define DCSystemFontWithpx(px) [UIFont systemFontOfSize:kFontSizeWithpx(px)]

//字体适配
#define SizeScale ((SCREEN_HEIGHT > 568) ? SCREEN_HEIGHT/568 : 1)
#define FONT_SIZE(floatValue) [UIFont systemFontOfSize:floatValue*SizeScale]



#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define HexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 2.获得RGB颜色
#define RGBA(r, g, b, a)      [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)          RGBA(r, g, b, 1.0f)

#define FONT(floatValue) [UIFont systemFontOfSize:floatValue]

#ifdef __OPTIMIZE__
# define YYLog(...)
# define NSLog(...)
#else

# define YYLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//# define NSLog(...) NSLog(__VA_ARGS__)
#endif
#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];
//高德地图
#define SCREEN_WIDTH                    CGRectGetWidth([UIScreen mainScreen].bounds)
#define SCREEN_HEIGHT                   CGRectGetHeight([UIScreen mainScreen].bounds)
#define TITLE_HEIGHT                    64.f
//
#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height
#define kScreen_Frame  (CGRectMake(0, 0 ,kScreenW,kScreenH))
#define kScreen_ContentFrame  CGRectMake(0, 0 ,kScreenW,kScreenH-64)

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


//***********************************************************

#define iPhone7_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080,1920), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_Plus_amp ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2001), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//iPhone6为参考
#define LENGTH(x)       (x*([UIScreen mainScreen].bounds.size.width/375.0))
#define HIGHT(x)       (x*([UIScreen mainScreen].bounds.size.height/667.0))

//等比例伸缩
#define iPhone6Plus_scale_w 1.104
#define iPhone6Plus_scale_h 1.10345
#define iphone5_scale_w 0.85333
#define iphone5_scale_h 0.851574
#define iphone4_scale_w 0.85333
#define iphone4_scale_h 0.7196

#define APP_CGRectMake(x,y,w,h)  (iPhone6_Plus)?CGRectMake(floor((x)*iPhone6Plus_scale_w), floor((y)*iPhone6Plus_scale_h), floor((w)*iPhone6Plus_scale_w), floor((h)*iPhone6Plus_scale_h)):iPhone5?CGRectMake(floor((x)*iphone5_scale_w), floor((y)*iphone5_scale_h), floor((w)*iphone5_scale_w), floor((h)*iphone5_scale_h)):iPhone4?CGRectMake(floor((x)*iphone4_scale_w), floor((y)*iphone4_scale_h), floor((w)*iphone4_scale_w), floor((h)*iphone4_scale_h)):CGRectMake((x), (y), (w), (h))



#define APP_CONTENT_WIDTH_PRAM(a)  LENGTH(a)

#define APP_CONTENT_HIGHT_PRAM(a)  LENGTH(a)

#define APP_CONTENT_Y_PRAM(a) LENGTH(a)

#define APP_CONTENT_X_PRAM(a) LENGTH(a)

//***********************************************************

#define kFontBig18  18
#define kFontMid16 16
#define kFontMid17 17
#define kFontSize15 15
#define kFontSize14 14
#define kFontSmall12 12
#define kDatabaseFileName       @"darongtong.sqlite"
//讯飞 begin
#define APPID_VALUE           @"562899fa"
#define URL_VALUE             @""                 // url
#define TIMEOUT_VALUE         @"20000"            // timeout      连接超时的时间，以ms为单位
#define BEST_URL_VALUE        @"1"                // best_search_url 最优搜索路径

//腾讯IM
//#define kTLSAppid       @"1400013335"
//#define kSdkAppId       @"1400013335"
//#define kSdkAccountType @"Jacky"

//begin 阿里云
#define oss_AK @"1eyMWF0UhCPGfugs"
#define oss_SK @"sAFBWX18kZvlEnvftM1QaFNzIxWy6f"
#define oss_ENDPOINT @"http://oss-cn-beijing.aliyuncs.com"
#define oss_public_BUCKET @"darongtong"
#define oss_upload_Multipart @"multipartUploadObject"
#define imgprefix @"http://darongtong.oss-cn-beijing.aliyuncs.com/"
//end
//umeng
//#define kUmeng_AppKey @"566edbc367e58ef5bc00438a" //2118213198@qq.com

#define kUmeng_AppKey @"5699df7467e58e2132002d49" //luozhuren@huarenlvshi.com

#define kSocial_WX_ID @"wx6713bd0e83c65e74"//weixin
#define kSocial_WX_Secret @"449fd6f10d6ba5d03473c0df05a238be"
//#define kSocial_QQ_ID  @"1104945909"//qq
//#define kSocial_QQ_Secret @"HzIAVPrlDN2beb1A"
#define baseUrlStr @"http://www.umeng.com/social"
#define wibo @"2943705631"
#define wibo_Secret @"1da19c6634ba280a189456be8e110af3"
#define kSocial_Sina_RedirectURL @"http://sns.whalecloud.com/sina2/callback"


#define kSocial_QQ_ID  @"1106011762"//qq
#define kSocial_QQ_Secret @"dcw7hbunFhd64muY"


//end
//MBProgrees提示
#define kHUDDismissDelayTime 1.5
//begin 环信
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"
#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]
#define kHuanXinPassword @"darongtong"
#define openOrcloseHuanXin 0  //1开启 0关闭

//Bugtags

#define kBugtagsParam @"85ad44cabaea243e66aa0dccc3c71aa9"


//end
//本地参数
#define UserDefaults            [NSUserDefaults standardUserDefaults]

#define TOKENSTRING  [DaRongTongUser sharedSingleton].tokenString
#define CUSTOMERID  [DaRongTongUser sharedSingleton].customer_id

//本地通知
#define KLoginSucessNotification             @"loginSuccess"
#define KLoginOutNotification                @"loginOut"
#define KUpdateUserInfo                      @"updateUserInfoSucced"
#define KSelectedAddressNotification         @"selectedAddress"

//通知
#define KPostNotification(notificationName) [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];

//照片存储路径
#define KOriginalPhotoImagePath   \
[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"PhotoImages"]

//视频存储路径
#define KVideoUrlPath   \
[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"VideoURL"]


#define kCommonLargeTextFont       [UIFont systemFontOfSize:16]
#define kCommonMiddleTextFont      [UIFont systemFontOfSize:14]
#define kCommonSmallTextFont       [UIFont systemFontOfSize:12]


#endif
