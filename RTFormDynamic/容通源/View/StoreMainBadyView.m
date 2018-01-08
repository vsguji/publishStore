//
//  StoreMainBadyView.m
//  darongtong
//
//  Created by liuxin on 2017/7/3.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "StoreMainBadyView.h"
#import "UIView+UIViewController.h"

@implementation StoreMainBadyView

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(45, 45)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
-(id)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if (self)
    {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        
        _licenseArray = [NSMutableArray array];
        spModel = [[storePublishModel alloc]init];
        [self buildView];
    }
    return self;
}
-(void)getdateModel:(storePublishModel *)model
{
    NSArray * array =@[@"股份有限公司",@"私营公司",@"上市公司",@"合资公司",@"外商独资"];
    spModel = model;
    SPMenuView * spview = [[SPMenuView alloc]initWithDataArray:array];
    __block SPMenuView * view = spview;
    [spview setBlockSelectType:^(UIButton *btn){
        switch (btn.tag) {
            case 100:
                enterPrise.datailLabel.text = array[0];
                break;
                
            case 101:
                enterPrise.datailLabel.text = array[1];
                break;
                
            case 102:
                enterPrise.datailLabel.text = array[2];
                break;
                
            case 103:
                enterPrise.datailLabel.text = array[3];
                break;
                
            case 104:
                enterPrise.datailLabel.text = array[4];
                break;
                
            case 105:
                
                break;
                
            default:
                break;
        }
        [view hide];
    }];
    [spview show];
}
-(void)buildView
{
    UIView * grayView = [[UIView alloc]init];
    grayView.backgroundColor = RGB(244, 244, 244);
    [self addSubview:grayView];
    
    [self addTitleViewWithString:@"店铺主体" frame:CGRectMake(0, 0, self.width_cust, 47) hiddenLine:YES];
    
    [self addCellViewWithFrame:CGRectMake(0, 47, kScreenW, 85) imageName:@"" title:@"店铺经营主体在工商局...等国家行政管理机关注册的名称" promptText:@"北京股权八坛股份有限公司" type:0 viewTag:1];
//热照部分
    UILabel * licenseTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 147,self.width_cust-20, 13)];
    licenseTitle.textAlignment = NSTextAlignmentLeft;
    licenseTitle.textColor = HexColor(0Xa2a38a);
    licenseTitle.font = [UIFont systemFontOfSize:13];
    licenseTitle.text = @"是否上传该经营主体执照、行政许可证...证照";
    [self addSubview:licenseTitle];
    
    licenseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [licenseBtn setBackgroundImage:[UIImage imageNamed:@"sp_＋营业执照－背景图"] forState:UIControlStateNormal];
    licenseBtn.frame = CGRectMake(10, licenseTitle.bottom_cust+10, 78, 78);
    [licenseBtn addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:licenseBtn];
    
    UILabel * licenseLabel = [[UILabel alloc]initWithFrame:CGRectMake(licenseBtn.right_cust+10, licenseBtn.top_cust, self.width_cust-licenseBtn.right_cust-20, 40)];
    licenseLabel.textColor = HexColor(0xb9b9b9);
    licenseLabel.text = @"1组图文名称:(例如)营业执照\n特殊经营证可证，主体资格政府备案证书...";
    licenseLabel.numberOfLines = 0;
    licenseLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:licenseLabel];
    
    UIButton * permissionsBtn = [UIButton addCustomButtonWithFrame:CGRectMake(licenseBtn.right_cust+10, licenseBtn.bottom_cust-23, 150, 13) title:@"设置权限可以范围" backgroundColor:[UIColor clearColor] titleColor:HexColor(0xb9b9b9) image:@"sp_提示！" font:[UIFont systemFontOfSize:13] type:0 tapAction:^(UIButton *button) {
        numberLab.text = [NSString stringWithFormat:@"共%ld张",_licenseArray.count];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        dateLabel.text = [formatter stringFromDate:[NSDate date]];
    }];
    [self addSubview:permissionsBtn];
    
    numberLab = [[UILabel alloc]initWithFrame:CGRectMake(licenseBtn.left_cust, licenseBtn.bottom_cust+10,licenseBtn.width_cust, 13)];
    numberLab.textAlignment = NSTextAlignmentLeft;
    numberLab.textColor = HexColor(0xb9b9b9);
    numberLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:numberLab];
    
    dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(licenseBtn.left_cust, numberLab.bottom_cust+10,licenseBtn.width_cust*2, 13)];
    dateLabel.textAlignment = NSTextAlignmentLeft;
    dateLabel.textColor = HexColor(0xb9b9b9);
    dateLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:dateLabel];

    UIButton * addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(self.width_cust-70, numberLab.top_cust, 60, 30);
    addBtn.backgroundColor = HexColor(0x54654e);
    addBtn.layer.masksToBounds = YES;
    addBtn.layer.cornerRadius = 15;
    [addBtn setImage:[UIImage imageNamed:@"sp_加号-"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addBtn];
    grayView.frame = CGRectMake(0, 47, self.width_cust, addBtn.bottom_cust+11-47);
//店铺结构类别
    UILabel * typeLabe = [[UILabel alloc]initWithFrame:CGRectMake(10, grayView.bottom_cust +15, self.width_cust-20, 16)];
    typeLabe.text = @"店铺组织结构类别";
    typeLabe.textColor = HexColor(0x333333);
    [self addSubview:typeLabe];
    
    enterPrise = [[buttonView alloc]initWithFrame:CGRectMake(10, typeLabe.bottom_cust+15, self.width_cust-20, 30)];
    enterPrise.delegate = self;
    [enterPrise buildBigViewWithTitle:@"企业" backImg:@"sp_xian" buttonImage:@"sp_企业" labelStr:@"股份有限公司" arrowImg:@"sp_返回箭头xia"];
    [self addSubview:enterPrise];
    
    buttonView * personal = [[buttonView alloc]initWithFrame:CGRectMake(enterPrise.left_cust, enterPrise.bottom_cust+15, (kScreenW-50)/4, 30)];
    [personal buildDefaultViewWithTitle:@"个人" backImg:@"sp_xian" buttonImage:@"sp_个人"];
    [self addSubview:personal];
    
    buttonView * team = [[buttonView alloc]initWithFrame:CGRectMake(personal.right_cust+9, personal.top_cust, personal.width_cust, 30)];
    [team buildDefaultViewWithTitle:@"团体" backImg:@"sp_xian" buttonImage:@"sp_团队"];
    [self addSubview:team];
    
    buttonView * institutions = [[buttonView alloc]initWithFrame:CGRectMake(team.right_cust+9, personal.top_cust,personal.width_cust, 30)];
    [institutions buildDefaultViewWithTitle:@"机构" backImg:@"sp_xian" buttonImage:@"sp_机构"];
    [self addSubview:institutions];
    
    buttonView * association = [[buttonView alloc]initWithFrame:CGRectMake(institutions.right_cust+9, personal.top_cust, personal.width_cust, 30)];
    [association buildDefaultViewWithTitle:@"协会商会" backImg:@"sp_xian" buttonImage:@"sp_商会"];
    [self addSubview:association];
    
//分割线
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(10, association.bottom_cust+16, kScreenW-20,1)];
    lineView.backgroundColor = RGB(242, 242, 242);
    [self addSubview:lineView];
    
    [self addCellViewWithFrame:CGRectMake(0, lineView.bottom_cust+15, kScreenW, 85) imageName:@"sp_返回箭头-right" title:@"店铺经营主体类别" promptText:@"" type:1 viewTag:101];
    
    [self addCellViewWithFrame:CGRectMake(0, lineView.bottom_cust+100, kScreenW, 85) imageName:@"sp_返回箭头xia" title:@"所处产业链环节类别" promptText:@"" type:1 viewTag:102];
//地理位置部分
//    [self addTitleViewWithString:@"店铺经营总部地理位置" frame:CGRectMake(0, lineView.bottom_cust+205, self.width_cust, 47) hiddenLine:NO];
//
//    UILabel * mapLab = [[UILabel alloc]initWithFrame:CGRectMake(0, lineView.bottom_cust+205+47, kScreenW, 200)];
//    mapLab.text = @"地图部分";
//    mapLab.textAlignment = NSTextAlignmentCenter;
//    mapLab.font = [UIFont boldSystemFontOfSize:20];
//    mapLab.backgroundColor = [UIColor grayColor];
//    [self addSubview:mapLab];
//    NSLog(@"地图frame =%f",mapLab.bottom);
}

#pragma mark --view初始化方法
//标题行
-(void)addTitleViewWithString:(NSString *)string frame:(CGRect)frame hiddenLine:(BOOL)hidden
{
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    //划线
    UIView * lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 1)];
    lineView1.backgroundColor = HexColor(0Xe1e1e1);
    [backView addSubview:lineView1];
    
    UIView * lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
    lineView2.backgroundColor = HexColor(0Xe1e1e1);
    [backView addSubview:lineView2];
    
    lineView1.hidden = hidden;
    lineView2.hidden = hidden;
    
    UIView * greenView = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width/2-30, frame.size.height-3, 60, 3)];
    greenView.backgroundColor = HexColor(0Xa2a38a);
    [backView addSubview:greenView];
    
    UILabel * cLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15,frame.size.width, 30)];
    cLabel.textAlignment = NSTextAlignmentCenter;
    cLabel.textColor = HexColor(0Xa2a38a);
    cLabel.font = [UIFont systemFontOfSize:15];
    cLabel.text = string;
    [backView addSubview:cLabel];
}

//内容行 type:0 textfield 1 button
-(void)addCellViewWithFrame:(CGRect)frame imageName:(NSString *)image title:(NSString *)title promptText:(NSString *)promptText type:(int)type viewTag:(int)tag
{
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 17, frame.size.width-20, 13)];
    titleLabel.textColor = HexColor(0x1d1d26);
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:13];
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
        
    }else{
        UITextField * textfield = [[UITextField alloc]initWithFrame:CGRectMake(10, titleLabel.frame.origin.y+titleLabel.frame.size.height+10, frame.size.width-20, 45)];
        textfield.tag = tag;
        textfield.font = [UIFont systemFontOfSize:13];
        [textfield setBackground:[UIImage imageNamed:@"sp_输入框"]];
        textfield.placeholder = promptText;
        [textfield setValue:[NSNumber numberWithInt:15] forKey:@"paddingLeft"];
        
        UIImageView *rightView = [[UIImageView alloc]init];
        rightView.image = [UIImage imageNamed:image];
        rightView.size = CGSizeMake(40, 40);
        rightView.contentMode = UIViewContentModeCenter;
        textfield.rightView = rightView;
        textfield.rightViewMode = UITextFieldViewModeAlways;
        
        [backView addSubview:textfield];
    }
}
#pragma mark --action
-(void)selectImage:(UIButton *)sender
{
    YYLog(@"选中图片");
    
    
    UIActionSheet *actionSheet= [[UIActionSheet alloc] initWithTitle:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"拍照", @"从手机相册选择",nil];
    
    [actionSheet showInView:self];
}
#pragma mark   ----
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
        [self.viewController presentViewController:picker animated:YES completion:nil];
    }else{
        [self pickImageFromCamera];
    }
    
}
- (void)pickImageFromCamera
{
    
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.maximumNumberOfSelection = 9;
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
    
    [self.viewController presentViewController:picker animated:YES completion:NULL];
}
#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    for (int i=0; i<assets.count; i++) {
        ALAsset *asset=(ALAsset *)assets[i];
        UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];

    }
}
-(void) uploadWork
{
}
#pragma mark - UIImagePickerControllerDelegate   拍照
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:^() {
    }];
}

-(void)btnSelect:(UIButton *)sender
{
    if (sender.tag ==102) {
        NSArray * array =@[@"1",@"2",@"3",@"4",@"5"];
        SPMenuView * spview = [[SPMenuView alloc]initWithDataArray:array];
        __block SPMenuView * view = spview;
        [spview setBlockSelectType:^(UIButton *btn){
            switch (btn.tag) {
                case 100:
                    [sender setTitle:array[0] forState:UIControlStateNormal];
                    break;
                    
                case 101:
                    [sender setTitle:array[1] forState:UIControlStateNormal];
                    break;
                    
                case 102:
                    [sender setTitle:array[2] forState:UIControlStateNormal];
                    break;
                    
                case 103:
                    [sender setTitle:array[3] forState:UIControlStateNormal];
                    break;
                    
                case 104:
                    [sender setTitle:array[4] forState:UIControlStateNormal];
                    break;
                    
                case 105:
                    
                    break;
                    
                default:
                    break;
            }
            [view hide];
        }];
        [spview show];

    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n" message:@"请选择时间" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *fixed = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        //更改标题样式
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"这是一个非常美好的内容"];
        [title addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(3, 6)];
        [alert setValue:title forKey:@"attributedTitle"];//attributedMessage改内容样式
        
        //文字颜色
        UIColor *purple = [UIColor purpleColor];
        [cancel setValue:purple forKey:@"titleTextColor"];
        UIColor *green = [UIColor greenColor];
        [fixed setValue:green forKey:@"titleTextColor"];
        
        [alert addAction:fixed];
        [alert addAction:cancel];
        
        UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        [rootViewController presentViewController:alert animated:YES completion:^{
        }];
    }
    
    
}
@end
