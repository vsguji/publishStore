//  MeiPianListViewController.m
//  darongtong
//  美篇列表 0代表no 1yes
//  Created by luo on 16/5/14.
//  Copyright © 2016年 darongtong. All rights reserved.
//

#import "EditSecretFileLivelyVC.h"
#import "MeipianAddCell.h"
#import "MusicSelectedViewController.h"
#import "TextViewInputController.h"//修改标题
#import "ZYQAssetPickerController.h"
#import "MeipianHeaderView.h"
#import "MeipianTableViewCell.h"
#import "TextViewInputController.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"
#import <OSSService.h>
#import "ChangeBkImageViewController.h" // 更换背景
#import "WZC_LivelySelectTypeView.h"
#import "MainViewController.h"
#import "WZCLively_TextType1VC.h"

#import "WZCLively_CommentThreeStatusVC.h"//测试

#import "TZImagePickerController.h"
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"
#import "TZPhotoPreviewController.h"
#import "TZGifPhotoPreviewController.h"
#import <Photos/Photos.h>
#import "OSSImageUploader.h"
#import "LocationManager.h"
#import "WYVideoCompressTools.h"
#import "MySays_EditSelectPeopleVC.h"
#import "NewShopSecretTiGangModel.h"
#import "MeipainSecretHeaderCell.h"
#import "RTOpenListViewController.h"
#import "RTBaseNavigationController.h"
#import "NewShopSecretFileFlowViewController.h"
#import "KNavigation.h"
#import "NewShopSingletonModel.h"
#import "Masonry.h"
#import "WTTNewShopBaseModel.h"
@interface EditSecretFileLivelyVC ()<UITableViewDataSource,UITableViewDelegate,MeipianHeadClickDelegate,meipianBtnSecondCellDelegate,ZYQAssetPickerControllerDelegate,
UINavigationControllerDelegate,TZImagePickerControllerDelegate>
{
    
    NSString *meipianTitle;//美篇标题
    NSString *meipianContent;//美篇内容
    NSString *bkgroundUrl;//背景图片url
    NSString *bkMusicUrl;//背景音乐url
    NSString *musicNameStr;//音乐名称
    NSMutableArray *_allDataArray;//总数据源数组
    NSMutableArray *_imageArray;//图片数组
    
    NSMutableArray *meipianUploadUrlArray;//上传的url
    DaRongTongUser *userSingle;
    OSSClient * client3;
    id<OSSCredentialProvider> credential2;
    
    NSString *_addressTitleString;
    NSString *openStr;
    UIButton *_cellCurrentBtn;
    UITextView *_cellCurrentView;
    
    BOOL    _isLastInser;//是否最后插入
    BOOL    _isReplaceCurrent;//是否重新选择图片或视频替换当前
    
    
    BOOL    _isHiddenTypeView;//隐藏选择视图
    
    BOOL changbgBool;//修改背景图
    
    
}
@property(nonatomic,strong) UITableView *musicTable;
@property(nonatomic,strong) NSIndexPath *selectedIndexPath;  //当前点击的cell
@property(nonatomic,strong) MeipianHeaderView *headerView;
@property (nonatomic,strong) MBProgressHUD *hud2;
@property (nonatomic,strong) NSDateFormatter *formatter;
@property (nonatomic,strong)WZC_LivelySelectTypeView *typeView;
@property (nonatomic,assign)NSInteger uploadPicVideo;
@property (nonatomic,strong)NSString *hshsId;



@property (nonatomic, strong) NSMutableArray *selectedPhotos;
@property (nonatomic, strong) NSMutableArray *selectedAssets;


@property (nonatomic,copy) NSString *headImageString;//cover_img
//@property (nonatomic,copy) NSString *headImageString;


@end

@implementation EditSecretFileLivelyVC

- (void)dealloc{
    
    
}

-(void) dataConfigure
{
    
    _allDataArray =[NSMutableArray new];
    _imageArray =[NSMutableArray new];
    if(_editModel){
        for(int i = 0; i < _editModel.content.count;i++){
          NSDictionary* dic =  _editModel.content[i];
           WTTNewShopBaseModel* baseModel = [WTTNewShopBaseModel mj_objectWithKeyValues:dic];
            MeipianModel *model =[MeipianModel new];
            model.content = baseModel.intro;
            model.title = baseModel.title;
            model.type = baseModel.type.integerValue;
            model.pic_url = baseModel.pic_url_thumb;
            [_allDataArray addObject:model];
            [_imageArray addObject:model];//第一张是封面图
        }
//        _projectOutline = 
    }else{
        for(int i = 0; i < _screatFiles.count;i++){
            NewShopSecretTiGangModel* item = _screatFiles[i];
            MeipianModel *model =[MeipianModel new];
            model.content = item.name;
            model.title = [NSString stringWithFormat:@"- %d -",i+1];
            model.type = 4;
            [_allDataArray addObject:model];
            [_imageArray addObject:model];//第一张是封面图
        }

    }
    
    _musicTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64) style:UITableViewStylePlain];
    [self.view addSubview:_musicTable];
    _headerView =[[MeipianHeaderView alloc]initWithFrame:CGRectMake(0, 0, 0, 277+160)];
    [self addSecretHeaderFrame];
    [_headerView.bkImg setImage:self.topImgName];//设置背景
    _headerView.clickTitle.text = self.secretTitle;//设置标题
    _headerView.delegate=self;
    _musicTable.tableHeaderView=_headerView;
    _headerView.clickTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    _headerView.clickTitle.numberOfLines = 1;
    _musicTable.separatorStyle= UITableViewCellSeparatorStyleNone;
    [_musicTable registerNib:[UINib nibWithNibName:@"MeipianAddCell" bundle:nil] forCellReuseIdentifier:@"meipianlistcell2"];
    
    [_musicTable registerNib:[UINib nibWithNibName:@"MeipainSecretHeaderCell" bundle:nil] forCellReuseIdentifier:@"MeipainSecretHeaderCell"];

    
    _musicTable.dataSource=self;
    _musicTable.delegate=self;
    _musicTable.showsVerticalScrollIndicator=NO;
    _musicTable.backgroundColor = HexColor(0xd7d7d7);
    
    if(_editModel){
        
        [_headerView.bkImg sd_setImageWithURL:[NSURL URLWithString:_editModel.cover_img_thumb]];//设置背景
       
    }
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"密档";
    changbgBool = NO;
    UIBarButtonItem *finishBtn = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(finishBtnClick:)];
    if(_editModel){//
       finishBtn = [[UIBarButtonItem alloc] initWithTitle:@"更新" style:UIBarButtonItemStylePlain target:self action:@selector(finishBtnClick:)];
    }
    self.navigationItem.rightBarButtonItem=finishBtn;
    self.headerView.bkImg.image = [UIImage imageNamed:@"sp_上传店铺封面头像"];
    [self dataConfigure];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickConfirm:) name:@"RTRecommendGroupNotification" object:nil];
   

}

#pragma makr -- 点击确定 --
- (void) clickConfirm:(NSNotificationCenter*) obj{
    
    
    
    
}

#pragma mark --- 点击发布 ---
-(void) finishBtnClick:(id)sender
{
    if(_editModel){//更新
        [SVProgressHUD showWithStatus:@"更新暂无待实现"];
        [SVProgressHUD dismissWithDelay:0.8];
        
    }else{
        userSingle =[DaRongTongUser sharedSingleton];
        if (meipianTitle.length < 1) {
            
            meipianTitle = @"我是大侠";
            
        }
        
        if ([_headerView.clickTitle.text isEqualToString:@"点击设置标题"]) {
            [Alert showWithTitle:@"请设置标题"];
            return;
        }
        
        if (userSingle.tokenString) {
#pragma mark ----WZ by—liu---
            /*   if (!(meipianTitle.length >0)) {
             [[[MMAlertView alloc] initWithConfirmTitle:@"提示" detail:@"标题不能为空"] showWithBlock:nil];
             return;
             }else{//有图片
             
             self.hud2 = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
             
             [self upLoadImageOrVideoToALiYun];
             
             }*/
            [super showHUD:@"上传中..."];
            [self upLoadImageOrVideoToALiYun];
            
        }else{
            
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
            LoginViewController *login = [story instantiateViewControllerWithIdentifier:@"loginStoryID"];
            login.isPresent=YES;
            BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:login];
            [self.navigationController pushViewController:nav animated:YES];
        }
        

    }
    
    
 
    
}



/**
 1.点击发布上传阿里云到,然后调用服务器接口
 2.遍历数组中的图片或视频,上传至阿里云,返回地址后,请求自己服务器接口;每遍历一次上传成功后,请求下自己服务器接口(当前后台逻辑是这样的,协商之后后台人员还是如此)
 3.(原本可以图片视频全部上传阿里云成功后,请求自己服务器接口一次,把地址传给后台)
 */
- (void)upLoadImageOrVideoToALiYun{
    
    //imageArray 图片上传数组
    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    MeipianModel *model = [[MeipianModel alloc]init];
    model.temImg=self.topImgName; // 缩落图
    model.isBk=YES;
    model.content=@"";
    model.type = 2;
    [imageArray addObject:model];
    
    //videoArray 视频上传数组
    NSMutableArray *videoArray = [[NSMutableArray alloc]init];
    for (NSInteger i=0; i < _allDataArray.count; i++) {
        MeipianModel *model = _allDataArray[i];
        //（1图片2文字3视频100密档标题）
        if (model.type == 2) {
            
            [imageArray addObject:model];
            
        }else if (model.type == 3){
            
            [videoArray addObject:model];
        }
        
    }
    
    //上传图片和视频
    if (videoArray.count > 0) {
        
        dispatch_group_t groupQueue = dispatch_group_create();
        dispatch_group_enter(groupQueue);
        
        [self uploadImageToALiYun:imageArray withGroup:groupQueue];
        
        dispatch_group_enter(groupQueue);
        
        [self uploadImageToALiYun:videoArray withGroup:groupQueue];
        
        
        dispatch_group_enter(groupQueue);
        
        [self uploadVideoToALiYun:videoArray withGroup:groupQueue];
        
        
        dispatch_group_notify(groupQueue, dispatch_get_main_queue(), ^{
            
            [self urlRequestUploadAllContent];
            
        });
        
        //上传图片
    }else if (imageArray.count > 0){
        
        [self uploadImageToALiYun:imageArray withGroup:nil];
        
        //没有图片或视频,直接上传文字(分组,交易标的等)
    }else if (_allDataArray.count > 0){
        
        [self urlRequestUploadAllContent];
        
    }
    
}

#pragma mark ------ 上传图片到阿里云
- (void)uploadImageToALiYun:(NSMutableArray *)imageArray withGroup:(dispatch_group_t)group{
    
    NSMutableArray *uploadArray = [[NSMutableArray alloc]init];
    for (NSInteger i=0; i < imageArray.count; i++) {
        MeipianModel *model = imageArray[i];
        [uploadArray addObject:model.temImg];
    }
    
    [OSSImageUploader asyncUploadImages:uploadArray complete:^(NSArray<NSString *> *names, UploadImageState state) {
        
        if (state == UploadImageSuccess) {
            
            self.headImageString = names[0];
            
            for (NSInteger i=0; i < imageArray.count; i++) {
                MeipianModel *model = imageArray[i];
                
                model.pic_url = names[i];
                
                for (NSInteger i=0; i < _allDataArray.count; i++) {
                    
                    MeipianModel *dataModel = _allDataArray[i];
                    
                    if ([model hash] == [dataModel hash]) {
                        
                        dataModel.pic_url = model.pic_url;
                        
                    }
                }
            }
        }
        
        
        if (group) {
            
            dispatch_group_leave(group);
        }else{
            
            [self urlRequestUploadAllContent];
            
        }
        
    }];
}

#pragma mark 上传视频到阿里云

/**
 上传视频
 
 @param model <#model description#>
 @param urlBlock <#urlBlock description#>
 */
- (void)uploadVideoToALiYun:(NSMutableArray *)videoArray withGroup:(dispatch_group_t)group{
    
    NSMutableArray *uploadArray = [[NSMutableArray alloc]init];
    for (NSInteger i=0; i < videoArray.count; i++) {
        MeipianModel *model = videoArray[i];
        [uploadArray addObject:model.documentVideoString];
    }
    [OSSImageUploader asyncUploadMultiDocumentVideos:uploadArray complete:^(NSArray<NSString *> *names, UploadImageState state) {
        
        for (NSInteger i=0; i < videoArray.count; i++) {
            MeipianModel *model = videoArray[i];
            
            model.video_url = names[i];
            
            for (NSInteger i=0; i < _allDataArray.count; i++) {
                
                MeipianModel *dataModel = _allDataArray[i];
                
                if ([model hash] == [dataModel hash]) {
                    
                    dataModel.video_url = model.video_url;
                }
            }
            
        }
        
        if (group) {
            
            dispatch_group_leave(group);
        }
        
    }];
}


#pragma mark - 网络请求上传选择数据(文字,图片,视频,附件,交易标的...)
- (void)urlRequestUploadAllContent{
    
    NSMutableArray *elementsArray = [NSMutableArray arrayWithCapacity:_allDataArray.count];
    for (NSInteger i=0; i < _allDataArray.count; i++) {
        
        MeipianModel *model = _allDataArray[i];
        
        switch (model.type  ) {
            case 100://标题
            case 1:
            {
                
                NSMutableDictionary *dicParams = [[NSMutableDictionary alloc]init];
                [dicParams setValue:@1 forKey:@"type"];
                
                if (model.content.length >0 && model.content != nil) {
                    
                    [dicParams setValue:model.content forKey:@"intro"];
                    
                }
                if (model.title.length >0 && model.title != nil) {
                    
                    [dicParams setValue:model.title forKey:@"title"];
                }
                
                
                [elementsArray addObject:dicParams];
                
            }
                break;
            case 2:
            {
                NSMutableDictionary *dicParams = [[NSMutableDictionary alloc]init];
                [dicParams setValue:@2 forKey:@"type"];
                
                if (model.title.length >0 && model.title != nil) {
                    
                    [dicParams setValue:model.title forKey:@"title"];
                }
                
                if (model.content.length >0 && model.content != nil) {
                    
                    [dicParams setValue:model.content forKey:@"intro"];
                }
                
                
                if (model.pic_url.length >0 && model.pic_url != nil) {
                    
                    [dicParams setValue:model.pic_url forKey:@"pic_url"];
                }
                
                [elementsArray addObject:dicParams];
                
            }
                break;
            case 3:
            {
                
                NSMutableDictionary *dicParams = [[NSMutableDictionary alloc]init];
                [dicParams setValue:@3 forKey:@"type"];
                
                if (model.title.length >0 && model.title != nil) {
                    
                    [dicParams setValue:model.title forKey:@"title"];
                }
                
                if (model.content.length >0 && model.content != nil) {
                    
                    [dicParams setValue:model.content forKey:@"intro"];
                }
                
                
                if (model.pic_url.length >0 && model.pic_url != nil) {
                    
                    [dicParams setValue:model.pic_url forKey:@"pic_url"];
                }
                
                if (model.video_url.length >0 && model.video_url != nil) {
                    
                    [dicParams setValue:model.video_url forKey:@"video_url"];
                }
                
                [elementsArray addObject:dicParams];
                
            }
                break;
            case 4:
            {
                
                NSMutableDictionary *dicParams = [[NSMutableDictionary alloc]init];
                [dicParams setValue:@4 forKey:@"type"];
                
                if (model.title.length >0 && model.title != nil) {
                    
                    [dicParams setValue:model.title forKey:@"title"];
                }
                
                if (model.content.length >0 && model.content != nil) {
                    
                    [dicParams setValue:model.content forKey:@"intro"];
                }
                
                [elementsArray addObject:dicParams];
                
            }
                break;
                
                
                
            default:
                break;
        }
    }
    
    
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:elementsArray
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    NSString *elements=[[NSString alloc] initWithData:jsonData
                                             encoding:NSUTF8StringEncoding];
    
    NSMutableDictionary *uploadDicParams = [[NSMutableDictionary alloc]init];
    
    [uploadDicParams setValue:self.custom_id forKey:@"customer_id"];
    
    [uploadDicParams setValue:TOKENSTRING forKey:@"token"];
    
    if (_headerView.muiscTitle.text.length >0 && _headerView.muiscTitle.text != nil) {
        
        [uploadDicParams setValue:_headerView.clickTitle.text forKey:@"name"];
    }
    if (bkMusicUrl.length >0 && bkMusicUrl != nil) {
        
        [uploadDicParams setValue:bkMusicUrl forKey:@"music_url"];
    }
    if (musicNameStr.length >0 && musicNameStr != nil) {
        
        [uploadDicParams setValue:musicNameStr forKey:@"music_name"];
    }
    if (self.headImageString.length >0 && self.headImageString != nil) {
        
        [uploadDicParams setValue:self.headImageString forKey:@"cover_img"];
    }
    
    
    NSString* latitude = [LocationManager getValueForLocal:@"latitude" ];
    NSString* longitude = [LocationManager getValueForLocal:@"longitude" ];
    if (longitude == nil || latitude == nil ) {
        longitude =  @"116.435454";
        latitude = @"39.959319";
    }
    [uploadDicParams setObject:longitude forKey:@"lng"];
    [uploadDicParams setObject:latitude forKey:@"lat"];
    if (_addressTitleString.length > 0) {
        [uploadDicParams setObject:_addressTitleString forKey:@"address"];
    }
    if (_headerView.switchB.isOn) {
        [uploadDicParams setObject:@"1" forKey:@"is_show_address"];
    }else{
        [uploadDicParams setObject:@"0" forKey:@"is_show_address"];
        
    }
    
    [uploadDicParams setValue:elements forKey:@"elements"];
    [uploadDicParams setValue:@"15" forKey:@"investment"];
    [uploadDicParams setValue:@"2" forKey:@"have_type"];
    
    __weak typeof(self) weakSelf = self;
    [[NetworkManager sharedInstance] POST:kAddHSHSContentUrl parameters:uploadDicParams success:^(id responseObject) {
        //        NSDictionary *dicT = (NSDictionary *)responseObject;
        int code = [responseObject[@"code"] intValue];
        
        switch (code) {
            case 200:
            {
                if (weakSelf.refreshDataAfterSuccessBlock) {
                    weakSelf.refreshDataAfterSuccessBlock();
                }
                [weakSelf.navigationController popViewControllerAnimated:YES];
                NSDictionary* data = responseObject[@"data"];
                //跳转到审核页面
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    NewShopSecretFileFlowViewController* vc = [[NewShopSecretFileFlowViewController alloc]init];
                    vc.hshs_id = data[@"id"];
                    [[KNavigation getNavigation] pushViewController:vc animated:YES];
                });
                
                NewShopSingletonModel* single = [NewShopSingletonModel sharedSingleton ];
                [single.hshs_ids addObject:data[@"id"]];
            }
                break;
            case 201:
            {
                [Alert showWithTitle:@"登录已过期"];
                KPostNotification(KLoginOutNotification);
            }
                break;
            default:{
                [Alert showWithTitle:[responseObject objectForKey:@"message"]];
            }
                [weakSelf.navigationController popViewControllerAnimated:YES];
                
                break;
        }
        //        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [super hideHUD];
        
    } failure:^(NSError *error) {
        
        NSLog(@"美片 ---- %@",error.localizedFailureReason);
        //        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [super hideHUD];
        
        
    }];
    
}

#pragma mark --- MeipianHeadClickDelegate ---
-(void) tapWhichType:(NSInteger)type{
    
    switch (type) {
        case 201:
        {
            //修改标题
            // TextViewInputController *text=[TextViewInputController settingTextVCWithTitle:nil doneBlock:^(NSString *textViewContent) {
            //                _headerView.clickTitle.text=textViewContent;
            //                meipianTitle = textViewContent;
            //            }];
            //            text.placeholderNumString = @"24";
            //            [self.navigationController pushViewController:text animated:YES];
            
            TextViewInputController *text=[TextViewInputController settingTextVCWithTitle:nil doneBlock:^(NSString *textViewContent) {
                _headerView.clickTitle.text=textViewContent;
            }];
            text.placeholderNumString = @"24";
            text.customer_id = _custom_id;
            text.type = @"2";
            text.keyText = @"content";
            text.show_type = @"2";
            [self.navigationController pushViewController:text animated:YES];
            
        }
            break;
        case 202:
        case 203:
        {
            //        选择音乐
            MusicSelectedViewController * music= [MusicSelectedViewController doneBlock:^(NSString *musicName,NSString *musicUrl) {
                _headerView.muiscTitle.text= musicName;
                bkMusicUrl =musicUrl;
                musicNameStr = musicName;
            }];
            [self.navigationController pushViewController:music animated:YES];
        }
            break;
        case 204://更换背景
        {
            /* ChangeBkImageViewController *changeVc =[ChangeBkImageViewController doneBlock:^(NSMutableArray *array,NSInteger row) {
             MeipianModel *model =array[row];
             [_headerView.bkImg setImage:model.temImg];
             _allDataArray = array;
             }] ;
             changeVc.photosArray=_allDataArray;
             [self.navigationController pushViewController:changeVc animated:YES];*/
            
            [self changeBtnDidClicked];
        }
            break;
        case 205://更换地点
        {
            MainViewController *map = [MainViewController mapPlaceBlock:^(NSString *areaName) {
                
            }];
            map.locationBlock = ^(NSString *placeValue, CLLocationDistance distance, CLLocationCoordinate2D location) {
                _addressTitleString = placeValue;
                [_headerView.addressBtn setTitle:_addressTitleString forState:UIControlStateNormal];
            };
            map.isFullScreen = YES;
            [self.navigationController pushViewController:map animated:YES];
        }
            break;
        case 206://更换给谁看
        {
            
            RTOpenListViewController *caseVC = [[RTOpenListViewController alloc] init];
            caseVC.title = @"公开给谁看";
            
            RTBaseNavigationController *nav = [[RTBaseNavigationController alloc] initWithRootViewController:caseVC];
            
            [self presentViewController:nav
                                   animated:YES
                                 completion:nil];

//            MySays_EditSelectPeopleVC *selectvc= [[MySays_EditSelectPeopleVC alloc] init];
//            selectvc.blockSelectPeople = ^(NSString *str) {
//                
//                openStr = str;
//                [_headerView.openBut setTitle:openStr forState:UIControlStateNormal];
//            };
//            [self.navigationController pushViewController:selectvc animated:YES];
            
        }
        default:
            break;
    }
}
#pragma mark ----修改该背景----

- (void)changeBtnDidClicked {
    changbgBool = YES;
    [self pushImagePickerController:SelectImage];
    
    
    /*   TZImagePickerController *imagePickerVC = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
     
     imagePickerVC.allowPickingImage = YES;
     __weak typeof(self)weakSelf = self;
     [imagePickerVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> * photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
     if (photos.count > 0) {
     weakSelf.topImgName = photos[0];
     weakSelf.headerView.bkImg.image = self.topImgName;
     }
     }];
     [self presentViewController:imagePickerVC animated:YES completion:nil];*/
}

#pragma mark ---- 选择typeView ----

-(WZC_LivelySelectTypeView *)typeView {
    if (_typeView == nil) {
        _typeView = [[WZC_LivelySelectTypeView alloc]init];
        _typeView.type = WTTBoxShowTypeSerctFile;
        _typeView.frame  = CGRectMake(0, kScreenH - 64, kScreenW, kScreenH - 64);
        __weak typeof(self) weaKself = self;
        
        _typeView.dismissSelectViewBlock = ^(){
            
            [weaKself hiddenSelectTypeView];
        };
        
        _typeView.blockSelectType = ^(UIButton *btn) {
            NSInteger index = btn.tag - 100;
            
            [weaKself hiddenSelectTypeView];
            
            switch (index) {
                case 0:
                {
                    //                    weaKself.typeView.hidden = YES;
                    [weaKself pickTextFormTextViewShowAllTextView:YES Title:@"插入普通文字段落" limitTitleText:@"1000" limitContenText:@"20" isInsertCell:YES];
                    
                    [weaKself.musicTable reloadData];
                    //                    [weaKself.musicTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:weaKself.selectedIndexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
                    
                    
                }
                    break;
                case 1:
                {
                    //                    weaKself.typeView.hidden = YES;
                    //                    [weaKself pickImageFromCamera];
                    [weaKself pushImagePickerController:SelectImage];
                    
                    
                    
                    
                    //                    [weaKself.musicTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:weaKself.selectedIndexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
                }
                    break;
                case 2:
                {
                    //                    weaKself.typeView.hidden = YES;
                    [weaKself pickVedioFromSystem];
                    //                    [weaKself pushImagePickerController:SelectVideo];
                    
                    
                    //                    [weaKself.musicTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:weaKself.selectedIndexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
                    
                }
                    break;
                case 3:
                {
                    //                    weaKself.typeView.hidden = YES;
                    
                    //                                        [weaKself pickTextFormTextViewShowAllTextView:NO Title:@"插入普通文字段落" limitTitleText:@"20" limitContenText:@"500" isInsertCell:YES];
                    [weaKself pickTextFormTextViewShowGroupTextView:YES Title:@"本组大标题" limitTitleText:@"30" limitContenText:@"30" secondTitle:@"小题目简短介绍" secondLimitTitleText:@"70" secondLimitContenText:@"70" isInsertCell:YES];
                    [weaKself.musicTable reloadData];
                    //                    [weaKself.musicTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:weaKself.selectedIndexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
                    
                }
                    break;
                case 4:
                {
                    //                    weaKself.typeView.hidden = YES;
                    
                }
                    break;
                case 5:
                {
                    //                    weaKself.typeView.hidden = YES;
                    
                }
                    break;
                case 6:
                {
                    //                    weaKself.typeView.hidden = YES;
                    
                }
                    break;
                    
                default:
                    //                    weaKself.typeView.hidden = YES;
                    
                    
                    break;
            }
        };
        
        
        [self.view addSubview:_typeView];
        
    }
    
    
    return _typeView;
    
    
    
}


/**
 显示选择视图
 */
- (void)showSelectTypeView{
    
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect show_CGRect = self.typeView.frame;
        show_CGRect.origin.y = 0;
        self.typeView.frame = show_CGRect;
        
    } completion:^(BOOL finished) {
        
        _isHiddenTypeView = NO;
    }];
}
/**
 隐藏选择视图
 */

- (void)hiddenSelectTypeView{
    
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect show_CGRect = self.typeView.frame;
        show_CGRect.origin.y = kScreenH - 64;
        self.typeView.frame = show_CGRect;
        
    } completion:^(BOOL finished) {
        
        _isHiddenTypeView = YES;
        
    }];
    
}

//后面的cell
-(void) SecondCellClickBtn:(id)sender btnType:(whichType)type whichCell:(id)cell{
    
    NSIndexPath *indexPath = [_musicTable indexPathForCell:cell];//获得当前cell
    _selectedIndexPath = indexPath;
    
    /*
     topInsert=0,//上面添加按钮,插入文字,图片,视频等
     delBtn,//删除
     imgClick,//图片点击
     wordDesc,//添加文字描述
     topSort,// 排序上按钮
     bottomSort//下按钮
     */
    
    switch (type) {
        case topInsert:
            //top
        {
            [self showSelectTypeView];
        }
            break;
        case delBtn://del 删除条件至少保留2个数组长度
        {
            
            [_allDataArray removeObjectAtIndex:indexPath.row];
            [_musicTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            //暂时注释
            //            if (indexPath.row == _allDataArray.count - 1 &&  _allDataArray.count > 0) {
            //
            //                 NSIndexPath *deleteIndex = [NSIndexPath indexPathWithIndex:_allDataArray.count - 1];
            //
            //                [_musicTable reloadRowsAtIndexPaths:[NSArray arrayWithObject:deleteIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            //            }
            
        }
            break;
        case imgClick://添加cell图片
        {
            _isReplaceCurrent = YES;
            //            [self pickImageFromCamera];
            
            MeipianModel *model = _allDataArray[indexPath.row];
            
            if (model.type == 2) {
                
                [self pushImagePickerController:SelectImage];
                
            }else if (model.type == 3){
                
                [self pushImagePickerController:SelectVideo];
                
            }
        }
            break;
        case wordDesc://添加文字
        {
            UITextView *textView = (UITextView*)[sender view];
            _cellCurrentView = textView;
            NSInteger tagValue =textView.tag;
            MeipianAddCell *tempCell =(MeipianAddCell*)cell;
            MeipianModel *modelObj = (MeipianModel*)_allDataArray[tagValue];
            tempCell.meipianObj = modelObj;
            
            WZCLively_TextType1VC *text=[WZCLively_TextType1VC settingTextVCWithTitle:nil doneBlock:^(NSString *titleText,NSString *textViewContent) {
                //                tempCell.wordDesc.text=textViewContent;
                MeipianModel *modelObj = (MeipianModel*)_allDataArray[tagValue];
                if (textViewContent.length > 0) {
                    modelObj.content = textViewContent;
                    if (modelObj.type == 2 ||modelObj.type == 3) {
                        
                        tempCell.wordDesc.text= [NSString stringWithFormat:@"陈述:%@",textViewContent];
                    }else{
                        
                        tempCell.wordDesc.text= [NSString stringWithFormat:@"%@",textViewContent];
                        
                    }
                    
                    
                }
                if (titleText.length >0) {
                    modelObj.title = titleText;
                    if (modelObj.type == 2 ||modelObj.type == 3) {
                        
                        tempCell.wordDesc.text= [NSString stringWithFormat:@"命名:%@",titleText];
                        
                    }else{
                        
                        
                        tempCell.wordDesc.text= [NSString stringWithFormat:@"%@",titleText];
                    }
                }
                if (titleText.length > 0 && textViewContent.length > 0) {
                    if (modelObj.type == 2 ||modelObj.type == 3) {
                        
                        tempCell.wordDesc.text= [NSString stringWithFormat:@"命名:%@\n陈述:%@",titleText,textViewContent];
                    }else{
                        
                        tempCell.wordDesc.text= [NSString stringWithFormat:@"%@\n%@",titleText,textViewContent];
                    }
                    
                }
                
                [_allDataArray replaceObjectAtIndex:tagValue withObject:modelObj];
            }];
            
            text.isPresent=YES;
            if (modelObj.type == 1) {
                text.isOnlyShowTextView = YES;
            }else{
                text.isOnlyShowTextView = YES;
            }
            if (modelObj.type == 1) {
                text.titlename = @"段落填写";
                text.titleString1 = @"本段标题";
                text.placeholderNumString = @"30";
                
                text.titleString2 = @"插入普通文字段落";
                text.placeholderNumString = @"1000";
            }else if (modelObj.type == 4) {
                text.titlename = @"分组编辑";
                text.titleString1 = @"本组大标题";
                text.titleString2 = @"小题目简短介绍";
                
            }else{
                text.titlename = @"编辑图片";
                text.titleString1 = @"视频/图片命名";
                text.titleString2 = @"对视频/图片所衬托或表述事物陈述";
            }
            
            if (modelObj.type == 4) {
                text.placeholderTitleNumString = @"30";
                text.placeholderNumString = @"70";
                
            }else{
                
                text.placeholderTitleNumString = @"20";
                if (modelObj.type == 1) {
                    text.placeholderNumString = @"1000";
                    
                }else{
                    text.placeholderNumString = @"500";
                }
            }
            
            if (modelObj.title.length > 0) {
                text.titleTextString = modelObj.title;
            }
            if (modelObj.content.length > 0) {
                text.decTextString = modelObj.content;
            }            //            BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:text];
            [self.navigationController pushViewController:text animated:YES];
        }
            break;
            
        case topSort://往上移动
        {
            if (_allDataArray.count < 2) {
                return;
            }
            
            [_allDataArray exchangeObjectAtIndex:indexPath.row withObjectAtIndex:indexPath.row-1];
            NSIndexPath *toIndexPath=[NSIndexPath indexPathForRow:indexPath.row-1 inSection:0];
            [_musicTable moveRowAtIndexPath:indexPath toIndexPath:toIndexPath];
            //            [_musicTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,toIndexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
            [_musicTable reloadData];
            
        }
            break;
        case bottomSort://往下移动
        {
            if (_allDataArray.count < 2) {
                return;
            }
            [_allDataArray exchangeObjectAtIndex:indexPath.row withObjectAtIndex:indexPath.row+1];
            NSIndexPath *toIndexPath=[NSIndexPath indexPathForRow:indexPath.row+1 inSection:0];
            [_musicTable moveRowAtIndexPath:indexPath toIndexPath:toIndexPath];
            //            [_musicTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,toIndexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
            [_musicTable reloadData];
            
        }
            break;
        default:
            
            break;
            
    }
}

#pragma mark ----- 添加三种编辑格式的内容 ------
- (void)pickTextFormTextViewShowAllTextView:(BOOL)show Title:(NSString *)titleName limitTitleText:(NSString *)limitTitleTextString limitContenText:(NSString *)limitContenTextString isInsertCell:(BOOL)isInsertTextCell  {
 
    WZCLively_TextType1VC *text=[WZCLively_TextType1VC settingTextVCWithTitle:nil doneBlock:^(NSString *textTitle, NSString *textViewContent) {
        NSInteger insertIndex = _selectedIndexPath.row;
        
        NSIndexPath *insertPath = [NSIndexPath indexPathWithIndex:insertIndex];
        
        MeipianModel *modelObj =[MeipianModel new];
        modelObj.isBk= NO;
        modelObj.content=textViewContent;
        modelObj.title = textTitle;
        
        modelObj.type = 1;
        //            tempCell.wordDesc.text=modelObj.content;
        
        
        if (_isLastInser) {
            
            [_allDataArray addObject:modelObj];
            _isLastInser = NO;
        }else{
            
            [_allDataArray insertObject:modelObj atIndex:insertIndex];
            
        }
       
        [_musicTable reloadData];
  
        
    }];
    text.isPresent=YES;
    text.isOnlyShowTextView = show;
    text.titleString1 = @"本段标题";
    text.titlename = @"段落填写";
    text.titleString2 = titleName;
    text.placeholderNumString = limitTitleTextString;
    text.placeholderTitleNumString = limitContenTextString;
    [self.navigationController pushViewController:text animated:YES];
}
//插入分组
- (void)pickTextFormTextViewShowGroupTextView:(BOOL)show Title:(NSString *)titleName limitTitleText:(NSString *)limitTitleTextString limitContenText:(NSString *)limitContenTextString  secondTitle:(NSString *)secondTitleName secondLimitTitleText:(NSString *)secondLimitTitleTextString secondLimitContenText:(NSString *)secondLimitContenTextString isInsertCell:(BOOL)isInsertTextCell  {
    
    WZCLively_TextType1VC *text=[WZCLively_TextType1VC settingTextVCWithTitle:@"分组编辑" doneBlock:^(NSString *textTitle, NSString *textViewContent) {
        NSInteger insertIndex = _selectedIndexPath.row;
        MeipianModel *modelObj =[MeipianModel new];
        modelObj.isBk= NO;
        modelObj.title = textTitle;
        modelObj.content = textViewContent;
        modelObj.type = 4;
        if (_isLastInser) {
            [_allDataArray addObject:modelObj];
            _isLastInser = NO;
        }else{
            [_allDataArray insertObject:modelObj atIndex:insertIndex];
        }
        [_musicTable reloadData];
    }];
    
    text.isPresent=YES;
    text.isOnlyShowTextView = show;
    text.titleString2 = secondTitleName;
    text.titleString1 = titleName;
    text.placeholderNumString = secondLimitTitleTextString;
    text.placeholderTitleNumString = limitTitleTextString;
    [self.navigationController pushViewController:text animated:YES];
}
- (void)pickVedioFromSystem
{
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.maximumNumberOfSelection = 1;
    picker.assetsFilter = [ALAssetsFilter allVideos];
    picker.showEmptyGroups=NO;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            
            return duration <= 300;
        } else {
            return YES;
        }
    }];
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)pickImageFromCamera
{
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.maximumNumberOfSelection = 1;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups=NO;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            return duration >= 5;
        } else {
            return YES;
        }
    }];
    
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    
    ALAsset *asset=assets[0];
    
    UIImage *tempImg = [UIImage imageWithCGImage:asset.thumbnail];
    
    // open this code to send video / 打开这段代码发送视频
    [[TZImageManager manager] getVideoOutputPathWithAsset:asset completion:^(NSString *outputPath) {
        NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
        //     Export completed, send video here, send by outputPath or NSData
        //     导出完成，在这里写上传代码，通过路径或者通过NSData上传
        
        //        NSInteger insertIndex = _selectedIndexPath.row == 0 ? 0 : _selectedIndexPath.row - 1;
        WS(weakSelf);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf showHUD:@"视频压缩中..."];
        });
        [WYVideoCompressTools compressVideoWithSourceVideoPathString:outputPath CompressType:AVAssetExportPresetMediumQuality CompressSuccessBlock:^(NSString *compressVideoPathString) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf hideHUD];
                NSInteger insertIndex = _selectedIndexPath.row;
                //                NSIndexPath *insertPath = [NSIndexPath indexPathWithIndex:insertIndex];
                MeipianModel *modelObj =[MeipianModel new];
                modelObj.temImg = tempImg;
                modelObj.isBk= NO;
                modelObj.documentVideoString = compressVideoPathString;
                //        modelObj.content=@"";
                modelObj.type = 3;
                //[_musicTable insertRowsAtIndexPaths:@[insertPath] withRowAnimation:UITableViewRowAnimationRight];
                if (_isReplaceCurrent) {
                    _isReplaceCurrent = NO;
                    [_allDataArray replaceObjectAtIndex:insertIndex withObject:modelObj];
                    
                }else{
                    if (_isLastInser) {
                        [_allDataArray addObject:modelObj];
                        _isLastInser = NO;
                    }else{
                        [_allDataArray insertObject:modelObj atIndex:insertIndex];
                    }
                }
                [_musicTable reloadData];
                
            });
            
        } CompressFailedBlock:^{
            
        } CompressNotSupportBlock:^{
            
        }];
        
        
    }];
    
    
    
}



#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        
        return 1;
    }
    return _allDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1) {
        
        return 25;
    }
    
    return 140;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
       MeipianModel * model = _allDataArray[indexPath.row];
        if(model.type == 4){//增加的标题
            MeipainSecretHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeipainSecretHeaderCell" forIndexPath:indexPath];
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.model = model;
            if(indexPath.row == 0){
                cell.topButton.hidden = YES;
            }
            return cell;

        }else{
            
            MeipianAddCell *cell = [tableView dequeueReusableCellWithIdentifier:@"meipianlistcell2" forIndexPath:indexPath];
            
            cell.delegate = self;
            cell.meipianObj = _allDataArray[indexPath.row];
            cell.wordDesc.tag = indexPath.row;
            cell.cellImg.tag = indexPath.row;
            
            cell.topForkBtn.hidden = YES;
            cell.bottomBtn.hidden = YES;

//            if (indexPath.row == 0) {
//                cell.topForkBtn.hidden = YES;
//                cell.bottomBtn.hidden = NO;
//            }else if (indexPath.row == _allDataArray.count - 1){
//                cell.topForkBtn.hidden = NO;
//                cell.bottomBtn.hidden = YES;
//            }else{
//                cell.topForkBtn.hidden = NO;
//                cell.bottomBtn.hidden = NO;
//            }
            
            return cell;

        }
        
    }else{//大于 1
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"section1_cell"];
        if (!cell) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"section1_cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            //            UIView *view = [[UIView alloc]init];
            //            view.backgroundColor = RGB(241, 241, 241);
            //            view.frame = CGRectMake(0, 0, kScreenW, 25);
            //            [cell.contentView addSubview:view];
            
            cell.contentView.backgroundColor = RGB(241, 241, 241);
            
            UIImageView *addImage = [UIImageView new];
            addImage.image = [UIImage imageNamed:@"hshs_add"];
            addImage.userInteractionEnabled = YES;
            [cell.contentView addSubview:addImage];
            
            addImage.sd_layout
            .centerXEqualToView(cell.contentView)
            .centerYEqualToView(cell.contentView)
            .heightIs(addImage.image.size.height)
            .widthIs(addImage.image.size.width);
            
            __weak typeof(self) weakSelf = self;
            
            [addImage bk_whenTapped:^{
                
                [weakSelf lastCellAdd];
            }];
            
        }
        return cell;
        
    }
    
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
//}


/**
 点击最底部添加按钮
 */
- (void)lastCellAdd{
    _isLastInser = YES;
    
    [self showSelectTypeView];
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}


//-(BOOL)tableView:(UITableView *) tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //打开编辑
//    return YES;
//}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    //允许移动
    return YES;
    //return NO;
}

#pragma mark - TZImagePickerController 照片浏览器

/**
 选择图片或者视频
 */
- (void)pushImagePickerController:(SelectType)type{
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    
    if (type == SelectImage) {
        
        imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
        imagePickerVc.maxImagesCount = 1;
        imagePickerVc.allowPickingVideo = NO;
        imagePickerVc.allowPickingImage = YES;
        imagePickerVc.allowPickingOriginalPhoto = YES;
        
    }else{
        
        imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
        imagePickerVc.maxImagesCount = 1;
        imagePickerVc.allowPickingVideo = YES;
        imagePickerVc.allowPickingImage = NO;
        imagePickerVc.allowPickingOriginalPhoto = NO;
        
    }
    
    imagePickerVc.sortAscendingByModificationDate = YES;
    imagePickerVc.showSelectBtn = NO;
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

#pragma mark - TZImagePickerControllerDelegate 选择图片

/// User click cancel button
/// 用户点击了取消
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    // NSLog(@"cancel");
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    if (changbgBool) {
        self.topImgName = photos[0];
        self.headerView.bkImg.image = self.topImgName;
        changbgBool = NO;
        return;
    }
    
    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    //    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    
    
    //    if (_isFirstInsert) {
    //
    //        _isFirstInsert = NO;
    //
    //        MeipianModel *modelObj =[MeipianModel new];
    //        modelObj.temImg = photos[0];
    //        modelObj.isBk= YES;
    //        //    modelObj.videoData = videoData;
    //        //        modelObj.content=@"";
    //        modelObj.type = @"2";
    //        [meipianArray replaceObjectAtIndex:0 withObject:modelObj];
    //        [_musicTable reloadData];
    //
    //    }else{
    
    //    NSInteger insertIndex = _selectedIndexPath.row == 0 ? 0 : _selectedIndexPath.row - 1;
    
    NSInteger insertIndex = _selectedIndexPath.row;
    
    //    NSIndexPath *insertPath = [NSIndexPath indexPathWithIndex:insertIndex];
    MeipianModel *modelObj =[MeipianModel new];
    modelObj.temImg = photos[0];
    modelObj.isBk= NO;
    modelObj.type = 2;
    
    if (_isReplaceCurrent) {
        
        _isReplaceCurrent = NO;
        [_allDataArray replaceObjectAtIndex:insertIndex withObject:modelObj];
    }else{
        
        if (_isLastInser) {
            
            [_allDataArray addObject:modelObj];
            _isLastInser = NO;
        }else{
            
            [_allDataArray insertObject:modelObj atIndex:insertIndex];
        }
        
    }
    
    
    //    [_musicTable insertRowsAtIndexPaths:@[insertPath] withRowAnimation:UITableViewRowAnimationRight];
    [_musicTable reloadData];
    
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos{
    
}


// 如果用户选择了一个视频，下面的handle会被执行
// 如果系统版本大于iOS8，asset是PHAsset类的对象，否则是ALAsset类的对象
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset {
    
    
    _selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    // open this code to send video / 打开这段代码发送视频
    [[TZImageManager manager] getVideoOutputPathWithAsset:asset completion:^(NSString *outputPath) {
        NSLog(@"视频导出到本地完成,沙盒路径为:%@",outputPath);
        //     Export completed, send video here, send by outputPath or NSData
        //     导出完成，在这里写上传代码，通过路径或者通过NSData上传
        
        //        NSInteger insertIndex = _selectedIndexPath.row == 0 ? 0 : _selectedIndexPath.row - 1;
        NSInteger insertIndex = _selectedIndexPath.row;
        
        NSIndexPath *insertPath = [NSIndexPath indexPathWithIndex:insertIndex];
        
        NSData *videoData = [NSData dataWithContentsOfFile:outputPath];
        
        MeipianModel *modelObj =[MeipianModel new];
        modelObj.temImg = coverImage;
        modelObj.isBk= YES;
        modelObj.videoData = videoData;
        //        modelObj.content=@"";
        modelObj.type = 3;
        //        [_musicTable insertRowsAtIndexPaths:@[insertPath] withRowAnimation:UITableViewRowAnimationRight];
        
        
        if (_isReplaceCurrent) {
            
            _isReplaceCurrent = NO;
            [_allDataArray replaceObjectAtIndex:insertIndex withObject:modelObj];
            
        }else{
            
            if (_isLastInser) {
                
                [_allDataArray addObject:modelObj];
                _isLastInser = NO;
                
            }else{
                
                [_allDataArray insertObject:modelObj atIndex:insertIndex];
            }
            
        }
        [_musicTable reloadData];
        
    }];
}




- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingGifImage:(UIImage *)animatedImage sourceAssets:(id)asset {
    
    if (changbgBool) {
        self.topImgName = animatedImage;
        self.headerView.bkImg.image = self.topImgName;
        changbgBool = NO;
        return;
    }
    
    _selectedPhotos = [NSMutableArray arrayWithArray:@[animatedImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
}

#pragma mark -- 绘声绘色头部固定片段 --
- (void)  addSecretHeaderFrame{

    __block UIView*  secretHeaderView = [[UIView alloc]initWithFrame:CGRectMake(15, 277, kScreenW - 30, 150)];
    [_headerView addSubview:secretHeaderView];
    UILabel* title = [[UILabel alloc]init];
    title.text = [NSString stringWithFormat:@"%@",_projectOutline];
    [secretHeaderView addSubview:title];
    [title mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secretHeaderView).mas_offset(5);
        make.centerX.equalTo(secretHeaderView);
    }];
    
    UILabel* clauseLabel = [[UILabel alloc]init];
    [secretHeaderView addSubview:clauseLabel];
    clauseLabel.text = @"该资本权益若有在知识产权局、工商局、金融管理机构、食药监管理机构...等国家国际上的行政管理注册/被许可特许资质和主权权益，则绘声绘色编辑如下各篇密档文案：";
    clauseLabel.numberOfLines = 3;
    clauseLabel.font = [UIFont systemFontOfSize:14];
    clauseLabel.textColor = [UIColor colorWithHexString:@"999999"];
    clauseLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [clauseLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title.mas_bottom).mas_offset(8);
        make.left.right.equalTo(secretHeaderView).mas_offset(5);
    }];
    
    UILabel*  labelFram = [[UILabel alloc]init];
    labelFram.numberOfLines = 3;
    labelFram.font = [UIFont systemFontOfSize:14];
    labelFram.lineBreakMode = NSLineBreakByTruncatingTail;
    [secretHeaderView addSubview:labelFram];
    NSMutableString* secretAppend = [[NSMutableString alloc]init];
    [secretAppend appendString:@"密档提纲"];
    for(int i = 0; i < _screatFiles.count;i++){
        NewShopSecretTiGangModel* model = _screatFiles[i];
        [secretAppend appendFormat:@"%d.%@;",i+1,model.name];
    }
    if(_editModel){
        for(int i = 0; i < _editModel.content.count;i++){
//            if(){
//                
//            }
            NewShopSecretTiGangModel* model = _screatFiles[i];
            [secretAppend appendFormat:@"%d.%@;",i+1,model.name];
        }
    }
    labelFram.text = secretAppend;
    [labelFram mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(clauseLabel.mas_bottom).mas_offset(8);
        make.left.right.equalTo(secretHeaderView).mas_offset(5);
    }];
    secretHeaderView.backgroundColor = [UIColor whiteColor];
    secretHeaderView.layer.masksToBounds = YES;
    secretHeaderView.layer.cornerRadius = 15;
    secretHeaderView.layer.borderColor = [UIColor colorWithHexString:@"cdcdcd"].CGColor;
    secretHeaderView.layer.borderWidth = 1;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
