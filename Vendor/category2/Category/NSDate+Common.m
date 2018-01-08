//
//  NSDate+Common.m
//  TIMChat
//
//  Created by AlexiChen on 16/3/16.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "NSDate+Common.h"

@implementation NSDate (Common)

#define kMinuteTimeInterval (60)
#define kHourTimeInterval   (60 * kMinuteTimeInterval)
#define kDayTimeInterval    (24 * kHourTimeInterval)
#define kWeekTimeInterval   (7  * kDayTimeInterval)
#define kMonthTimeInterval  (30 * kDayTimeInterval)
#define kYearTimeInterval   (12 * kMonthTimeInterval)

- (BOOL)isToday
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    
    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:self];
    NSDate *otherDate = [cal dateFromComponents:components];
    
    if([today isEqualToDate:otherDate])
    {
        return YES;
    }
    return NO;
}

- (BOOL)isYesterday
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    NSDate *yesterday = [today dateByAddingTimeInterval: -kDayTimeInterval];
    
    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:self];
    NSDate *otherDate = [cal dateFromComponents:components];
    
    if([yesterday isEqualToDate:otherDate])
    {
        return YES;
    }
    return NO;

}

- (NSString *)shortTimeTextOfDate
{
    NSDate *date = self;
    
    NSTimeInterval interval = [date timeIntervalSinceDate:[NSDate date]];
    
    interval = -interval;
    
    if ([date isToday])
    {
        // 今天的消息
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"aHH:mm"];
        [dateFormat setAMSymbol:@"上午"];
        [dateFormat setPMSymbol:@"下午"];
        NSString *dateString = [dateFormat stringFromDate:date];
        return dateString;
    }
    else if ([date isYesterday])
    {
        // 昨天
        return @"昨天";
    }
    else if (interval < kWeekTimeInterval)
    {
        // 最近一周
        // 实例化一个NSDateFormatter对象
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        [dateFormat setDateFormat:@"ccc"];
        NSString *dateString = [dateFormat stringFromDate:date];
        return dateString;
    }
    else
    {
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
        
        NSDateComponents *today = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
        
        if ([components year] == [today year])
        {
            // 今年
            NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
            
            [dateFormat setDateFormat:@"MM-dd"];
            NSString *dateString = [dateFormat stringFromDate:date];
            return dateString;
        }
        else
        {
            // 往年
            NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yy-MM-dd"];
            NSString *dateString = [dateFormat stringFromDate:date];
            return dateString;
            
        }
    }
    return nil;
}

- (NSString *)timeTextOfDate
{
    NSDate *date = self;
    
    NSTimeInterval interval = [date timeIntervalSinceDate:[NSDate date]];
    
    interval = -interval;
    
    // 今天的消息
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"aHH:mm"];
    [dateFormat setAMSymbol:@"上午"];
    [dateFormat setPMSymbol:@"下午"];
    NSString *dateString = [dateFormat stringFromDate:date];
    
    if ([date isToday])
    {
        // 今天的消息
        return dateString;
    }
    else if ([date isYesterday])
    {
        // 昨天
        return [NSString stringWithFormat:@"昨天 %@", dateString];
    }
    else if (interval < kWeekTimeInterval)
    {
        // 最近一周
        // 实例化一个NSDateFormatter对象
        NSDateFormatter* weekFor = [[NSDateFormatter alloc] init];
        weekFor.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        [weekFor setDateFormat:@"ccc"];
        NSString *weekStr = [weekFor stringFromDate:date];
        return [NSString stringWithFormat:@"%@ %@", weekStr, dateString];
    }
    else
    {
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
        
        NSDateComponents *today = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
        
        if ([components year] == [today year])
        {
            // 今年
            NSDateFormatter *mdFor = [[NSDateFormatter alloc] init];
            [mdFor setDateFormat:@"MM-dd"];
            NSString *mdStr = [mdFor stringFromDate:date];
            return [NSString stringWithFormat:@"%@ %@", mdStr, dateString];
        }
        else
        {
            // 往年
            NSDateFormatter *ymdFormat = [[NSDateFormatter alloc] init];
            [ymdFormat setDateFormat:@"yy-MM-dd"];
            NSString *ymdString = [ymdFormat stringFromDate:date];
            return [NSString stringWithFormat:@"%@ %@", ymdString, dateString];;
            
        }
    }
    return nil;
}

//----------------------------------------------

/**
 /////  和当前时间比较
 ////   1）1分钟以内 显示        :    刚刚
 ////   2）1小时以内 显示        :    X分钟前
 ///    3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 ///    4) 今年显示              :   09月12日
 ///    5) 大于本年      显示    :    2013/09/09
 **/

+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate
{
    
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
        if (time<=60) {  //// 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  ////  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24){   //// 在两天内的
            
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //// 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                ////  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
    
}

@end
