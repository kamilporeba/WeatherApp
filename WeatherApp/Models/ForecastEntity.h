//
//  ForecastEntity.h
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "MainInfoEntity.h"
#import "WheatherEntity.h"
#import <Foundation/Foundation.h>

@interface ForecastEntity : NSObject

@property (nonatomic) MainInfoEntity * mainInfo;
@property (nonatomic) WheatherEntity * weatherInfo;
@property (nonatomic) long timeStamp;

-(instancetype) initWithDictionary:(NSDictionary *)responseDictionary;

@end
