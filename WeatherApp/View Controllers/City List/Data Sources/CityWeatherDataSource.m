//
//  CityWeatherDataSource.m
//  WeatherApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "CityWeatherDataSource.h"
#import "CityWeatherInfoCollectionViewCell.h"


@implementation CityWeatherDataSource

- (instancetype)init {
    self =  [super init];
    if (self) {
        self.citiesWheatherInfo = [[NSArray alloc]init];
    }
    
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.citiesWheatherInfo.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CityWeatherInfoCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:[CityWeatherInfoCollectionViewCell getCellIdentifier] forIndexPath:indexPath];
    CityWheatherEntity *city = [self.citiesWheatherInfo objectAtIndex:indexPath.row];
    [cell setCell:city];
    return cell;
}

@end
