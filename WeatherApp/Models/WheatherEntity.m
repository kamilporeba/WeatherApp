//
//  WheatherEntity.m
//  WheaterApp
//
//  Created by Kamil Poręba on 11.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "WheatherEntity.h"

@implementation WheatherEntity


-(instancetype) initWithDictionary:(NSDictionary *)responseDictionary {
    self = [super init];
    if (self) {
        self.wheatherDescription = [responseDictionary valueForKey:@"description"];
        self.icon = [responseDictionary valueForKey:@"icon"];
    }
    return self;
}
@end
