//
//  NewShopSecretCustomCollectionViewCell.m
//  darongtong
//
//  Created by xie on 17/12/21.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopSecretCustomCollectionViewCell.h"
#import "CustomEditButton.h"
#import "FontHander.h"

@interface NewShopSecretCustomCollectionViewCell()<UITextViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,CustomEditButtonDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) IBOutlet UITextField *textField;


@property (assign, nonatomic) CGFloat collectionViewHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *collectionViewConstraint;



@end

@implementation NewShopSecretCustomCollectionViewCell

- (void) awakeFromNib{
    [super awakeFromNib];
    _arrayList = [[NSMutableArray alloc]init];
    
}

#pragma mark -- 改变布局样式 --
- (void) setType:(NewShopsecretType)type{
    _type = type;
    if(_type == NewShopsecretTypeDefault){//密档
        _dataArray = [[NSMutableArray alloc]init];
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
        [self getSecretTiGang];
        
    }else{//大卡片  从传入的数据获取
        
    }
}


- (void) setModel:(NewShopSecretTiGangModel*) model{
    _model = model;
    
    
}

#pragma mark --  设置数据 --
- (void) setDataCustom:(NSArray*) array{
    _dataCustom = array;
    [_collectionView reloadData];
   
}



#pragma  
- (IBAction)clickConfrom:(id)sender {
    
    if(!_p_id || _p_id.length < 1){
        [SVProgressHUD showErrorWithStatus:@"参数错误，请重新尝试！"];
        [SVProgressHUD dismissWithDelay:0.7];
         return;
    }else if(_textField.text.length == 0 ){
        [SVProgressHUD showErrorWithStatus:@"自定义内容不能为空"];
        [SVProgressHUD dismissWithDelay:0.7];
         return;
    }else if(_textField.text.length > 8){
        [SVProgressHUD showErrorWithStatus:@"自定义内容长度限8位"];
        [SVProgressHUD dismissWithDelay:0.7];
        return;
    }
    
    [self uploadDataWith];
    
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
    return UIEdgeInsetsMake(25, 15, 15, 25);//分别为上、左、下、右
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NewShopSecretTiGangModel* model = _dataArray[indexPath.section];
//    NewShopSecretTiGangModel* subModel = nil;
//    if(self.type == NewShopsecretTypeManageCategory){
//        subModel =  model._child[indexPath.row];
//    }else{
//        subModel =  [NewShopSecretTiGangModel mj_objectWithKeyValues:  model._child[indexPath.row]];
//    }
//    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //去掉原来的重新添加
    [cell removeAllSubviews];
    CustomEditButton* btn = [CustomEditButton buttonWithType:UIButtonTypeSystem];
    btn.tag = 55;
    btn.model = model;
    btn.delegate = self;
    btn.indexPath = indexPath;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [btn setTitle:model.name forState:UIControlStateNormal];
    [cell addSubview:btn];
    btn.type = NewShopCustomButtonTypeSecretSubject;
    [btn awakeFromNib];
    
    return cell;
    
}

//

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewShopSecretTiGangModel* subModel = _dataArray[indexPath.row];
    NSString*  str = subModel.name;
    //根据文字自动调整合适大小
    CGSize size =  [FontHander counterText:14 srtText:str];
    // 标题和子集用一个样式 按钮不勾选不做区分
    return CGSizeMake(size.width+30+10+20 , 32);
    
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
    
    
}



#pragma mark----- 添加自定义 -----
- (void) uploadDataWith {
    
    DaRongTongUser* userSingle = [DaRongTongUser sharedSingleton];
    if (userSingle.tokenString == nil || userSingle.tokenString.length < 1) {
        KPostNotification(KLoginOutNotification);
        return ;
    }else{
        
        __weak  typeof (self) weakSelf = self;
        NSString* url = kAddCategoryUrl;
        NSDictionary* dicParam = @{@"token":userSingle.tokenString,
                                   @"customer_id":userSingle.customer_id,
                                   @"p_id":_p_id,
                                   @"name":_textField.text};
        if(self.type == WTTCustomSecretTypeShopCategory){
            
        }
        
        [SVProgressHUD show];
        [[NetworkManager sharedInstance] POST:kAddCategoryUrl parameters:dicParam success:^(id responseObject) {
            int code = [responseObject[@"code"] intValue];
            NSDictionary *dict = (NSDictionary *)responseObject;
            [SVProgressHUD dismiss];
            switch (code){
                case 200:
                {
                    //添加完成在上面显示
                    
                    
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



#pragma mark----- 获取自定义密档类型接口 -----
- (void)  getSecretTiGang {
    
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
        [[NetworkManager sharedInstance] POST:kGetCustomSecretFileTypeUrl parameters:dicParam success:^(id responseObject) {
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
    
        for(int j = 0;j < _dataArray.count;j++){
            NewShopSecretTiGangModel* subModel = _dataArray[j];
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
        
    _collectionViewConstraint.constant = _collectionViewHeight+32+ 50 +   _dataArray.count*15;
    
    if(_collectionViewConstraint.constant < 128){
        _collectionViewConstraint.constant = 128;
    }
    
    if(_setContentHeight){
        _setContentHeight(249+ _collectionViewHeight+32 +50 +_dataArray.count*15 + (235+20));
        self.frame = CGRectMake(0, 0,kScreenW, 249+ _collectionViewHeight+32+50+_dataArray.count*15 + (235+20));
        
    }
    
}
@end
