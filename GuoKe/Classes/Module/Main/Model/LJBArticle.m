//
//  LJBArticle.m
//  GuoKe
//
//  Created by 林俊炳 on 16/1/13.
//  Copyright © 2016年 ljunb. All rights reserved.
//

#import "LJBArticle.h"
#import "NSDate+LJBExtension.h"

@implementation LJBArticle

- (NSString *)date_picked {
    
    NSDateFormatter * fmt = [[NSDateFormatter alloc] init];
    
    NSDate * pickedDate = [NSDate dateWithTimeIntervalSince1970:[_date_picked longLongValue]];

    
    if ([pickedDate isThisYear]) {                      // 今年
        
        NSDateComponents * components = [pickedDate compareDateByNow];
        
        if (components.month >= 6) {                    // 超过6个月
            
            return @"半年前";
            
        } else if (components.month >= 1) {             // 半年内
            
            return [NSString stringWithFormat:@"%ld月前", components.month];
            
        } else {                                        // 当月
            
            return [self compareDateByCurrentMonthWithComponents:components];
        }
        
    } else {                                            // 非今年
        
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:pickedDate];
    }
    
    return _date_picked;
}

#pragma mark - 处理当月
- (NSString *)compareDateByCurrentMonthWithComponents:(NSDateComponents *)components {
    
    if (components.weekday >= 1) {      // 超过一周
        
        return [NSString stringWithFormat:@"%ld周前", components.weekday];
        
    } else {
        
        if (components.day >= 1) {      // 当周
            return [NSString stringWithFormat:@"%ld天前", components.day];
            
        } else {                        // 当天
            
            return [self compareDateByCurrentDayWithComponents:components];
            
        }
    }
}

#pragma mark - 处理当天
- (NSString *)compareDateByCurrentDayWithComponents:(NSDateComponents *)components {
    
    if (components.hour >= 12) {        // 超过半天
        
        return @"半天前";
        
    } else if (components.hour >= 1) {  // 半天内
        
        return [NSString stringWithFormat:@"%ld小时前", components.hour];
        
    } else {                            // 1小时内
        
        if (components.minute >= 1) {   // 超过1分钟
            
            return [NSString stringWithFormat:@"%ld分钟前", components.minute];
            
        } else {                        // 1分钟内
            return @"刚刚";
        }
    }
}


@end