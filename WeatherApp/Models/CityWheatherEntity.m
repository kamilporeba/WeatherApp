//
//  CityWheatherEntity.m
//  WheaterApp
//
//  Created by Kamil Poręba on 11.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "CityWheatherEntity.h"

@implementation CityWheatherEntity

-(instancetype) initWithDictionary:(NSDictionary *)responseDictionary {
    
    self = [super init];
    if (self) {
        self.cityName = [responseDictionary valueForKey:@"name"];
        NSDictionary *mainInfoDictionary = [responseDictionary valueForKey:@"main"];
        self.mainInfo = [[MainInfoEntity alloc]initWithDictionary:mainInfoDictionary];
        NSArray *weatherArray= [responseDictionary valueForKey:@"weather"];
        self.weatherInfo = [[WheatherEntity alloc]initWithDictionary:[weatherArray firstObject]];
        
        NSDictionary * coordinateDictionary =  [responseDictionary valueForKey:@"coord"];
        self.latitude = [[coordinateDictionary valueForKey:@"lat"] doubleValue];
        self.longitude = [[coordinateDictionary valueForKey:@"lon"] doubleValue];
    }
    return self;
}

@end
