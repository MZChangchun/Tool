//
//  NSDate+MZ_Check.h
//  fuyangeducation
//
//  Created by mz on 2018/11/26.
//  Copyright © 2018 慕子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MZ_Check)


/**
 将时间转化成对应格式
 n分钟前
 HH:mm
 昨天/前天 HH:mm
 mm月dd日
 yyyy/mm/dd
 
 @param timeStr 需要转换的时间字符串
 @param dateFormatStr 传入的时间字符串格式
 @return 生成的特定格式化字符串
 */
+ (NSString *)mz_fromat_time:(NSString *)timeStr introDateFormat:(NSString *)dateFormatStr;


/**
 判断是否是今年

 @return 今年返回YES
 */
- (BOOL)isDateYear;


@end

NS_ASSUME_NONNULL_END
