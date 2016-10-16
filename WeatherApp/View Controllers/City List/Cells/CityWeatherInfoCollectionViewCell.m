//
//  CityWeatherInfoCollectionViewCell.m
//  WeatherApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "CityWeatherInfoCollectionViewCell.h"
#import "ForecastDataSource.h"

@interface CityWeatherInfoCollectionViewCell()

@property (weak , nonatomic) IBOutlet UILabel *cityName;
@property (weak , nonatomic) IBOutlet UILabel *temperature;
@property (weak , nonatomic) IBOutlet UILabel *weatherDescription;
@property (weak , nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak , nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak , nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@property ForecastDataSource * cityForecastDataSource;
@property(nonatomic , retain) CityWheatherEntity* city;

@end

@implementation CityWeatherInfoCollectionViewCell

+(NSString *)getCellIdentifier {
    return @"CityWeatherInfoCell";
}

-(void) setCell:(CityWheatherEntity *)city {
    self.city = city;
    
    [self setLabels:city];
    [self fetchForecastForCurrentCityIfNeed];
    [self setWeatherImage];
}

-(void) setLabels:(CityWheatherEntity *)city  {
    self.cityName.text = city.cityName;
    self.temperature.text = [NSString stringWithFormat:@"%.2f",city.mainInfo.temperature];
    self.weatherDescription.text = city.weatherInfo.wheatherDescription;
}

#pragma mark -Private methods

-(void) fetchForecastForCurrentCityIfNeed {
    if ([self.cityForecastDataSource.forecasts count] == 0) {
        [_loadingIndicator setHidden:NO];
        [self setCollectionViewDataSource];
        [self fetchForecastForCity];
    }
}

-(void) setCollectionViewDataSource {
    self.cityForecastDataSource = [[ForecastDataSource alloc] init];
    self.collectionView.dataSource = self.cityForecastDataSource;
}

-(void) fetchForecastForCity {
    [[APIRequestManager sharedManager] fetchForecastCity:^(NSArray *forecasts, NSError *error) {
        [_loadingIndicator setHidden:YES];
        self.cityForecastDataSource.forecasts = forecasts;
        [self.collectionView reloadData];
    } andCityEntity:self.city];
}

-(void) setWeatherImage {
    NSString *string = self.weatherDescription.text.lowercaseString;
    if ([string containsString:@"rain"]) {
        self.weatherImage.image = [UIImage imageNamed:@"rainy"];
    }else if ([string containsString:@"sun"]) {
        self.weatherImage.image = [UIImage imageNamed:@"sunny"];
    }else if ([string containsString:@"clouds"]) {
        self.weatherImage.image = [UIImage imageNamed:@"cloudy"];
    } else {
        self.weatherImage.image = [UIImage imageNamed:@"city"];
    }
}


@end
