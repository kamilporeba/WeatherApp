//
//  CityWeatherInfoCollectionViewCell.h
//  WeatherApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityWeatherInfoCollectionViewCell : UICollectionViewCell

+(NSString *) getCellIdentifier;

-(void) setCell:(CityWheatherEntity *)city;


@end
