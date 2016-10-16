//
//  NSDate+WeatherDate.m
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "NSDate+WeatherDate.h"

@implementation NSDate (WeatherDate)

+(NSString *)getDateString:(long)timeStamp {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString* time = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"dd.MM"];
    NSString * dateString  = [dateFormatter stringFromDate:date];
    
    return [dateString stringByAppendingString:[@"\n" stringByAppendingString:time]];

}

@end
