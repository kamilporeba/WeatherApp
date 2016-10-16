//
//  RequestURLBuilder.m
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "RequestURLBuilder.h"

@implementation RequestURLBuilder


-(instancetype) initWithBaseURL {
    self = [super init];
    
    if (self) {
        self.requestURL = [[NSURLComponents alloc]init];
        [self setBaseURL];
    }
    
    return self;
}

-(void) setBaseURL {
    [self.requestURL setScheme:@"http"];
    [self.requestURL setHost:kHostURL];
}

-(void) setMethodName:(NSString * _Nonnull) methodName {
    [self.requestURL setPath:[[self getPath] stringByAppendingString:methodName]];
}

-(NSString *) getPath {
    return @"/data/2.5/";
    
}

-(void) addGetArgumentWithKey:(NSString *_Nonnull) key andValue:(NSString *_Nonnull) value {
    NSString * query = [key stringByAppendingString:[@"=" stringByAppendingString:value]];
    if (self.requestURL.query) {
        NSString * currentQuery = [self.requestURL.query stringByAppendingString:@"&"];
        [self.requestURL setQuery:[currentQuery stringByAppendingString:query]];
    } else {
        [self.requestURL setQuery:query];
    }
    
}

-(void) addAPIID {
    [self addGetArgumentWithKey:@"appid" andValue:kAPIID];
}

@end
