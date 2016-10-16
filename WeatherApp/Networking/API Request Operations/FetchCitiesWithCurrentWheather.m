//
//  FetchCitiesWithCurrentWheather.m
//  WheaterApp
//
//  Created by Kamil Poręba on 11.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "FetchCitiesWithCurrentWheather.h"
#import "CityWheatherEntity.h"
#import "LocationManager.h"
@interface FetchCitiesWithCurrentWheather()

@property (nonatomic, copy) CitiesResponse completion;
@end

@implementation FetchCitiesWithCurrentWheather

#pragma mark -Init
- (instancetype)initWithCompletion:(CitiesResponse _Nonnull) completion {
    self = [super init];
    if (self) {
        self.completion = completion;
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
                NSArray * cities =  [self parseServerResponseToCitiesArray:data];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.completion(cities,error);
                });
            }else {
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

-(NSArray *) parseServerResponseToCitiesArray:(NSData *)data {
    NSDictionary *answersJSON = [NSJSONSerialization JSONObjectWithData:data
                                                                options: NSJSONReadingMutableContainers
                                                                  error: nil];
    NSArray *citiesArray = [answersJSON valueForKey:@"list"];
    
    return [self getCityListFromJSON:citiesArray];
}

-(NSArray *) getCityListFromJSON:(NSArray *) jsonArray {
    NSMutableArray * citiesList = [[NSMutableArray alloc] init];
    for (NSDictionary *cityDictionary in jsonArray) {
        
        [citiesList addObject:[[CityWheatherEntity alloc] initWithDictionary:cityDictionary]];
    }
    return  citiesList;
}

-(NSURL *) getMethodURL {
    RequestURLBuilder *urlComponent = [[RequestURLBuilder alloc]initWithBaseURL];
    [urlComponent setMethodName:@"find"];
    
    NSString *lat =  [NSString stringWithFormat:@"%.4f",[LocationManager sharedManager].latitude];
    NSString *lon =  [NSString stringWithFormat:@"%.4f",[LocationManager sharedManager].longitude];
    
    [urlComponent addGetArgumentWithKey:@"lon" andValue:lon];
    [urlComponent addGetArgumentWithKey:@"lat" andValue:lat];
    [urlComponent addGetArgumentWithKey:@"cnt" andValue:@"10"];
    [urlComponent addGetArgumentWithKey:@"units" andValue:@"metric"];
    [urlComponent addAPIID];
    
    return urlComponent.requestURL.URL;
}


@end
