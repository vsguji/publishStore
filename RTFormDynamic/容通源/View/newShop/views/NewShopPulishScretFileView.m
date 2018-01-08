//
//  NewShopPulishScretFileView.m
//  darongtong
//
//  Created by xie on 17/12/20.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopPulishScretFileView.h"
#import "NewShopSecretTiGangModel.h"
#import "CustomEditButton.h"
#import "FontHander.h"
#import "Masonry.h"
#import "CommonServer.h"
#import "NewShopSecretCustomCollectionViewCell.h"

@interface NewShopPulishScretFileView ()<UICollectionViewDelegate,UICollectionViewDataSource,CustomEditButtonDelegate>

@property (strong, nonatomic) IBOutlet UILabel *topTitleLabel;

@property (strong, nonatomic) IBOutlet UITextView *secretStrLabel;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UILabel *contentTitle;


@property (assign, nonatomic) CGFloat collectionViewHeight;//高度
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *collectionViewConstraint;





@end

@implementation NewShopPulishScretFileView


- (void) awakeFromNib{
    [super awakeFromNib];
    _dataArray = [[NSMutableArray alloc]init];
    
    _arrayList = [[NSMutableArray alloc]init];//选择好的

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
    
    //底部增加
    [self  addBottomInputBtn];
    
   
    
}

- (void) setType:(NewShopsecretType)type{
    
    _type = type;
    if(self.type == NewShopsecretTypeManageCategory){//从外面传入
        self.contentTitle.text = @"平台的";
        NSMutableArray* array = [[NSMutableArray alloc]init];
        NewShopSecretTiGangModel* all = [[NewShopSecretTiGangModel alloc]init];
        all.name = @"全部";
        [array addObject:all];
        all._child = _dataArray;
        _dataArray = array;
        [self counterCollectionViewHeight];
        [_collectionView reloadData];
       
    }else{
        _dataArray = [[NSMutableArray alloc]init];
          [self uploadDataWith];
    }
    
    
    
}

#pragma mark -- 增加底部view --
- (void) addBottomInputBtn{
    
    __weak typeof(self) weakSelf = self;
    NewShopSecretCustomCollectionViewCell* bottomView = (NewShopSecretCustomCollectionViewCell* )[CommonServer getViewByXib:@"NewShopSecretCustomCollectionViewCell"];
    [self addSubview:bottomView];
    [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.collectionView.mas_bottom);
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(235);
    }];
    
    if(_p_id){
        bottomView.p_id = _p_id;
    }else{
        bottomView.p_id  = @"3664";
        bottomView.type = _type;
    }
    
    
}

#pragma mark -- 返回头部数量 --
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  _dataArray.count;
}

#pragma mark
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   NewShopSecretTiGangModel* model = _dataArray[section];
    if(model._child.count){
        return model._child.count;
    }
    return 0;
}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NewShopSecretTiGangModel* model = _dataArray[indexPath.section];
    NewShopSecretTiGangModel* subModel = nil;
    if(self.type == NewShopsecretTypeManageCategory){
         subModel =  model._child[indexPath.row];
    }else{
         subModel =  [NewShopSecretTiGangModel mj_objectWithKeyValues:  model._child[indexPath.row]];
    }
  
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //去掉原来的重新添加
    [cell removeAllSubviews];
    CustomEditButton* btn = [CustomEditButton buttonWithType:UIButtonTypeSystem];
    btn.tag = 55;
    btn.model = subModel;
    btn.delegate = self;
    btn.indexPath = indexPath;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [btn setTitle:subModel.name forState:UIControlStateNormal];
    [cell addSubview:btn];
    btn.type = NewShopCustomButtonTypeSecretSubject;
    [btn awakeFromNib];
   
    
    
    return cell;
    
}


- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewShopSecretTiGangModel* model = _dataArray[indexPath.section];
    NewShopSecretTiGangModel* subModel = [NewShopSecretTiGangModel mj_objectWithKeyValues:model._child[indexPath.row]];
    NSString*  str = subModel.name;
    //根据文字自动调整合适大小
    CGSize size =  [FontHander counterText:14 srtText:str];
    // 标题和子集用一个样式 按钮不勾选不做区分
    return CGSizeMake(size.width+30+10+20 , 32);
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(self.collectionView.frame.size.width, 45);
}


// 设置headerView和footerView的
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        [header removeAllSubviews];
        header.backgroundColor = [UIColor clearColor];
        NewShopSecretTiGangModel* model = _dataArray[indexPath.section];
        if(model){
            CustomEditButton* btn = [CustomEditButton buttonWithType:UIButtonTypeSystem];
            btn.tag = indexPath.section;
       
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.backgroundColor = [UIColor clearColor];
            [btn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
            [btn setTitle:model.name forState:UIControlStateNormal];
            [header addSubview:btn];
            btn.type = NewShopCustomButtonTypeSecretTitle;
            [btn awakeFromNib];
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headerViewClick:)];
            [btn addGestureRecognizer:tap];

        }
      
        reusableView = header;
    }
    if (kind == UICollectionElementKindSectionFooter)
    {
//        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
//        footerview.backgroundColor = [UIColor purpleColor];
//        reusableView = footerview;
    }
    return reusableView;
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


#pragma mark -- 点击事件 --
- (void) clickItem:(NSIndexPath*) indexPath btn:(CustomEditButton *)btn{
  
    if(btn.selected){
            [_arrayList addObject:btn.model];
    }else{
        for(NewShopSecretTiGangModel* model in _arrayList){
            if(model.id.integerValue == btn.model.id.integerValue){//
                [_arrayList removeObject:btn.model];
                 break;//立即结束
            }
        }
    }
    
    [self updateSelectedType];
    
    
}


#pragma mark -- 头部点击事件 全选 --
- (void) headerViewClick:(UITapGestureRecognizer*) gesture {
    CustomEditButton* btn =  (CustomEditButton*)gesture.view;//父级操作
    btn.selected = !btn.selected;
    
    NSInteger section =   gesture.view.tag;
    NewShopSecretTiGangModel* model = _dataArray [section];
    NSArray*  arrayTemp = [_arrayList copy];
    if(btn.selected){
        for(int i = 0;i < model._child.count;i++){
            NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:section];
            UICollectionViewCell* cell = [_collectionView cellForItemAtIndexPath:indexPath];
            CustomEditButton* btn =  [cell viewWithTag:55];
            btn.selected = YES;
            for(NewShopSecretTiGangModel* model in arrayTemp){
                if(model.id.integerValue == btn.model.id.integerValue){//
                    [_arrayList removeObject:btn.model];
                }
            }
            if(!_arrayList.count){
                [_arrayList addObject:btn.model];
            }else{
                [_arrayList addObject:btn.model];
            }
        }
    }else{
        for(int i = 0;i < model._child.count;i++){
            NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:section];
            UICollectionViewCell* cell = [_collectionView cellForItemAtIndexPath:indexPath];
            CustomEditButton* btn =  [cell viewWithTag:55];
            btn.selected = NO;
            for(NewShopSecretTiGangModel* model in arrayTemp){
                if(model.id.integerValue == btn.model.id.integerValue){//
                    [_arrayList removeObject:btn.model];
                }
            }
        }
    }
    [self updateSelectedType];

  
}



#pragma mark----- 获取密档类型接口 -----
- (void)uploadDataWith {
    
    DaRongTongUser* userSingle = [DaRongTongUser sharedSingleton];
    if (userSingle.tokenString == nil || userSingle.tokenString.length < 1) {
        KPostNotification(KLoginOutNotification);
        return ;
    }else{
        __weak  typeof (self) weakSelf = self;
        NSDictionary* dicParam = @{ @"token":userSingle.tokenString,
                                    @"customer_id":userSingle.customer_id,
                                    @"type":@"2"};
        [SVProgressHUD show];
        [[NetworkManager sharedInstance] POST:kSecretFileTypeUrl parameters:dicParam success:^(id responseObject) {
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
        
        for(int j = 0;j < model._child.count;j++){
           NewShopSecretTiGangModel* subModel = [NewShopSecretTiGangModel mj_objectWithKeyValues:model._child[j]];
            NSString*  str = subModel.name;
            //根据文字自动调整合适大小
            CGSize size =  [FontHander counterText:14 srtText:str];
            CGFloat itemWidth = size.width+30+10+20;
            width += itemWidth;
            if(width > kScreenW - 45 ){//大于一行宽
                // 加高度
                _collectionViewHeight += 32 + 15;
                width = itemWidth;
            }else{//大于一行宽
               
            }
        }
       
    }
    _collectionViewConstraint.constant = _collectionViewHeight+32 +  _dataArray.count*45 +_dataArray.count*15;
    if(_setContentHeight){
        _setContentHeight(249+ _collectionViewHeight+32 +  _dataArray.count*45 +_dataArray.count*15 + (235+20));
        self.frame = CGRectMake(0, 0,kScreenW, 249+ _collectionViewHeight+32+  _dataArray.count*45 +_dataArray.count*15 + (235+20));

    }
    
}


#pragma mark -- 更新选择的类型  --
- (void) updateSelectedType{
    
    NSMutableString* appendStr = [[NSMutableString alloc]init];
    for(int i = 0;i < _arrayList.count;i++){
        NewShopSecretTiGangModel* model = _arrayList[i];
        [appendStr appendFormat:@"%d%@ ",i+1,model.name];
    }
    _secretStrLabel.text = appendStr;
    _appendStr = appendStr;
    
    
}




@end
