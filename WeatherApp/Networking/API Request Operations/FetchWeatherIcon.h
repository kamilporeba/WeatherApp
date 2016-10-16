//
//  FetchWeatherIcon.h
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "ConcurentOperation.h"

@interface FetchWeatherIcon : ConcurentOperation

typedef void (^IconResponse)(UIImage *weatherIcon, NSError *error);

-(instancetype) init __attribute__((unavailable("init not available")));
-(instancetype) initWithCompletion:(IconResponse _Nonnull) completion andImageName:(NSString * _Nonnull) imageName;
@end
