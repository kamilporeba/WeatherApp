//
//  MainInfoEntity.h
//  WheaterApp
//
//  Created by Kamil Poręba on 11.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//


@interface MainInfoEntity : NSObject

@property (nonatomic) CGFloat temperature;

-(instancetype) initWithDictionary:(NSDictionary *)responseDictionary;

@end
