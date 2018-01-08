//
//  NewShopOrganizationCategoryView.m
//  darongtong
//
//  Created by xie on 17/12/22.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopOrganizationCategoryView.h"
#import "UIView+dashed.h"

#import "NewShopTypeButtonView.h"
#import "CommonServer.h"
#import "NewShopGroupButtonView.h"
#import "FontHander.h"

#import "NewShopMainCategoryTypeVC.h"
#import "KNavigation.h"
#import "NewShopSingletonModel.h"

@interface NewShopOrganizationCategoryView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;




@property (strong, nonatomic) NSMutableArray*  dataChainCategory;//所处产业链数据源
@property (assign, nonatomic) CGFloat collectionViewHeight;//高度
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *collectionViewConstraint;

@property (strong, nonatomic) IBOutlet UIView *zhutiJingCategoryView;
@property (strong, nonatomic) IBOutlet UIView *chainLinkCategoryView;

@end

@implementation NewShopOrganizationCategoryView


- (void) awakeFromNib{
    [super awakeFromNib];
    [_dashedBtn addDashed];
    
    _dataArray = [[NSMutableArray alloc]init];
    _dataChainCategory = [[NSMutableArray alloc]init];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.collectionViewLayout = layout;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"headerView"];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addEvent:)];
    [self.zhutiJingCategoryView addGestureRecognizer:tap];
    
    UITapGestureRecognizer* tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addEvent:)];
    [self.chainLinkCategoryView addGestureRecognizer:tap2];
    
    [self uploadDataWith];
    [self getSuoChuProductList];
    
}


#pragma mark --  跳转到列表  --
- (void) addEvent:(UITapGestureRecognizer*) geseture{
    UIView*  object = geseture.view;
    if(object.tag == 99){
        if(self.clickChainCategory){
            self.clickChainCategory(_dataChainCategory);
        }
    }else{
        
        __weak typeof(self) weakSelf = self;
        NewShopMainCategoryTypeVC* vc  = [[NewShopMainCategoryTypeVC alloc]init];
        vc.backCallUpdateData = ^(){
            NewShopSingletonModel* model = [NewShopSingletonModel sharedSingleton];
           NSString* title = [model.cate_id_scope_str componentsJoinedByString:@","];
            [weakSelf.shopJinYingZhuTiCategory setTitle:title];
        };
        
        [[KNavigation getNavigation] pushViewController:vc animated:YES];
    }

    
}


#pragma mark -- 选中已经勾选的按钮 --
- (void) selectedGouXuan:(NSString*) idm{
    
    NSArray*  cells =   [_collectionView visibleCells];
    for( UICollectionViewCell*  cell in cells){
        NewShopGroupButtonView* groupView =  [cell  viewWithTag:55];
        if(groupView.model.id.integerValue == idm.integerValue){
            groupView.startusBtn.selected = YES;
        }
    }
    
}

#pragma mark -- 返回头部数量 --
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

#pragma mark
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}

//定义每个Section的四边间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 15, 15, 0);//分别为上、左、下、右
}

#pragma makr -- 行间距 --
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}

#pragma mark -- 列间距 --
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NewShopSecretTiGangModel* model = _dataArray[indexPath.row];
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //去掉原来的重新添加
    [cell removeAllSubviews];
    NewShopGroupButtonView* btn = (NewShopGroupButtonView*) [CommonServer getViewByXib:@"NewShopGroupButtonView"];
    btn.tag = 55;
    if(indexPath.row == 0){//第一个
        btn.arrowsIV.hidden = NO;
    }
    btn.indexPath = indexPath;
    btn.model = model;
    [cell addSubview:btn];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickSelected:)];
    [btn addGestureRecognizer:tap];
    
    
    return cell;
}


- (void) clickSelected:(UITapGestureRecognizer*) tap{
     NewShopGroupButtonView* selView = (  NewShopGroupButtonView* )tap.view;
    NSArray*  cells =   [_collectionView visibleCells];
    for( UICollectionViewCell*  cell in cells){
      NewShopGroupButtonView* groupView =  [cell  viewWithTag:55];
      groupView.startusBtn.selected = NO;
    }
    selView.startusBtn.selected = ! selView.startusBtn.selected;
    if(_clickMoreBlock){
            _clickMoreBlock(selView.model);
    }
    
    [self.dashedBtn setTitle:selView.model.name forState:UIControlStateNormal];
    
}


#pragma mark----- 获取店铺组织结构类别 -----
- (void)uploadDataWith {
    
    DaRongTongUser* userSingle = [DaRongTongUser sharedSingleton];
    if (userSingle.tokenString == nil || userSingle.tokenString.length < 1) {
        KPostNotification(KLoginOutNotification);
        return ;
    }else{
        __weak  typeof (self) weakSelf = self;
        NSDictionary* dicParam = @{ @"token":userSingle.tokenString,
                                    @"customer_id":userSingle.customer_id ,
                                    @"p_id":@"2475" };
        [SVProgressHUD show];
        [[NetworkManager sharedInstance] POST:kSecretOrgCategoryUrl parameters:dicParam success:^(id responseObject) {
            int code = [responseObject[@"code"] intValue];
            NSDictionary *dict = (NSDictionary *)responseObject;
            [SVProgressHUD dismiss];
            switch (code){
                case 200:
                {
                    NSArray* data =  dict[@"data"];
                    for(NSDictionary* dic in data){
                        NewShopSecretTiGangModel* model = [NewShopSecretTiGangModel mj_objectWithKeyValues:dic];
                        [weakSelf.dataArray addObject:model];
                    }
                    [weakSelf counterCollectionViewHeight];
                    [weakSelf.collectionView reloadData];
                    if(weakSelf.requestFinishCall){
                       weakSelf.requestFinishCall();
                    }
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


#pragma mark----- 获取所处产业链类别 -----
- (void) getSuoChuProductList {
    
    DaRongTongUser* userSingle = [DaRongTongUser sharedSingleton];
    if (userSingle.tokenString == nil || userSingle.tokenString.length < 1) {
        KPostNotification(KLoginOutNotification);
        return ;
    }else{
        __weak  typeof (self) weakSelf = self;
        NSDictionary* dicParam = @{ @"token":userSingle.tokenString,
                                    @"customer_id":userSingle.customer_id ,
                                    @"p_id":@"2555" };
        [SVProgressHUD show];
        [[NetworkManager sharedInstance] POST:kGetListByPartentidUrl parameters:dicParam success:^(id responseObject) {
            int code = [responseObject[@"code"] intValue];
            NSDictionary *dict = (NSDictionary *)responseObject;
            [SVProgressHUD dismiss];
            switch (code){
                case 200:
                {
//                    weakSelf.dataChainCategory = dict[@"data"];
//                    dataChainCategory
                    NSArray* data = dict[@"data"];
                    for(NSDictionary* dic in data){
                        NewShopSecretTiGangModel* model = [NewShopSecretTiGangModel mj_objectWithKeyValues:dic];
                        [weakSelf.dataChainCategory addObject:model];
                    }
//                    [weakSelf counterCollectionViewHeight];
//                    [weakSelf.collectionView reloadData];
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


#pragma mark -- 计算collectionView的高度 --
- (void) counterCollectionViewHeight{
    CGFloat width = 0;
    for(int i = 0;i <  _dataArray.count;i++){
        NewShopSecretTiGangModel* model = _dataArray[i];
            NSString*  str = model.name;
            //根据文字自动调整合适大小
            CGSize size =  [FontHander counterText:14 srtText:str];
            CGFloat itemWidth = size.width+115;
            width += itemWidth;
            if(width > kScreenW - 45 ){//大于一行宽
                // 加高度
                _collectionViewHeight += 32 + 15;
                width = itemWidth;
            }else{//大于一行宽
                
            }
    }
    _collectionViewConstraint.constant = _collectionViewHeight+32 + 32;
    if(_setContentHeight){
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,kScreenW,338+  _collectionViewConstraint.constant);
          _setContentHeight(338+  _collectionViewConstraint.constant);
    }
    
}


- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewShopSecretTiGangModel* model = _dataArray[indexPath.section];
    NSString*  str = model.name;
    //根据文字自动调整合适大小
    CGSize size =  [FontHander counterText:14 srtText:str];
    // 标题和子集用一个样式 按钮不勾选不做区分
    return CGSizeMake(size.width+115 , 32);
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
