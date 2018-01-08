//
//  BasicInfoView.m
//  darongtong
//
//  Created by liuxin on 2017/7/1.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "BasicInfoView.h"
#import <CoreText/CoreText.h>
#import "ThreeLevelViewController.h"

@implementation BasicInfoView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(45, 45)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
//    
//        CAGradientLayer *layer = [CAGradientLayer layer];
//        layer.startPoint = CGPointMake(0.5, 0);//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
//        layer.endPoint = CGPointMake(0.5, 1);//（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
//        layer.colors = [NSArray arrayWithObjects:(id)HexColor(0X6767a1).CGColor,(id)HexColor(0Xa09f87).CGColor,(id)HexColor(0X88876e).CGColor, nil];
//        layer.locations = @[@0.0f,@0.5f,@1.0f];//渐变颜色的区间分布，locations的数组长度和color一致，这个值一般不用管它，默认是nil，会平均分布
//        layer.frame = self.layer.bounds;
//        [self.layer insertSublayer:layer atIndex:0];
}

-(id)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if (self)
    {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        [self buildView];
    }
    return self;
}
-(void)buildView
{
    [self addTitleViewWithStrArray:@[@"店铺基本信息",@"创建店铺赶集人变成店铺主"] frame:CGRectMake(0, 0, self.frame.size.width,55)];
    
    _headImgV = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-95, 75, 191, 191)];
    _headImgV.image = [UIImage imageNamed:@"sp_上传店铺封面头像"];
    _headImgV.layer.masksToBounds = YES;
    _headImgV.layer.cornerRadius = _headImgV.frame.size.width*0.5;
    [self addSubview:_headImgV];
    UIButton * imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imgBtn.frame = _headImgV.frame;
    [imgBtn addTarget:self action:@selector(selectPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:imgBtn];
    
    [self addTitleViewWithStrArray:@[@"店铺标题"] frame:CGRectMake(0, _headImgV.frame.size.height+_headImgV.frame.origin.y+21, self.frame.size.width,55)];
    
    [self addCellViewWithFrame:CGRectMake(0, _headImgV.frame.size.height+_headImgV.frame.origin.y+21+55, self.frame.size.width,77) imageName:@"sp_画笔" title:@"商号／商标／简称" promptText:@"201701122830 甜蜜蜜" type:0 viewTag:1];
    
    [self addCellViewWithFrame:CGRectMake(0, _headImgV.frame.size.height+_headImgV.frame.origin.y+21+55+77, self.frame.size.width,77) imageName:@"sp_画笔" title:@"产品／产出质能" promptText:@"甜蜜蜜有机桃汁" type:0 viewTag:2];
    
    [self addCellViewWithFrame:CGRectMake(0, _headImgV.frame.size.height+_headImgV.frame.origin.y+21+55+77*2, self.frame.size.width,77) imageName:@"sp_画笔" title:@"一句话让铺广告词" promptText:@"来密云世外桃源吃住洲乐享田园生活颐养天年" type:0 viewTag:3];
    
    [self addTitleViewWithStrArray:@[@"店铺行业属性"] frame:CGRectMake(0, _headImgV.frame.size.height+_headImgV.frame.origin.y+21+55+77*3+15, self.frame.size.width,55)];
    
    [self addCellViewWithFrame:CGRectMake(0, _headImgV.frame.size.height+_headImgV.frame.origin.y+21+55+77*3+15+55, self.frame.size.width,77) imageName:@"sp_加号－方形" title:@"主属性" promptText:@"仓安大农 > 生态农业 > 土特产" type:1 viewTag:4];
    
    [self addCellViewWithFrame:CGRectMake(0, _headImgV.frame.size.height+_headImgV.frame.origin.y+21+55+77*4+15+55, self.frame.size.width,77) imageName:@"sp_加号－方形" title:@"次属性" promptText:@"艺治科技 > 智能数控 > 智能食品厂" type:1 viewTag:5];
    
    [self addCellViewWithFrame:CGRectMake(0, _headImgV.frame.size.height+_headImgV.frame.origin.y+21+55+77*5+15+55, self.frame.size.width,77) imageName:@"sp_加号－方形" title:@"再次属性" promptText:@"衡治信息 > 教育 > 婴幼儿胎儿身心健康教育" type:1 viewTag:6];
}
-(void)selectPhoto:(UIButton *)sender
{
    UIActionSheet *actionSheet= [[UIActionSheet alloc] initWithTitle:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"拍照", @"从手机相册选择",nil];
    [actionSheet showInView:self];
}
#pragma mark   ----actionSheet
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == actionSheet.cancelButtonIndex)
    {
        return;
    }
    
    switch (buttonIndex)
    {
        case 0:  //打开照相机拍照
            [self takePhoto];
            YYLog(@"打开照相机");
            break;
        case 1:  //打开本地相册
            YYLog(@"打开本地相册");
            [self pickImageFromCamera];
            break;
    }
}
//开始拍照
-(void)takePhoto
{
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [[UIView getControllerWithName:@"StorePublishController" selfView:self] presentViewController:picker animated:YES completion:nil];
    }else{
        [self pickImageFromCamera];
    }
    
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
            return duration >= 1;
        } else {
            return YES;
        }
    }];
    
    [[UIView getControllerWithName:@"StorePublishController" selfView:self] presentViewController:picker animated:YES completion:NULL];
}


#pragma mark - ZYQAssetPickerController Delegate  相册
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    for (int i=0; i<assets.count; i++) {
        ALAsset *asset=(ALAsset *)assets[i];
        UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
        //        NSDictionary *imgDic=@{@"uploadimg":tempImg};
        self.headImgV.image =tempImg;
        //生成url
        //        NSString *destDateString = [self.formatter stringFromDate:[NSDate date]];
        //        uploadImgUrl =[NSString stringWithFormat:@"%@/%@.png",destDateString,[self getUniqueStrByUUID]];
        //        uploadImgUrl =[NSString stringWithFormat:@"%@/%@.png",destDateString,[self getUniqueStrByUUID]];
        //        [uploadImgUrlArray addObject:uploadImgUrl];
    }
}

#pragma mark - UIImagePickerControllerDelegate   拍照
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //    [uploadImgUrlArray removeAllObjects];//
    //    [uploadImgLocalArray removeAllObjects];//
    UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:^() {
        //
        //        NSDictionary *imgDic=@{@"uploadimg":portraitImg};
        self.headImgV.image =portraitImg;
        //        [uploadImgLocalArray addObject:imgDic];
        //      生成url
        //        NSString *destDateString = [_formatter stringFromDate:[NSDate date]];
        //        uploadImgUrl =[NSString stringWithFormat:@"%@%@.png",destDateString,[self getUniqueStrByUUID]];
        //        [uploadImgUrlArray addObject:uploadImgUrl];
    }];
}

#pragma mark   ----initView
//标题行
-(void)addTitleViewWithStrArray:(NSArray *)strArray frame:(CGRect)frame
{
    if (strArray.count>2) {
        return;
    }
    
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    //划线
    UIView * lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 1)];
    lineView1.backgroundColor = HexColor(0Xe1e1e1);
    [backView addSubview:lineView1];
    
    UIView * lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
    lineView2.backgroundColor = HexColor(0Xe1e1e1);
    [backView addSubview:lineView2];
    
    UIView * greenView = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width/2-30, frame.size.height-3, 60, 3)];
    greenView.backgroundColor = HexColor(0Xa2a38a);
    [backView addSubview:greenView];
    //label max=(a>b)?a:b
    NSInteger max_l;
    NSString * str1;
    NSString * str2;
    if (strArray.count ==1) {
        str1 = strArray[0];
        max_l = str1.length*16;
    }else
    {
        str1 = strArray[0];
        str2 = strArray[1];
        max_l = (str1.length >str2.length)?str1.length:str2.length;
        max_l = max_l*12;
    }
    
    UILabel * cLabel = [[UILabel alloc]initWithFrame:CGRectMake((frame.size.width-max_l)/2, 13,max_l, 30)];
    cLabel.textAlignment = NSTextAlignmentCenter;
    cLabel.textColor = HexColor(0Xa2a38a);
    
    [backView addSubview:cLabel];
    
    if (strArray.count ==1) {
        cLabel.font = [UIFont systemFontOfSize:15];
        cLabel.text = str1 = strArray[0];
    }else
    {
        NSString * str =[NSString stringWithFormat:@"%@\n%@",str1,str2];
        cLabel.numberOfLines = 0;
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
        
        NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init];
        paragraph.alignment=NSTextAlignmentCenter;
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, str.length)];
        
        [attributedString addAttribute:NSFontAttributeName
         
                                 value:[UIFont systemFontOfSize:15.0]
         
                                 range:NSMakeRange(0, str1.length)];
        
        [attributedString addAttribute:NSFontAttributeName
         
                                 value:[UIFont systemFontOfSize:11.0]
         
                                 range:NSMakeRange(str1.length+1, str2.length)];
        
        cLabel.attributedText = attributedString;
        [cLabel sizeToFit];
    }
}
//内容行 type:0 textfield 1 button
-(void)addCellViewWithFrame:(CGRect)frame imageName:(NSString *)image title:(NSString *)title promptText:(NSString *)promptText type:(int)type viewTag:(int)tag
{
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 10, frame.size.width-50, 14)];
    titleLabel.textColor = HexColor(0x333333);
    titleLabel.text = title;
    [backView addSubview:titleLabel];
    
    if (type) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = tag;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:HexColor(0xa1a1a1) forState:UIControlStateNormal];
        //        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
        btn.frame =CGRectMake(10, titleLabel.frame.origin.y+titleLabel.frame.size.height+8, frame.size.width-20, 45);
        [btn setBackgroundImage:[UIImage imageNamed:@"sp_输入框"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        btn.imageEdgeInsets = UIEdgeInsetsMake(10,btn.bounds.size.width-35,10,10);
        btn.titleEdgeInsets = UIEdgeInsetsMake(10,0,10,55);
        
        [btn addTarget:self action:@selector(btnSelect:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:btn];
        [btn setTitle:promptText forState:UIControlStateNormal];
        if(tag == 1){
        }else if(tag == 2){
        }else if(tag == 3){
        }else if(tag == 4){
            _firstAttribute = btn;
        }else if(tag == 5){
            _secondAttribute = btn;
        }else if(tag == 6){
            _thirdAttribute = btn;
        }
        
    }else{
        UITextField * textfield = [[UITextField alloc]initWithFrame:CGRectMake(10, titleLabel.frame.origin.y+titleLabel.frame.size.height+8, frame.size.width-20, 45)];
        textfield.tag = tag;
        textfield.font = [UIFont systemFontOfSize:14];
        [textfield setBackground:[UIImage imageNamed:@"sp_输入框"]];
        textfield.placeholder = promptText;
        [textfield setValue:[NSNumber numberWithInt:15] forKey:@"paddingLeft"];
        
        UIImageView *rightView = [[UIImageView alloc]init];
        rightView.image = [UIImage imageNamed:image];
        rightView.size = CGSizeMake(40, 40);
        rightView.contentMode = UIViewContentModeCenter;
        textfield.rightView = rightView;
        textfield.rightViewMode = UITextFieldViewModeAlways;
        
        if(tag == 1){
            _shopName = textfield;
        }else if(tag == 2){
            _product = textfield;
        }else if(tag == 3){
            _AD = textfield;
        }
        [backView addSubview:textfield];
    }
}
#pragma mark ---点击 添加行业属性 ---
-(void)btnSelect:(UIButton *)sender
{
  
    switch (sender.tag) {
        case 4:
        {
            
            if(_showSelectView){
                _showSelectView(4);
            }
            
//           ThreeLevelViewController *model=[ThreeLevelViewController LevelSelectedBlock:^(NSString *selectedName,NSString *nodeId) {
//                [sender setTitle:selectedName forState:UIControlStateNormal];
//                _firstAttribute = selectedName;
//                //                category1_id = [nodeId integerValue];
//                //                NSDictionary * dic1 = @{@"id11":[NSString stringWithFormat:@"%ld",category1_id],@"str11":anyouFu1};
//                //                anyouArray = [[NSMutableArray alloc] init];
//                //                [anyouArray addObject:dic1];
//            }];
//            [[UIView getControllerWithName:@"StorePublishController" selfView:self].navigationController pushViewController:model animated:YES];
            
        }
            break;
            
            
        case 5:
        {
            if(_showSelectView){
                _showSelectView(5);
            }
//            ThreeLevelViewController *model=[ThreeLevelViewController LevelSelectedBlock:^(NSString *selectedName,NSString *nodeId) {
//                [sender setTitle:selectedName forState:UIControlStateNormal];
//                _secondAttribute = selectedName;
//            }];
//            [[UIView getControllerWithName:@"StorePublishController" selfView:self].navigationController pushViewController:model animated:YES];
        }
            break;
            
        case 6:
        {
            
            if(_showSelectView){
                _showSelectView(6);
            }
//            ThreeLevelViewController *model=[ThreeLevelViewController LevelSelectedBlock:^(NSString *selectedName,NSString *nodeId) {
//                [sender setTitle:selectedName forState:UIControlStateNormal];
//                _thirdAttribute = selectedName;
//            }];
//            [[UIView getControllerWithName:@"StorePublishController" selfView:self].navigationController pushViewController:model animated:YES];
        }
            break;
            
        default:
            break;
    }
}
@end
