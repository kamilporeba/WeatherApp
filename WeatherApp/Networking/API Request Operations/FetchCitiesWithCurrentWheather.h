//
//  FetchCitiesWithCurrentWheather.h
//  WheaterApp
//
//  Created by Kamil Poręba on 11.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "ConcurentOperation.h"
#import "FetchCitiesWithCurrentWheather.h"

@interface FetchCitiesWithCurrentWheather : ConcurentOperation
typedef void (^CitiesResponse)(NSArray *cities, NSError *error);

-(instancetype) init __attribute__((unavailable("init not available")));
-(instancetype) initWithCompletion:(CitiesResponse) completion;
@end
