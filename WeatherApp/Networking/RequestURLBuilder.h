//
//  RequestURLBuilder.h
//  WheaterApp
//
//  Created by Kamil Poręba on 12.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestURLBuilder : NSObject

@property (nonatomic, nonnull) NSURLComponents *requestURL;

-(instancetype _Nonnull) initWithBaseURL;
-(void) setMethodName:(NSString * _Nonnull) methodName;
-(void) addGetArgumentWithKey:(NSString *_Nonnull) key andValue:(NSString *_Nonnull) value;
-(void) addAPIID;

@end
