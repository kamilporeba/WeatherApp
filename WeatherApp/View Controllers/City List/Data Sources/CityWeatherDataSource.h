//
//  CityWeatherDataSource.h
//  WeatherApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CityWeatherDataSource : NSObject <UICollectionViewDataSource>

@property NSArray *citiesWheatherInfo;

@end
