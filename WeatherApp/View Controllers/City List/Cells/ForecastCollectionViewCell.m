//
//  ForecastCollectionViewCell.m
//  WeatherApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "ForecastCollectionViewCell.h"
#import "NSDate+WeatherDate.h"
#import "FetchWeatherIcon.h"

@interface ForecastCollectionViewCell()
@property (weak , nonatomic) IBOutlet UILabel *time;
@property (weak , nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak , nonatomic) IBOutlet UILabel *weatherDescription;
@property (weak , nonatomic) IBOutlet UILabel *weatherTemperature;

@property (strong , nonatomic) NSOperationQueue *operationQ;

@end

@implementation ForecastCollectionViewCell

+(NSString *)getCellIdentifier {
    return @"wheatherForecast";
}

-(void) setCell:(ForecastEntity *)forecast {
    
    [self setLabels:forecast];
    [self fetchAndWeatherIcon:forecast];
}

#pragma mark -Private methods

-(void) setLabels:(ForecastEntity *) forecast {
    self.time.text = [NSDate getDateString:forecast.timeStamp];
    self.weatherDescription.text = forecast.weatherInfo.wheatherDescription;
    self.weatherTemperature.text = [NSString stringWithFormat:@"%.2f",forecast.mainInfo.temperature];
}

-(void) fetchAndWeatherIcon: (ForecastEntity *) forecast {
   [[APIRequestManager sharedManager] fetchWeatherIcon:forecast.weatherInfo.icon AndcCompletion:^(UIImage *icon, NSError *error) {
       if (icon) {
          self.weatherIcon.image = icon;
       }
   }];
}
@end
