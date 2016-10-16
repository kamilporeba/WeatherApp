//
//  LocationManager.h
//  WheaterApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationProtocol <NSObject>
-(void)didFetchLocation:(NSString *) errorMessage;
@end


@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic , strong) CLLocationManager *locationhandler;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic , weak) id <LocationProtocol> locationDelegate;

+ (instancetype) sharedManager;

-(void) startUpdate;
-(void) stopUpdate;


@end
