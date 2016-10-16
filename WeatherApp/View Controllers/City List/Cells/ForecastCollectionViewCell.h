//
//  ForecastCollectionViewCell.h
//  WeatherApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastEntity.h"

@interface ForecastCollectionViewCell : UICollectionViewCell

+(NSString *) getCellIdentifier;

-(void) setCell:(ForecastEntity *)forecast;

@end
