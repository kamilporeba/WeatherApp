//
//  WheatherEntity.h
//  WheaterApp
//
//  Created by Kamil Poręba on 11.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//


@interface WheatherEntity : NSObject

@property (nonatomic) NSString *wheatherDescription;
@property (nonatomic) NSString *icon;

-(instancetype) initWithDictionary:(NSDictionary *)responseDictionary;
@end
