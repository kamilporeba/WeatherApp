//
//  LocationManager.m
//  WheaterApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

+ (instancetype)sharedManager {
    static LocationManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        self.locationhandler = [[CLLocationManager alloc] init];
        self.locationhandler.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationhandler.delegate = self;
        [self.locationhandler requestWhenInUseAuthorization];
        [self.locationhandler startMonitoringSignificantLocationChanges];
    }
    return self;
}

-(void) startUpdate {
    [self.locationhandler startUpdatingLocation];
}

-(void) stopUpdate {
    [self.locationhandler stopUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location  = [locations firstObject];
    self.longitude = location.coordinate.longitude;
    self.latitude = location.coordinate.latitude;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.locationDelegate didFetchLocation:nil];
    });
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.locationDelegate didFetchLocation:error.debugDescription];
    });
}
@end
