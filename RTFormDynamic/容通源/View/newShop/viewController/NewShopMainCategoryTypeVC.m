//
//  NewShopMainCategoryTypeVC.m
//  darongtong
//
//  Created by xie on 17/12/25.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopMainCategoryTypeVC.h"
#import "NewShopMainCategoryTypeCell.h"
#import "CommonServer.h"
#import "NewShopSecretCustomCollectionViewCell.h"
#import "Masonry.h"
#import "FontHander.h"
#import "KNavigation.h"
#import "ShopSecretFileViewController.h"
#import "NewShopSingletonModel.h"

@interface NewShopMainCategoryTypeVC ()<UICollectionViewDelegate,UICollectionViewDataSource,
NewShopMainCategoryTypeCellDelegate>

@property (nonatomic,strong) UICollectionView* tableView;


@property (nonatomic,strong) NewShopSecretCustomCollectionViewCell*  customView;

@property (nonatomic,assign) BOOL isSingleChecked;// 是否 单选

@property (nonatomic,strong)  NewShopMainCategoryTypeCell* currentSelectedModelView;




@end

@implementation NewShopMainCategoryTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!_p_id){//如果p_id
        _isSingleChecked = YES;
    }
    self.title = @"选择店铺经营主体规模类别";
    [self makeUI];
    
}

- (void) makeUI{
    
    __weak typeof(self) weakSelf = self;
    __block  UIScrollView* scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 0, kScreenW, self.view.frame.size.height);
    [self.view addSubview:scrollView];
    [scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(weakSelf.view);
    }];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 0;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.collectionViewLayout = layout;
    _tableView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 0) collectionViewLayout:layout];
    
    UINib* nib = [UINib nibWithNibName:@"NewShopMainCategoryTypeCell" bundle:nil];
    [_tableView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    
    [scrollView addSubview:_tableView];
    
    _customView = (NewShopSecretCustomCollectionViewCell*)[CommonServer getViewByXib:@"NewShopSecretCustomCollectionViewCell"];
    if(_p_id){
        _customView.p_id = _p_id;
    }else{
        _customView.p_id = @"294";
    }
 
    [scrollView addSubview:_customView];
    
    
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(scrollView);
        make.height.equalTo( _dataArray.count*(90+10)+5);
        make.centerX.equalTo(scrollView);
    }];
    
    [_customView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tableView.mas_bottom);
        make.height.equalTo(235);
        make.left.right.equalTo(scrollView);
        make.centerX.equalTo(scrollView);
        make.bottom.equalTo(scrollView);
    }];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //右边加上
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 50, 50);
    [btn addTarget:self action:@selector(clickSave) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"newshop_save2_勾"] forState:UIControlStateNormal];
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //组织结构类别
    if(!_dataArray){
        //创建店铺相关单例
        NewShopSingletonModel* single = [NewShopSingletonModel sharedSingleton];
        single.cate_id_scope_num  = [[NSMutableArray alloc]init];
        single.cate_id_scope = [[NSMutableArray alloc]init];
        single.cate_id_scope_str = [[NSMutableArray alloc]init];
        single.cate_id_scope_num_key = [[NSMutableDictionary alloc]init];
        single.cate_id_scope_num_key_value = [[NSMutableDictionary alloc]init];
        _dataArray = [[NSMutableArray alloc]init];
        _p_id = @"294";
        [self uploadDataWith];
    }else{
        _customView.p_id = _p_id;
        _customView.dataCustom = _dataArray;
    }
    
}


- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(_dataArray.count){
         [_tableView reloadData];
    }
   
}

#pragma mark -- 点击对号保存 --
- (void) clickSave{
    
    if([_p_id isEqualToString:@"294"]){
        //检查所有的
        [self getAllChecked:_dataArray];
        if(_backCallUpdateData){
            _backCallUpdateData();
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
    
    
    // 获取勾选
    
    //只要勾选获取所有子集
    
    //计算子集数量
    
    //在上个界面显示
    
    
}

#pragma mark 获取所有选中的
- (void) getAllChecked:(NSArray*) array{
    
    NewShopSingletonModel* single = [NewShopSingletonModel sharedSingleton] ;

    for(NewShopSecretTiGangModel* model in array){
        
        if(model.allChecked){ //是否选择
            [single.cate_id_scope addObject:model.id];
            [single.cate_id_scope_str addObject:model.name];
        }
        
        if(model._childModel){
            [self  getAllChecked:model._childModel];
        }
        
    }
    
    
}


#pragma mark -- 点击全选或者 反全选 --    //operation  1 全删除  2 全选
- (void) alllSelected:(NewShopMainCategoryTypeCell*) modelView operation:(NSInteger) operation{
    
    if(_isSingleChecked){//单选
        if(operation == 2){//添加所有子集
            //先删除之前的
            if(_currentSelectedModelView){
                //如果有父级则取消 全选
                _currentSelectedModelView.num.text = @"0";
                _currentSelectedModelView.model.allChecked = NO;
                NewShopSingletonModel* singe = [NewShopSingletonModel sharedSingleton] ;
                [singe.cate_id_scope_num_key removeObjectForKey:_currentSelectedModelView.model.id];
                [self delAllChild:_currentSelectedModelView.model];
                _currentSelectedModelView.selecte = NO;
            }
            
            modelView.model.allChecked = YES;
            [self addAllChild:modelView.model backBlock:nil subNum:0 pId:modelView.model.id];
            NewShopSingletonModel* model = [NewShopSingletonModel sharedSingleton] ;
            NSArray* array =  model.cate_id_scope_num_key[modelView.model.id];
            modelView.num.text = [NSString stringWithFormat:@"%ld", array.count];
            modelView.selecte = YES;
            
        }else if(operation == 1){
            
            //如果有父级则取消 全选
            modelView.num.text = @"0";
            modelView.model.allChecked = NO;
            NewShopSingletonModel* singe = [NewShopSingletonModel sharedSingleton] ;
            [singe.cate_id_scope_num_key removeObjectForKey:modelView.model.id];
            [self delAllChild:modelView.model];
            modelView.selecte = NO;
            
        }
        _currentSelectedModelView = modelView;
        
    }else{
        if(operation == 2){//添加所有子集
            modelView.model.allChecked = YES;
            [self addAllChild:modelView.model backBlock:nil subNum:0 pId:modelView.model.id];
            NewShopSingletonModel* model = [NewShopSingletonModel sharedSingleton] ;
            NSArray* array =  model.cate_id_scope_num_key[modelView.model.id];
            modelView.num.text = [NSString stringWithFormat:@"%ld", array.count];
            modelView.selecte = YES;
        }else if(operation == 1){//删除所有子集
            //如果有父级则取消 全选
            modelView.num.text = @"0";
            modelView.model.allChecked = NO;
            NewShopSingletonModel* singe = [NewShopSingletonModel sharedSingleton] ;
            [singe.cate_id_scope_num_key removeObjectForKey:modelView.model.id];
            [self delAllChild:modelView.model];
            modelView.selecte = NO;
        }
    }
    
   
    
    
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
     return  _dataArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
   
    NewShopMainCategoryTypeCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NewShopSecretTiGangModel* model = _dataArray[indexPath.row];
    
    NSMutableString* mutStr = [[NSMutableString alloc]init];
    for(int i = 0;i< model._child.count;i++){
        if(i == model._child.count-1){
            [mutStr appendFormat:@"%@",model._child[i][@"name"]];
        }else{
           [mutStr appendFormat:@"%@%@",model._child[i][@"name"],@"、"];
        }
    }
    
    model.sub_name = mutStr;
    cell.model = model;
    cell.delegate = self;
    if([model.name isEqualToString:@"其他大农业经营主体"]){
      
    }else{
        cell.selecte = model.allChecked;
    }
    
    
    // 部分选
    //根据id 判断是否选择中
//    if(_p_id){
//      NSMutableArray*  selectArray =  [[NewShopSingletonModel sharedSingleton] valueForKey:_p_id];
//        for(){
//            
//        }
//    }
    return  cell;
    
}

//定义每个Section的四边间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
}


- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake( kScreenW, 90);
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NewShopSecretTiGangModel* model = _dataArray[indexPath.row];
    if(model._child.count){//还有继续
        NewShopSecretTiGangModel* lastModel =  model._childModel[0];
        if(lastModel._childModel.count){
            NewShopMainCategoryTypeVC* vc  = [[NewShopMainCategoryTypeVC alloc]init];
            vc.p_id = model.id;
            vc.dataArray = model._childModel;
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            //平台的最好一级
            ShopSecretFileViewController* vc = [[ShopSecretFileViewController alloc]init];
            vc.p_id = model.id;
            vc.type = NewShopsecretTypeManageCategory;
            vc.dataArray =  model._childModel;
            [[KNavigation getNavigation] pushViewController:vc animated:YES];
        }
    }
    
}


#pragma mark----- 加载组织结构类别 -----
- (void) uploadDataWith {
    
    DaRongTongUser* userSingle = [DaRongTongUser sharedSingleton];
    if (userSingle.tokenString == nil || userSingle.tokenString.length < 1) {
        KPostNotification(KLoginOutNotification);
        return ;
    }else{
        __weak  typeof (self) weakSelf = self;
        NSDictionary* dicParam = @{@"token":userSingle.tokenString,
                                   @"customer_id":userSingle.customer_id,
                                   @"p_id":_p_id ? _p_id : @"294"};

        [SVProgressHUD show];
        [[NetworkManager sharedInstance] POST:kzhutiguimoCategoryUrl parameters:dicParam success:^(id responseObject) {
            int code = [responseObject[@"code"] intValue];
            NSDictionary *dict = (NSDictionary *)responseObject;
            [SVProgressHUD dismiss];
            switch (code){
                case 200:
                {
                    NSArray* data = dict[@"data"];
                    for(NSDictionary* dic in data){
                      NewShopSecretTiGangModel* model = [NewShopSecretTiGangModel mj_objectWithKeyValues:dic];
                        [weakSelf eachInitModel:model];
                        [weakSelf.dataArray addObject:model];
                    }
                    //从新计算高度
                    [weakSelf resetViewHeight];
                    [weakSelf.tableView reloadData];
                    
                    //更新自定义
                    weakSelf.customView.dataCustom = weakSelf.dataArray;
                    
                    //NewShopSecretTiGangModel
                    //UIViewController* vc =   [KNavigation getCurrentViewController:weakSelf].navigationController.viewControllers[2];
                    //[[KNavigation getCurrentViewController:weakSelf].navigationController popToViewController:vc animated:YES];
                    
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




- (void) resetViewHeight{
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo( _dataArray.count*(90+10)+5);
    }];
    
}


#pragma mark --    添加所有子集  全选使用 --
- (void ) addAllChild:(NewShopSecretTiGangModel*) model  backBlock: (void (^)()) backBlock subNum:(NSInteger)subNum  pId:(NSString*) pId{
    
    NewShopSingletonModel*  singe = [NewShopSingletonModel sharedSingleton];
    for(NewShopSecretTiGangModel*  subModel in  model._childModel){
        subNum ++;
          subModel.allChecked = YES;
        
        if([singe.cate_id_scope_num_key objectForKey:pId]){
           NSMutableArray* array =  [singe.cate_id_scope_num_key objectForKey:pId];
            [array addObject:subModel.id];
        }else{
            NSMutableArray* array = [[NSMutableArray alloc]init];
            [array addObject:subModel.id];
            [singe.cate_id_scope_num_key setObject:array forKey:pId];
        }
//        [singe.cate_id_scope addObject:dic[@"id"]];//保存所有id
        if(subModel._childModel.count ){//有子集
             [self  addAllChild:subModel backBlock:backBlock subNum:subNum pId:pId];
        }
    }
    
//    return subNum;

    
}



#pragma mark --  删除所有子集 全选使用 --
- (void) delAllChild:(NewShopSecretTiGangModel*) model{
    //不显示数量
    //1 把所有的 子集 设置成 都不选中
    for(NewShopSecretTiGangModel* subModel in  model._childModel){
        subModel.allChecked = NO;
        if(subModel._childModel){
            [self  delAllChild:subModel];
        }
    }
    
    
    
    
}



#pragma mark -- 初始化所有model --
- (void) eachInitModel:(NewShopSecretTiGangModel*) modelPrent{
    
    for(NSDictionary* dic in modelPrent._child){
        NewShopSecretTiGangModel* model = [NewShopSecretTiGangModel mj_objectWithKeyValues:dic];
        if(modelPrent._childModel){
            [modelPrent._childModel addObject:model];
        }else{
            modelPrent._childModel = [[NSMutableArray alloc]init];
            [modelPrent._childModel addObject:model];
        }
        
        if(model._child.count){//有子集
            [self eachInitModel:model];
        }
        
    }
}


#pragma mark -- 计算当前下面所有选中的 --
- (BOOL) counterCurrentNextSelected:(NewShopMainCategoryTypeCell*) modelView{
    
    BOOL  isAllChecked  = YES;
    
    NSInteger num = [self startCounter:modelView.model num:0 isAllChecked:&isAllChecked];
    modelView.num.text = [NSString  stringWithFormat:@"%ld",num];
    
    return isAllChecked;

}

#pragma mark -- 开始计算 --
- (NSInteger)  startCounter:(NewShopSecretTiGangModel*) model  num:(NSInteger) num isAllChecked:(BOOL*) isAllChecked {
    
    for(NewShopSecretTiGangModel*  subModel in  model._childModel){
        if(subModel.allChecked){
            num++;
        }else{//出现平不是全选
            *isAllChecked = NO;
        }
        if(subModel._childModel.count ){//有子集
          num =  [self  startCounter:subModel num:num isAllChecked:isAllChecked];
        }
    }
    
    return num;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
