//
//  CityWheatherEntity.h
//  WheaterApp
//
//  Created by Kamil Poręba on 11.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "MainInfoEntity.h"
#import "WheatherEntity.h"
#import <CoreLocation/CLLocation.h>

@interface CityWheatherEntity : NSObject

@property (nonatomic) NSString *cityName;
@property (nonatomic) MainInfoEntity * mainInfo;
@property (nonatomic) WheatherEntity * weatherInfo;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) long timeStamp;

-(instancetype) initWithDictionary:(NSDictionary *)responseDictionary;

@end
