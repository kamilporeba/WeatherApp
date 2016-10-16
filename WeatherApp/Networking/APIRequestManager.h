//
//  APIRequestManager.h
//  WheaterApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FetchCitiesWithCurrentWheather.h"
#import "FetchForecastForCitiy.h"
#import "CityWheatherEntity.h"

@interface APIRequestManager : NSObject

typedef void (^ImageResponse)(UIImage *icon , NSError *error );

+ (instancetype _Nonnull)sharedManager;

-(void) fetchCityTile:(CitiesResponse _Nonnull) completion;
-(void) fetchForecastCity:(ForecastResponse _Nonnull) completion andCityEntity:(CityWheatherEntity * _Nonnull) city;
-(void) fetchWeatherIcon: (NSString * _Nonnull)iconName AndcCompletion:(ImageResponse _Nullable) completion;

@end
