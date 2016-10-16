//
//  ForecastDataSource.m
//  WeatherApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "ForecastDataSource.h"
#import "ForecastCollectionViewCell.h"
#import "ForecastEntity.h"

@implementation ForecastDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.forecasts = [[NSArray alloc]init];
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.forecasts.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ForecastCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:[ForecastCollectionViewCell getCellIdentifier] forIndexPath:indexPath];
    ForecastEntity *forecast = [self.forecasts objectAtIndex:indexPath.row];
    [cell setCell:forecast];
    return cell;
}

@end
