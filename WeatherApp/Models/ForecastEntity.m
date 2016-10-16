//
//  ForecastEntity.m
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "ForecastEntity.h"

@implementation ForecastEntity

-(instancetype) initWithDictionary:(NSDictionary *)responseDictionary {
    self = [super init];
    if (self) {
        NSDictionary *mainInfoDictionary = [responseDictionary valueForKey:@"main"];
        self.mainInfo = [[MainInfoEntity alloc]initWithDictionary:mainInfoDictionary];
        NSArray *weatherArray= [responseDictionary valueForKey:@"weather"];
        self.weatherInfo = [[WheatherEntity alloc]initWithDictionary:[weatherArray firstObject]];
        self.timeStamp = [[responseDictionary valueForKey:@"dt"] longValue];
    }
    return self;
}

@end
