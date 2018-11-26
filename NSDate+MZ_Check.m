//
//  NSDate+MZ_Check.m
//  fuyangeducation
//
//  Created by mz on 2018/11/26.
//  Copyright © 2018 慕子. All rights reserved.
//

#import "NSDate+MZ_Check.h"

@implementation NSDate (MZ_Check)
+ (NSString *)mz_fromat_time:(NSString *)timeStr introDateFormat:(NSString *)dateFormatStr {
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormatStr];
    NSDate * introDate = [formatter dateFromString:timeStr];
    NSDateComponents * introCmps = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:introDate];
    
    //判断是否是今年
    NSDate * currentDate = [NSDate date];
    NSDateComponents * nowCmps = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:currentDate];
    
    if (introCmps.year != nowCmps.year) {
        [formatter setDateFormat:@"yyyy/M/d"];
        return [formatter stringFromDate:introDate];
    }
    if (introCmps.month != nowCmps.month || nowCmps.day > introCmps.day + 2) {
        [formatter setDateFormat:@"M月d日"];
        return [formatter stringFromDate:introDate];
    }
    if (nowCmps.day == introCmps.day + 2) {
        [formatter setDateFormat:@"前天 H:m"];
        return [formatter stringFromDate:introDate];
    }
    if (nowCmps.day == introCmps.day + 1) {
        [formatter setDateFormat:@"昨天 H:m"];
        return [formatter stringFromDate:introDate];
    }
    
    NSDateComponents * deltalCmps = [calendar components:kCFCalendarUnitHour|kCFCalendarUnitMinute|kCFCalendarUnitSecond fromDate:introDate toDate:currentDate options:0];
    if (deltalCmps.hour > 0) {
        [formatter setDateFormat:@"H:m"];
        return [formatter stringFromDate:introDate];
    }
    if (deltalCmps.minute > 0) {
        return [NSString stringWithFormat:@"%ld 分钟前", deltalCmps.minute];
    }
    return @"刚刚";
}


@end
