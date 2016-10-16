//
//  FetchWeatherIcon.m
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "FetchWeatherIcon.h"


@interface FetchWeatherIcon()
@property (nonatomic, copy) IconResponse completion;
@property (nonnull, nonatomic) NSString* iconName;
@end
@implementation FetchWeatherIcon

#pragma mark -Init
- (instancetype)initWithCompletion:(IconResponse _Nonnull) completion andImageName:(NSString * _Nonnull) imageName {
    self = [super init];
    if (self) {
        self.completion = completion;
        self.iconName = imageName;
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
            UIImage *image= [UIImage imageWithData:data];

            dispatch_async(dispatch_get_main_queue(), ^{
                self.completion(image,error);
            });
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

- (NSURL *)getMethodURL {
    RequestURLBuilder *urlComponent = [[RequestURLBuilder alloc]initWithBaseURL];
    [urlComponent.requestURL setPath:[@"/img/w/" stringByAppendingString:[self.iconName stringByAppendingString:@".png"]]];
    
    return urlComponent.requestURL.URL;
}

@end
