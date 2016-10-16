//
//  FetchForecastForCitiy.h
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "ConcurentOperation.h"
#import <CoreLocation/CLLocation.h>

@interface FetchForecastForCitiy : ConcurentOperation
typedef void (^ForecastResponse)(NSArray *forecasts, NSError *error);

-(instancetype) init __attribute__((unavailable("init not available")));
- (instancetype)initWithCompletion:(ForecastResponse) completion andLongitude: (double) longitude andLatitude:(double)latitude;
@end
