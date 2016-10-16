//
//  FetchForecastForCitiy.m
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "FetchForecastForCitiy.h"
#import "ForecastEntity.h"
#import <CoreLocation/CLLocation.h>

@interface FetchForecastForCitiy()
@property (nonatomic, copy) ForecastResponse completion;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@end

@implementation FetchForecastForCitiy

#pragma mark -Init
-(instancetype) initWithCompletion:(ForecastResponse) completion andLongitude: (double) longitude andLatitude:(double)latitude {
    self = [super init];
    if (self) {
        self.completion = completion;
        self.latitude = latitude;
        self.longitude = longitude;
    }
    return self;
}

#pragma mark - Start

-(void) start {
    [super start];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [self getMethodURL];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
          if (data) {
              NSDictionary *answersJSON = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: nil];
              NSArray *citiesArray = [answersJSON valueForKey:@"list"];
              NSMutableArray * forecasts = [[NSMutableArray alloc] init];
              for (NSDictionary *cityDictionary in citiesArray) {
                  [forecasts addObject:[[ForecastEntity alloc] initWithDictionary:cityDictionary]];
              }

              if (self.completion)
              {
                  dispatch_async(dispatch_get_main_queue(), ^{
                      self.completion(forecasts,nil);
                  });
              }
          } else {
              dispatch_async(dispatch_get_main_queue(), ^{
                  self.completion(nil,error);
              });
          }
      
          [self finish];
      }];
    
    [task resume];
}

#pragma mark - Cancel

-(void) cancel {
    [super cancel];
    [self finish];
}


#pragma mark -Private methods

-(NSURL *) getMethodURL {
    RequestURLBuilder *urlComponent = [[RequestURLBuilder alloc]initWithBaseURL];
    [urlComponent setMethodName:@"forecast"];

    if (self.longitude) {
        NSString *lat =  [NSString stringWithFormat:@"%.4f",self.latitude];
        NSString *lon =  [NSString stringWithFormat:@"%.4f",self.longitude];
        
        [urlComponent addGetArgumentWithKey:@"lon" andValue:lon];
        [urlComponent addGetArgumentWithKey:@"lat" andValue:lat];
    }

    [urlComponent addGetArgumentWithKey:@"units" andValue:@"metric"];
     [urlComponent addGetArgumentWithKey:@"cnt" andValue:@"9"];
    
    [urlComponent addAPIID];
    
    return urlComponent.requestURL.URL;
}


@end
