//
//  RTModelTools.m
//  darongtong
//
//  Created by zy on 2017/10/27.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTModelTools.h"

//#import "WZCLivelyListModel.h"
//#import "WZCLivelyListModel+Recommend.h"

@implementation RTModelTools

#pragma mark - private 加载本地模拟数据

+ (NSDictionary *)jsonLocalDic:(NSString *)file{
    NSString *full = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:full];
    __weak NSError *error;
    NSDictionary *localDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:error.description userInfo:nil];
    }
    return localDic;
}


+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate {
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

+ (NSString *)timeIntervalToString:(NSTimeInterval)time {
    NSString *str_day = [NSString stringWithFormat:@"%02ld",(NSInteger)(time/(3600 * 24))];//天
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",(NSInteger)(time/3600)];//时
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(NSInteger)(((NSInteger)time%3600)/60)];//分
    NSString *str_second = [NSString stringWithFormat:@"%02ld",(NSInteger)((NSInteger)time%60)];//秒
    NSString *format_time = [NSString stringWithFormat:@"%@天%@小时%@分%@秒",str_day,str_hour,str_minute,str_second];
    return format_time;
}

- (void)getNumBtnAction{
    
    __block NSInteger second = 60;
    //全局队列    默认优先级
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时器模式  事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    //NSEC_PER_SEC是秒，＊1是每秒
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        //回调主线程，在主线程中操作UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second >= 0) {
                second--;
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timer);
            }
        });
    });
    //启动源
    dispatch_resume(timer);
}

// Array 转 json 
+ (NSString*)jsonStringWithPrettyPrint:(NSArray *) array {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"[]";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

+ (NSString *)jsonStringWithDicPrint:(NSDictionary *) dic {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"[]";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}


+ (NSDictionary *)dicWithJsonString:(NSString *)json {
    NSError *parseError = nil;
    NSDictionary *parseDic = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&parseError];
    if (parseError != nil) {
        NSLog(@"解析失败 :%@",[parseError description]);
        return @{};
    }
    return parseDic;
}

+ (NSArray *)arrayWithJsonString:(NSString *)json {
    NSError *parseError = nil;
    NSArray *parseArray = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&parseError];
    if (parseError != nil) {
        NSLog(@"解析失败 :%@",[parseError description]);
        return @[];
    }
    return parseArray;
}

#pragma mark - 通讯录分区整理联系人

- (NSMutableArray *)addressBookArrayTmp:(NSArray *)backToControllerData {
    
    NSMutableArray *contactsPeople = [NSMutableArray arrayWithCapacity:10];
    
//    UILocalizedIndexedCollation *indexedCollation=[UILocalizedIndexedCollation currentCollation];
//    for (WZCLivelyListModel *theAdressBookModel in backToControllerData) {
//        NSInteger section = [indexedCollation sectionForObject:theAdressBookModel collationStringSelector:@selector(nick_name)];
//        theAdressBookModel.section=section;
//    }
//    NSInteger sectionCount=[[indexedCollation sectionTitles] count];
//    NSMutableArray *sectionsArray=[NSMutableArray arrayWithCapacity:sectionCount];
//    for (int i=0; i<=sectionCount; ++i) {
//        NSMutableArray *singleSectionArray=[NSMutableArray arrayWithCapacity:1];
//        [sectionsArray addObject:singleSectionArray];
//    }
//    //将对象放到正确的区段当中
//    for(WZCLivelyListModel *theAdressBookModel in backToControllerData){
//        [(NSMutableArray *) [sectionsArray objectAtIndex:theAdressBookModel.section] addObject:theAdressBookModel];
//    }
//    //排序子数组中的数据
//    for (NSMutableArray *singleSectionArray in sectionsArray){
//        NSArray *sortedSection=[indexedCollation sortedArrayFromArray:singleSectionArray collationStringSelector:@selector(nick_name)];
//        if (sortedSection.count != 0) {
//            [contactsPeople addObject:sortedSection];
//        }
//    }
    return contactsPeople;
}

#pragma mark - 字符串 && 汉字 首字符
+ (NSString *)firstCharactorWithString:(NSString *)string
{
    NSMutableString *str = [NSMutableString stringWithString:string];
    CFStringTransform((CFMutableStringRef) str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pinYin = [str capitalizedString];
    return [pinYin substringToIndex:1];
}

@end
