//
//  WZCHome_ThridShaiAreaView.m
//  darongtong
//
//  Created by zy on 2017/5/24.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "CommentLocationSelectedView.h"
#import "FontHander.h"
#import "Masonry.h"
#import "MainViewController.h"
#import "UIView+ViewController.h"
#import "AddressDao.h"
//#import "MainViewController.h"
#import "MultiGKHpickerAddressView.h"

@interface CommentLocationSelectedView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) UIView *centerPanel;

@property (nonatomic,strong) UIPickerView* locationView;//地理位置选择

@property (nonatomic,strong) NSMutableArray* allAreas; //所有地理位置区域

@end

@implementation CommentLocationSelectedView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        [self createAddress];
        _allAreas = [[NSMutableArray alloc]init];
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        [self initDataSource];
        _locationView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 300)];
        _locationView.delegate = self;
        _locationView.dataSource = self;
        
    }
    return self;
}

- (void)initView {
    
    UIView* barView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40) ];
    barView.backgroundColor = [UIColor colorWithHexString:@"ebebeb"];
    [self addSubview:barView];
    
    UIButton *changeBtn = [UIButton addButtonWithFrame:APP_CGRectMake(300, 5, 60, 30) backgroundColor:nil Target:self action:@selector(shaiBtnAction)];
    changeBtn.tag = 301 + 900;
    changeBtn.layer.cornerRadius = APP_CONTENT_WIDTH_PRAM(6);
    changeBtn.layer.borderWidth = APP_CONTENT_WIDTH_PRAM(1.5);
    changeBtn.layer.borderColor = HexColor(0x96af89).CGColor;
    [changeBtn setTitle:@"切换区域" forState:UIControlStateNormal];
    changeBtn.titleLabel.font = AdaptFont(14);
    [changeBtn setTitleColor:HexColor(0x96af89) forState:UIControlStateNormal];
    [self addSubview:changeBtn];
    NSArray *titleArray = @[@"全国",@"北京",@"朝阳区",@"朝阳商圈",@"建国们内"];
    UISlider *areaSlider = [[UISlider alloc] initWithFrame:APP_CGRectMake(15, 8, 274, 9)];
    areaSlider.minimumValue = 0;
    areaSlider.maximumValue = 19;
    [areaSlider setMaximumTrackImage:[UIImage imageNamed:@"person_four_new"] forState:UIControlStateNormal];
    [areaSlider setMinimumTrackImage:[UIImage imageNamed:@"person_one_new"] forState:UIControlStateNormal];
    [areaSlider setThumbImage:[UIImage imageNamed:@"Selector"] forState:UIControlStateNormal];
    [areaSlider setThumbImage:[UIImage imageNamed:@"Selector"] forState:UIControlStateHighlighted];
    [areaSlider addTarget:self action:@selector(areaSliderBtn:) forControlEvents:UIControlEventValueChanged];
    [barView addSubview:areaSlider];
    for (NSInteger i=0; i < titleArray.count; i++) {
        
        UILabel *lable = [[UILabel alloc]init];
        lable.tag = i;
        lable.frame = APP_CGRectMake(15+54*i, 17, 54, 17);
        lable.textAlignment = NSTextAlignmentCenter;
        lable.textColor = HexColor(0x999999);
        lable.text = titleArray[i];
        lable.font = AdaptFont(10);
        if (i == 0) {
            _labelString1 = lable;
            lable.textAlignment = NSTextAlignmentLeft;
            
        }else{
            if (i == titleArray.count -1 || i == titleArray.count -2) {
                lable.textAlignment = NSTextAlignmentRight;
            }else{
                lable.textAlignment = NSTextAlignmentCenter;
            }
            if (i == 1) {
                _labelString2 = lable;
            }
            if (i == 2) {
                _labelString3 = lable;
            }
        }
        [barView addSubview:lable];
    }

    
}
- (void)createAddress {
    
    UIView *view = [[UIView alloc] init];
    [self addSubview:view];
    view.frame = APP_CGRectMake(0, 70, 375, LENGTH(180));
    view.backgroundColor = [UIColor whiteColor];
    view.userInteractionEnabled = YES;
    _centerPanel = view;
    UILabel *title2 = [UILabel addLabelWithFrame:APP_CGRectMake(10, 43, 200, 25) title:@"②指定位置" titleColor:HexColor(0x6ebc00) font:FONT_SIZE(16)];
    [self addSubview:title2];
    
    
    //大概位置
    UILabel *addresstitle = [UILabel addLabelWithFrame:APP_CGRectMake(27, 10, 65, LENGTH(138/2)) title:@"" titleColor:HexColor(0x999999) font:FONT_SIZE(9)];
   NSAttributedString*  attrString = [FontHander addColorText:@"所在社区" size:20 srcText:@"(居住/工作/学习)所在社区.街门号" color: [UIColor colorWithHexString:@"999999"]];
    addresstitle.lineBreakMode = NSLineBreakByTruncatingTail;
    addresstitle.numberOfLines = 3;
    addresstitle.attributedText = attrString;
    [view addSubview:addresstitle];

    [addresstitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).mas_offset(15);
        make.left.equalTo(view.mas_left).mas_offset( 15);
        make.width.equalTo(kScreenW - LENGTH(280));
    }];
    
    UITapGestureRecognizer*  tg = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpAddress)];
    UIImageView *textfiled1Bk = [[UIImageView alloc] init];
    textfiled1Bk.userInteractionEnabled =YES;
    [textfiled1Bk addGestureRecognizer:tg];
    textfiled1Bk.userInteractionEnabled = YES;
    textfiled1Bk.clipsToBounds = YES;
    [textfiled1Bk zy_cornerRadiusAdvance:4 rectCornerType:UIRectCornerAllCorners];
    textfiled1Bk.layer.borderWidth = APP_CONTENT_X_PRAM(1.5);
    textfiled1Bk.layer.cornerRadius = APP_CONTENT_X_PRAM(8);
    textfiled1Bk.layer.masksToBounds = YES;
    textfiled1Bk.layer.borderColor = [UIColor grayColor].CGColor;
    textfiled1Bk.frame = APP_CGRectMake(95, 5, 270 - 55, 35);
    [view addSubview:textfiled1Bk];
    [textfiled1Bk mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addresstitle.mas_right).mas_offset(LENGTH(5));
        make.right.equalTo(view.mas_right).mas_offset(-LENGTH(15));
        make.top.equalTo(view).mas_offset(LENGTH(15));
        make.height.equalTo(LENGTH(35*2));
    }];
    textfiled1Bk.backgroundColor = [UIColor whiteColor];
    UIImageView *image1 = [[UIImageView alloc] init];
    image1.frame = APP_CGRectMake(5, 7, 20, 20);
    image1.image = [UIImage imageNamed:@"地图"];
    [textfiled1Bk addSubview:image1];
    
    UITextField *textField1 = [[UITextField alloc] init];
    textField1.frame = APP_CGRectMake(30, 0, 235 - 35, 35);
    textField1.placeholder = @"小区名、大厦名、街道门牌号";
    textField1.userInteractionEnabled = NO;
    [textfiled1Bk addSubview:textField1];
    self.addressTextfield0 = textField1;

    //详细地址
    UILabel *destailAddresstitle = [UILabel addLabelWithFrame:APP_CGRectMake(27, 53+35, 65, 20) title:@"详细地址" titleColor:HexColor(0x999999) font:FONT_SIZE(13)];
    [view addSubview:destailAddresstitle];
    
    [destailAddresstitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textfiled1Bk.mas_bottom).mas_offset(LENGTH(15));
        make.left.equalTo(view.mas_left).mas_offset(15);
        make.width.equalTo(kScreenW - LENGTH(280));
    }];
    
    UIImageView *textfiled1Bk1 = [[UIImageView alloc]  init];
    textfiled1Bk1.userInteractionEnabled = YES;
    textfiled1Bk1.layer.borderWidth = APP_CONTENT_X_PRAM(1.5);
    textfiled1Bk1.layer.cornerRadius = APP_CONTENT_X_PRAM(8);
    textfiled1Bk1.layer.masksToBounds = YES;
    textfiled1Bk1.layer.borderColor = [UIColor grayColor].CGColor;
    [textfiled1Bk1 zy_cornerRadiusAdvance:4 rectCornerType:UIRectCornerAllCorners];
    [view addSubview:textfiled1Bk1];
    textfiled1Bk1.backgroundColor = [UIColor whiteColor];

    [textfiled1Bk1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(destailAddresstitle.mas_right).mas_offset(LENGTH(5));
        make.right.equalTo(view.mas_right).mas_offset(-LENGTH(15));
        make.top.equalTo(textfiled1Bk.mas_bottom).mas_offset(LENGTH( 15));
        make.height.equalTo(LENGTH(35));
    }];
    textfiled1Bk1.frame = APP_CGRectMake(95, 45, 270 - 55, 35);
    
    UIImageView *image2 = [[UIImageView alloc] init];
    image2.frame = APP_CGRectMake(5, 7, 20, 20);
    image2.image = [UIImage imageNamed:@"大厦"];
    [textfiled1Bk1 addSubview:image2];
    
    UITextField *textField11 = [[UITextField alloc] init];
    textField11.frame = APP_CGRectMake(30, 0, 235, 35);
    textField11.placeholder = @"楼层/门牌号";
    [textfiled1Bk1 addSubview:textField11];
    self.addressDetailTextfield1 = textField11;
    
    
  
}

- (void)touchInCirAction {
    if (self.blockThirdGoCirBtn) {
        self.blockThirdGoCirBtn();
    }
}

- (void)sendThreeString:(NSNotification *)noti {
    
}


- (void)areaSliderBtn:(UISlider *)slider {
}


- (void)shaiBtnAction {
    
    __weak typeof(self) weakSelf = self;
  [MultiGKHpickerAddressView shareInstancePickerAddressByctrl:weakSelf.viewController block:^(UIViewController *ctrl, NSString *addressName,NSString *townId) {
            //回调的数据
            NSString *addressNameString = addressName;
            NSArray *arr = [addressNameString componentsSeparatedByString:@","];
            //NSLog(@"数据----%@",arr);
            weakSelf.labelString1.text = arr[0];
            weakSelf.labelString2.text = arr[1];
            weakSelf.labelString3.text = arr[2];
  }];
    

    
    
    
}

#pragma mark -- 初始数据 --
- (void) initDataSource{
       //省  市   区 | 县  镇
       AddressDao *dbObj = [AddressDao new];
       NSMutableDictionary* provinceCityQu =  [dbObj getAllAddressFromDB];
       NSArray* province = [provinceCityQu allKeys];
     //添加所有省
      [_allAreas addObject:province];
    
     //添加所有市 //获取一个
    NSArray* city = [provinceCityQu objectForKey:province[0]];
    NSDictionary* firstCity = city[0]; //市
    
    NSArray*  allCity = [firstCity allKeys];//所有市
    
    //县
    
    
//    NSArray *arr = [addressNameString componentsSeparatedByString:@","];
                //NSLog(@"数据----%@",arr);
//                self.labelString1.text = arr[0];
//                weakSelf.labelString2.text = arr[1];
//                weakSelf.labelString3.text = arr[2];

}


#pragma mark -- 返回某列的数量 --
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    NSInteger  columns = _allAreas.count;
    return columns;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray* data = _allAreas[component];
    return data.count;
    
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
     NSArray* data = _allAreas[component];
     NSString* name =  data[row];
     return name;
    
}


- (void)clickAddressBtn:(UIButton *)btn {
    if (self.changeAddressBlock) {
        self.changeAddressBlock(btn);
    }
}
- (void) searchBtn{
    if (self.searchClick) {
        self.searchClick();
    }

}

#pragma mark -- 跳转到地址列表 --
- (void) jumpAddress{

  
    MainViewController* map =  [[MainViewController alloc]init];
    __weak typeof (self) weakSelf = self;
    map.locationBlock2 = ^(AMapPOI * poi) {
         weakSelf.addressTextfield0.text = poi.address;
    };
    map.isFullScreen = YES;
    map.isShowMapTableViewHostoryList = YES;
   
    [self.viewController.navigationController pushViewController:map animated:YES];

}

@end
