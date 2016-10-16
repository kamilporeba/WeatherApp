//
//  APIRequestManager.m
//  WheaterApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "APIRequestManager.h"
#import "FetchCitiesWithCurrentWheather.h"
#import "InternetConnectionHandler.h"
#import "FetchWeatherIcon.h"

@interface APIRequestManager()

@property (strong, nonatomic) NSOperationQueue *operationQ;


@end


@implementation APIRequestManager

+ (instancetype)sharedManager {
    static APIRequestManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        self.operationQ = [[NSOperationQueue alloc]init];
    }
    return self;
}


-(void)fetchCityTile:(CitiesResponse _Nonnull) completion {
    
    if ([InternetConnectionHandler connected]) {
        [self.operationQ addOperation: [[FetchCitiesWithCurrentWheather alloc] initWithCompletion:completion]];
    } else {
        NSError *connectionError = [self getConnectionError];
        completion(nil,connectionError);
    }
}

-(void)fetchForecastCity:(ForecastResponse _Nonnull) completion andCityEntity:(CityWheatherEntity *) city {
    if ([InternetConnectionHandler connected]) {
        [self.operationQ addOperation: [[FetchForecastForCitiy alloc] initWithCompletion:completion andLongitude:city.longitude andLatitude:city.latitude]];
    } else {
        NSError *connectionError = [self getConnectionError];
        completion(nil,connectionError);
    }
}

-(void) fetchWeatherIcon: (NSString *)iconName AndcCompletion:(ImageResponse) completion {
    
    if ([InternetConnectionHandler connected]) {
        [self.operationQ addOperation: [[FetchWeatherIcon alloc] initWithCompletion:completion andImageName:iconName]];
    } else {
        NSError *connectionError = [self getConnectionError];
        completion(nil,connectionError);
    }
}

-(NSError *) getConnectionError {
    NSMutableDictionary* details = [NSMutableDictionary dictionary];
    [details setValue:@"Connection error" forKey:NSLocalizedDescriptionKey];
    NSError *error = [[NSError alloc]initWithDomain:@"Internet Connection" code:400 userInfo:details];
    return error;
}
@end
