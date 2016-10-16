//
//  MainInfoEntity.m
//  WheaterApp
//
//  Created by Kamil Poręba on 11.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "MainInfoEntity.h"

@implementation MainInfoEntity

-(instancetype) initWithDictionary:(NSDictionary *)responseDictionary {
    self = [super init];
    if (self) {
        self.temperature = [[responseDictionary valueForKey:@"temp"] floatValue];
    }
    return self;
}

@end
