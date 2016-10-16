//
//  NSDate+WeatherDate.h
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WeatherDate)

+(NSString *)getDateString:(long)timeStamp;

@end
