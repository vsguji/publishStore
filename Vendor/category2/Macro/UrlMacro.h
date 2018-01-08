
//
//  UrlMacro.h
//  网络请求url
//  Created by pro on 15/7/27.
//  Copyright (c) 2015年 darongtong. All rights reserved.
//

#define UAT 1
#if UAT
//idcard_status
//#define kBaseURLString @"http://drt.darongtong.cn/index.php"//上线版本
#define kBaseURLString @"http://darongtong.cn/index.php"//上线版本
//#define kBaseURLString @"http://192.168.1.133/index.php"//测试版本



//#define kBaseURLString @"http://192.168.1.250/index.php/index.php?route=individuality/record/getlist"//测试版本



#define uploadBaseUrl  @""
#else
//#define kBaseURLString @"http://192.168.0.10/index.php"

#endif
#define kHUDDismissDelayTime 1.5

//登录注册
#define KLoginUrl  @"?route=json/account/login"  //登录
#define KregistUrl @"?route=json/account/register"  //注册
#define KresetUrl  @"?route=json/account/backPwd" //重置密码
#define updateUserUrl @"?route=json/account/doMemberInfo" //修改个人资料
#define getDarongtongUserInfo @"?route=json/account/getOtherInfo"//查看他人资料
#define getSelfInfo @"?route=json/account/getInfo" //查看自己的个人资料
//#define completeUserInfoUrl @"?route=json/account/doMemberInfo"//注册后完善资料
#define KuaijieUrl @"?route=json/account/checkisbind" //快捷登录接口
#define KuaijieBangUrl @"?route=json/account/tobindopenid" //快捷绑定账户接口
#define KuaijiezhuceUrl @"?route=json/account/registerandbind" //快捷注册&绑定接口
#define KuaijieMobileUrl @"?route=json/account/checkTelephoneExists" //检测手机号是否已经注册
 #define KuaijieUnUrl @"?route=json/account/unBindOpenid" //解除绑定
//
#define kaddGetTanServiewList @"?route=tan/fields/fields_list" //发布服务列表

//验证码
#define KGetCheckCodeUrl  @"?route=json/account/sendSms"
#define kGetSqlLogUrl @"?route=json/category/getLog" //检查sql更新
//主页
#define kCaseListUrl @"?route=json/list" //获取案例列表
#define kLianAnListUrl @"?route=json/list/relevantCase"//获取联案列表
#define kSearchLianAnUrl @"?route=json/list/search" //搜索联案
#define kSearchPersonUrl @"?route=json/account/search" //搜索人
#define kCaseDetailUrl @"?route=json/list/getInfo" //案例详情页

//新版主页 接口
#define kNewHomeUrl @"?route=home/record/getlist" //首页接口
#define khistorySearch @"?route=person/search/historySearch" // 搜索历史
#define kSearchKeyword @"?route=person/search/hotword" // 热门搜索
#define kSortFilter @"?route=individuality/category/sortFilter" // 排选

//
//投资
#define KInvestMoneyListUrl @"?route=json/investcurrency"  //投资货币列表
#define KInvestInfoListUrl  @"?route=json/investinfo"  //投资信息列表
#define KInvestTechListUrl  @"?route=json/investtech"  //投资科技列表
#define KInvestArgListUrl   @"?route=json/investfarming"  //投资大农列表
#define KInvestSiteListUrl  @"?route=json/investspace"  //投资场地列表
#define KInvestTeamListUrl  @"?route=json/investteam"  //投资团队列表
#define KInvestdevListUrl   @"?route=json/investdevice"  //投资设备列表

#define KInvestMoneyUrl  @"?route=json/investcurrency/add"  //投资货币
#define KInvestInfoUrl   @"?route=json/investinfo/add"  //投资信息
#define KInvestTechUrl   @"?route=json/investtech/add"  //投资科技
#define KInvestArgUrl    @"?route=json/investfarming/add"  //投资大农
#define KInvestSiteUrl   @"?route=json/investspace/add"  //投资场地
#define KInvestTeamUrl   @"?route=json/investteam/add"  //投资团队
#define KInvestdevUrl    @"?route=json/investdevice/add"  //投资设备

#define KMyInvestUrl  @"?route=json/account/getMyInvest"//i投资
#define KMyInvestProcessUrl @"?route=json/list/getProgress" //i投资进度
#define KGetMyTrendsList @"?route=json/account/getMyTrendsList" //i忏悔月宣说

//设置
#define kUpdateUserPwd @"?route=json/account/updatePwd" //修改密码
#define kWebJointUrl @"http://m.darongtong.cn/about/join.html" // 加入我们
#define kWebHelpShowUrl @"http://m.darongtong.cn/about/help.html" //帮助说明
//消息
//坛
#define kaddFriendUrl @"?route=json/account/addFriend" //申请加好友
#define kagreeFriendUrl @"?route=json/account/agreeFriend" //同意加好友
#define kaddTanUrl @"?route=json/account/addGroupMember" //申请加入坛－公坛，私坛，七访坛
#define kagreeTanUrl @"?route=json/account/agreeGroupMemer" //拒绝加群
#define kgetTanListUrl @"?route=json/account/getUserJoinedGroup" //获取用户加入点坛列表
#define kgetQianSongTanListUrl @"?route=json/account/getUserJoinedComment" //获得首页遣颂、师说列表
#define kgetFriendUrl @"?route=json/account/getFriendList"//获取好友列表
//我的
#define kFollowPersonUrl @"?route=json/account/search" //关注－关注的人搜索
#define kFollowCaseUrl @"?route=json/account/followCase"//关注或取消案例－－动作
#define kfollowCustomer @"?route=json/account/followCustomer" //关注或取消人－－动作
#define kMyFollowPersonUrl @"?route=json/account/getMyFollowCustomerList"//关注的人列表
#define kFavCaseUrl @"?route=json/account/collectCase"//收藏的案例 －－动作
#define kgetMyFollowCaseUrl @"?route=json/account/getMyFollowCase" //我关注的案例
#define kGetMyCollectionCaseUrl @"?route=json/account/getMyCollectCase" //i收藏

#define kMainThemeUrl @"?route=json/list/coreIdea" //中心思想
#define kReportPerson @"?route=json/account/reportCustomer" //举报人
#define ksubmitProveUrl @"?route=json/prove/addAptitude" //资质证明
#define kGetProveUrl @"?route=json/prove/getAptitude" //获取资质证明
#define kSubmitWealthUrl @"?route=json/prove/addWealth"//财富认证
#define kGetWealthUrl @"?route=json/prove/getWealth" //获取财富单证
#define KGetMyCaseUrl @"?route=json/account/getMyCaseList" //i案例

//八卦相关
#define KAddCommentUrl @"?route=json/account/addComment"
#define KgetCommentListUrl @"?route=json/list/getComment"

//上传通讯录
#define kUploadConstantUrl @"?route=json/account/checkPhones"
#define kUploadCardImg     @"?route=json/account/cardScan"  //上传名片
#define kGetMusicList @"?route=json/music/index"//获取音乐

//团队列表
#define KGetTeamListUrl @"?route=invest/team/listTeam"
#define KCreatTeamUrl   @"?route=invest/team/add"
//#define <#macro#>
//宣说圈
#define kMyFriendListUrl @"?route=json/account/getMyTrendsList" //个人中心－我的宣说圈
#define kChanHuiAddUrl @"?route=json/list/addTrends" //发布忏悔与宣说
#define kGetChanHuiListUrl @"?route=json/list/getTrendsList" //获得忏悔列表
//#define PGetPublishMySays_PicUrl @"?route=json/list/add_say_some" //发布说说
#define PGetPublishMySays_PicUrl @"?route=subject/say/add" //添加说说
//#define PGetMySaysList_PicUrl @"?route=json/list/get_list" //获取说说消息列表
#define PGetMySaysList_PicUrl @"?route=subject/say/getsOthers" //获取说说消息列表
#define kSaySayDeleteUrl @"?route=reply/say/del" //说说回复删除



#define PxuanshuoMySaysList_PicUrl @"?route=home/declare/declareIndex" //宣说列表

//家里
#define kUpdoorMessageUrl @"?route=tan/message/newMessageData" // 消息数量
#define kGetJiliMessageUrl @"?route=tan/message/getMessageData" //家里 消息列表
#define kGetJiliFriendListUrl @"?route=json/homedata/getRelationData" // 家里 好坛友列表
#define kGetBaFangShehuiJiaoseDetailUrl @"?route=json/card/roleInfo" // 家里 八方社会角色详情



//
#define PUpdateMySaysUserDescribe_PicUrl @"?route=json/list/ap_say_show" //添加与更新用户描述
#define PGetMySaysUserDescribe_PicUrl @"?route=json/list/get_say_show" //获取用户描述
#define PGetMySaysCommentList_PicUrl @"?route=comment/say/gets" //获取说说评论列表
#define PGetMySaysAddComment_PicUrl @"?route=comment/say/add" //说说 增加评论
#define PGetMySaysDelete_PicUrl  @"?route=subject/say/del" //说说 删除
#define PGetMySaysDeleteComment_PicUrl @"?route=comment/say/del"//说说删除评论

#define PGetMySaysGetZanList_PicUrl @"?route=zan/say/gets" //说说 获取点赞列表
#define PGetMySaysAddZan_PicUrl @"?route=zan/say/add" //说说 增加点赞
#define PGetMySaysCancelZan_PicUrl @"?route=zan/say/del" //说说 取消点赞

#define PGetMySaysGetDetail_PicUrl @"?route=subject/say/get" //说说 他人说说详情列表

#define PGetMySaysCommentAddZan_PicUrl @"?route=zan/saycomment/add" //说说评论 增加点赞
#define PGetMySaysCommentCancelZan_PicUrl @"?route=zan/saycomment/cannel" //说说评论 取消点赞
#define PGetMySaysCommentGetZanList_PicUrl @"?route=zan/saycomment/gets" //说说评论 获取点赞列表






//发布案例--
#define kAddCaseUrl  @"?route=json/list/addCase" //添加案例
#define kAddMeipianUrl @"?route=subject/hshs/add" // 添加绘声绘色 ---新
#define kAddMeipianSubUrl @"?route=subject/hshsitem/add" // 添加绘声绘色子内容 ---新

#define kAddHSHSContentUrl @"?route=subject/hshs/add" // 添加绘声绘色子内容


#define kAddsuqiuUrl @"?route=case/perfect/addappea" // 添加诉求
#define kpublishStoryUrl @"?route=case/perfect/addSummary" //添加创业故事
#define kAddPlayBookUrl @"?route=case/perfect/addjihua" //添加商业计划书
#define kAddChuanYeUrl @"?route=case/perfect/addChuangxing" //创业气象
#define kAddLiChengUrl @"?route=case/course/addCaseCourse" //添加历程
#define kGetLiChengUrl @"?route=case/course/getCaseCourse" //获取历程
#define kDelLiChengUrl @"?route=case/course/deleteCaseCourse" //删除历程
#define KAddWuChanPinUrl @"?route=case/case/addGood"//添加物产品
#define KAddStoreListUrl @"?route=case/case/getPropertyList"//添加商品列表
#define KAddGuiGeMoBanUrl @"?route=case/case/addModel"//添加规格模板
#define KGuigemobanListUrl @"?route=case/case/getModelList"//规格模板列表
//品
#define KGetPinCategoryUrl @"?route=good/good/index" //获取品的分类
#define KGetFourCategoryUrl @"?route=good/good/getNextCategory"//获取品的4级分类
#define KGetGoodsDetailMsgUrl @"?route=good/good/getGoodDetail"//商品详情界面
#define KGetGoodsListUrl @"?route=good/good/getGoodList"//商品列表界面

//地图
#define PGetAddressAndHead_PicUrl @"?route=case/user/getMap" //地图获取用户头像


#define PGetHshsListUrl @"?route=individuality/record/getlist" //个性绘声绘色接口

//新版首页
#define kgetIndexData @"?route=home/record/getIndexData" // 首页

#define kgetsRecommend @"?route=home/record/getsRecommend" // 推荐数据




// 五行分类根据id获取子节点
#define kgetCategoryByNodeid     @"?route=category/category/getMoreListByPartentid"

//获取分类直接子节点
#define  kgetCategroyChilds    @"?route=category/category/getListByPartentid"



//个性
#define KGetPersonMyHomeUrl @"?route=person/myhome/myhome" //个性总结口
#define KGetPersonSearchUrl @"?route=individuality/type/list"//个性搜索
#define KGetSearchUrl @"?route=individuality/category/getElementsCates"// 搜索
#define KGetHomeSearchUrl @"?route=home/category/getElementsCates"//获取沙漏
#define KGetWishCheck @"?route=home/record/getWishCheck" //个性观察看好列表
#define KAddWatch @"?route=wishcheck/wishcheck/add" //个性 看好观察



#define KDevURL @"?route=home/drthelp/state" // 是否是开发模式
#define KAddLnglat @"?route=map/lnglat/add" // 添加坐标
#define KGetLnglat @"?route=map/lnglat/gets" // 地址列表
#define KGetExistAddress @"?route=map/lnglat/getsList" // 获取 用户已经存在的地址 接口




#pragma mark ------- 绘声绘色  ----------
//===================== 绘声绘色 =================
#define KGetLivelyListUrl @"?route=subject/hshs/getsOthers"//获取绘声绘色列表
#define KGetLivelyUserDetailUrl @"?route=json/list/get_say_show"//获取绘声绘色用户描述
#define kdoFollowPost  @"?route=attention/attention/add" //关注接口
#define kdoDelFollowPost  @"?route=attention/attention/del" //取消接口
#define kdoFollowPostDel @"?route=subject/hshs/del"
#define kdoDelComment @"?route=comment/hshs/del"
#define kdoDelReplyComment @"?route=reply/hshs/del"//绘生绘色删除二级回复




#define KGetHSHSLDetailListUrl @"?route=subject/hshs/get"//获取绘声绘色详情页

//点赞
#define KHSHSListAddZan @"?route=zan/hshs/add"//绘声绘色列表点赞
#define KHSHSListCancel_Zanurl @"?route=zan/hshs/del"//绘声绘色列表取消点赞


#define KGetHSHSListAddZanList @"?route=zan/hshs/zanCustomers"//绘声绘色列表点赞列表
//收藏
#define KHSHSListAddcollectUrl @"?route=json/collect/add_collect"//绘声绘色列表收藏
#define KHSHSListCancel_collectUrl @"?route=json/collect/del_collect"//绘声绘色列表取消收藏





//评论
#define KGetsHSHSCommentList @"?route=comment/hshs/gets"//绘声绘色评论列表
#define KAddHSHSCommentList @"?route=comment/hshs/add"//绘声绘色添加评论
#define KAddHSHSCommentReplyList @"?route=reply/hshs/add"//绘声绘色添加评论回复


#define KAddHSHSListCommentDecryList  @"?route=vote/hshscomment/add"  //绘声绘色评论 增加<颂扬>谴责


#define KAddUserDescUrl @"?route=json/list/ap_say_show"//添加用户描述  1为说说  2为绘声绘色  (必填)

//直播
#define KGetLiveRoomIDUrl @"?route=qcloud/live/getRoomId" //申请唯一房间号



//腾讯云Tan
#define kgetTXIMUserInfoUrl @"?route=json/account/getUsersig"//获取腾讯im用户信息接口
#define kgetTheAltarSearchUserInfoUrl @"?route=json/tan/search_user"//搜索用户 根据融通号和手机号
#define kgetTheAltarGetUserInfoUrl @"?route=json/tan/portrait_get"//获取用户资料
#define kgetTheAltarAddFriendUrl @"?route=json/tan/friend_import"//添加好友
#define kgetTanFriendUrl @"?route=json/tan/friend_get_all"//获取好友列表
#define kgetTheAltarTanUrl @"?route=json/tan/contacts_tan_list"//获取坛分类
#define kgetModifyFriendRemarkUrl @"?route=json/tan/portrait_set"//修改好友备注
#define kgetNewFriendUrl @"?route=json/tan/friend_get_all"//新好友列表
#define kgetDetermineFriendUrl @"?route=json/tan/friend_agree"//确定新好友
#define kegDelegateFriendUrl @"?route=json/tan/friend_delete"//删除好友
#define kgetAddCollectUrl @"?route=json/collect/add_collect"//添加收藏
#define kgetDelCollectUrl @"?route=json/collect/del_collect"//删除收藏
#define kgetAddBlackUrl @"?route=json/tanblack/add_black"//添加黑名单
#define kgetDelBlackUrl @"?route=json/tanblack/del_black"//删除黑名单
#define kgetCollectListUrl @"?route=json/collect/collect_lists"//收藏列表
#define kgetTanGroupFriendGetAllUrl @"?route=json/tangroup/friend_get_all"//带有群成员列表
#define kgetTanGreateGroupUrl @"?route=json/tangroup/create_group"//创建坛
#define kgetTanGroupInfoUrl @"?route=json/tangroup/get_group_info"//坛详情
#define kgetTanGroupListUrl @"?route=json/tangroup/group_lists"//群列表
#define kgetTanGroupMembersUrl @"?route=json/tangroup/get_group_members"//群成员列表
#define kgetTanOutMemberListUrl @"?route=json/tangroup/out_member_list"//踢人时的坛成员列表
#define kgetTanOutGroupUrl @"?route=json/tangroup/out_group"//踢人
#define kgetTanFriendGetAllUrl @"?route=json/tangroup/friend_get_all"//带有群成员状态的好友列表
#define kgetTanAddGroupUrl @"?route=json/tangroup/invite_group_member"//加人
#define kgetTanChangeGroupNameUrl @"?route=tan/tangroupmanager/change_group_name"//修改群名称（群主);
#define kgetTanDestroyGroupUrl @"?route=json/tangroup/destroy_group"// 解散群
#define kgetTanChangeGroupPrivilegeUrl @"?route=tan/tangroupmanager/change_group_privilege"//权限设置（群主）
#define kgetTanChangeMemberUrl @"?route=tan/tangroupmanagermember/change_group_privilege" //权限设置（群员）
#define kgetTanGroupMemberNickNameUrl @"?route=tan/tangroupmanagermember/change_member_nick_name"//修改群昵称、、
#define kgetTanGroupChangeOwnerUrl @"?route=tan/tangroupmanager/change_owner"//转让群（群主）
#define kgetTanGroupTransferInfoUrl @"?route=tan/tangroupmanagermember/changeOwnerInfo"//群装让详情
#define kgetTanMemberGroupOwnerUrl @"?route=tan/tangroupmanagermember/change_owner"//转让群（群主）
#define kgetTanMessageList @"?route=tan/message/message_lists"//消息列表
#define kgetTanNewMessage @"?route=tan/message/getlastonemessage"//获取最新消息
#define kgetTanMessageCount @"?route=tan/message/message_count"//未读消息数量统计
#define kgetTanDelMessage @"?route=tan/message/del_message"//删除系统消息
#define kgetTanMessageRead @"?route=tan/message/read_message"//未读消息状态修改
#define kgetNewGroupListUrl @"?route=json/tangroup/groupListsNew"//new群列表
#define kgetSearchUrl @"?route=json/tan/tancomplexsearch"//搜索人群聊天记录
#define kgetSetmapUserUrl @"?route=map/user/setmapuser" // 设置个人坐标
#define kgetRadiusbyMemerUrl @"?route=map/user/radiusbymember" //获取附近的人
#define kgetSayGetsUrl @"?route=subject/say/tangets" //获取坛说说列表
#define kgetAltarHSHSUrl @"?route=subject/hshs/tangets" //获取坛绘声绘色
#define kgetAltarZhiBoUrl @"?route=qcloud/live/listLive" //获取直播列表
#define kgetMylistLiveUrl @"?route=qcloud/live/mylistLive" //获取直播列表
#define kgetAltarFormatContact @"?route=json/tan/formatContact" //获取手机及通讯录添加好友
#define kgetAltarSendSmsNew @"?route=json/account/sendSmsNew"//发送内容短信
#define kgetAltarAddComplains @"?route=tan/complaints/comp_add"//添加投诉
#define kgetAltarComplainList @"?route=tan/complaints/comp_lists" // 添加投诉列表
#define kgetAltarComplaintsAppeals @"?route=tan/complaints/appeals_add" //申诉接口
#define kgetAltarQuitGroup @"?route=json/tangroup/quit_group"//退坛
#define kgetAltarGroupAfficheUrl @"?route=tan/announcement/add"//发布公告
#define kgetAltarGroupAfficheListUrl @"?route=tan/announcement/gets"//公告列表
#define kgetAltarGroupAfficheDetailsUrl @"?route=tan/announcement/get"//公告详情
#define kgetAltarGroupAfficheDetailszhidingUrl @"?route=tan/announcement/setOrder"//置顶
#define kgetAltarGroupAfficheDetailsDelUrl @"?route=tan/announcement/del"//删除公告
#define kgetAltarAddYueAltarUrl @"?route=tan/consultation/add"//发起约坛
#define kgetHelpMeUrl @"?route=home/drthelp/helpMe"//帮助
#define kgetInviteUrl @"?route=json/tangroup/changeInvite"//同意群员邀请(申请)
#define kgetShareTanUrl @"?route=shares/data/sendShare"//分享到坛接口
#define kgetSiXinYueTanUrl @"?route=tan/consultation/getsGroupByF"//私信约坛列表接口


//-------- 下面是钱包 --------
#define kWalletMainUrl @"?route=wallet/num/get_num"//钱包主接口
#define kWalletDetailUrl @"?route=wallet/num/get_one_num"//白 绿 红详情接口
#define kWalletConversionUrl @"?route=wallet/num/convert"//兑换接口
#define kWalletbankCardUrl @"?route=wallet/bankcard/bank_message"//银行卡接口
#define kWalletSendSmsUrl @"?route=json/account/sendSms"//发送验证码
#define kWalletCheckCodeUrl @"?route=json/account/checkCodeTrue"//校验验证码
#define kWalletGiveRecordUrl @"?route=wallet/reward/reward_record"//白|红|绿 打赏的记录
#define kWalletReceiveRecordUrl @"?route=wallet/receive/receive_record"//白|红|绿 收赏记录
#define kWalletSetPayPWUrl @"?route=wallet/num/set_pay_password"// 设置支付密码
#define kWalletTransferMoneyUrl @"?route=wallet/num/tum_num"// 转账

#define kWalletCheckPayPWUrl @"?route=wallet/num/pay_password"//校验支付密码
#define kWalletRealNameUrl @"?route=wallet/bankcard/real_ate"//实名认证
#define kWalletTransferRecordUrl @"?route=wallet/jilu/deal_record"//交易记录
#define kWalletBankListUrl @"?route=wallet/bankcard/bankcard_list"//银行列表
#define kWalletDelBankListUrl @"?route=wallet/bankcard/bank_del"//删除银行
#define kWalletBillsListUrl @"?route=wallet/jilu/sel"//账单
#define kWalletWebPayUrl @"?route=wallet/num/pay_red"//web pay
#define kGiveRewardUrl @"?route=wallet/reward/add_reward_record" //打赏
#define kGiveThisHeaderUrl @"?route=wallet/reward/reward_pic" //打赏者头像

//红包
#define kSendRedBaoUrl @"?route=tan/borns/sendBorn" //发送红包
#define kOpenRedBaoUrl @"?route=tan/borns/takeBorn" //拆红包
#define kRodRedBaoUrl @"?route=tan/borns/rushBorn" //抢红包


//店铺发布
#define kSecretFileTypeUrl @"?route=category/category/caseMuteOutLine" //系统密档提纲
#define kGetCustomSecretFileTypeUrl @"?route=category/category/customizeMuteOutLine" //自定义 密档提纲

#define kSecretOrgCategoryUrl @"?route=category/category/getMoreListByPartentid" //组织类别
#define kzhutiguimoCategoryUrl @"?route=category/category/getMoreChildCustomize" //店铺经营主体规模类别
#define kGetListByPartentidUrl @"?route=category/category/getListByPartentid" //所处产业链环节

#define kAddCategoryUrl @"?route=category/category/add" //添加 经营规模类别|密档提纲
#define kPulishShopUrl @"?route=case/case/addCase" //发布店铺

#define kGetShopBaseInfoUrl @"?route=case/case/editCaseInfo" // 获取店铺信息
#define kGetEditShopBaseUrl @"?route=case/case/editCase" // 编辑店铺信息
#define kGetShopSecretListUrl @"?route=subject/hshs/muteOutLine" // 获取店铺 密档列表
#define kEndShopSecretUrl @"?route=subject/hshs/upStatus" // 密档截止


//?route=subject/hshs/muteOutLine
//?route=subject/hshs/upStatus





















