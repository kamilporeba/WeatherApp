//
//  CityListViewController.m
//  WeatherApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "CityListViewController.h"
#import "CityWeatherDataSource.h"
#import "LocationManager.h"
#import "CityWeatherDelegate.h"

@interface CityListViewController () <LocationProtocol>
@property (weak , nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak , nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@property CityWeatherDataSource * dataSource;
@property CityWeatherDelegate * delegate;
@end

@implementation CityListViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    [self setCollectionViewDataSource];
    [LocationManager sharedManager].locationDelegate = self;
    [self.loadingIndicator setHidden:NO];
}

-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.collectionView.collectionViewLayout invalidateLayout];
}

-(void) setCollectionViewDataSource {
    self.dataSource = [[CityWeatherDataSource alloc] init];
    self.collectionView.dataSource = self.dataSource;
    self.delegate = [[CityWeatherDelegate alloc]init];
    self.collectionView.delegate = self.delegate;
}

#pragma mark -Location Protocol
-(void) didFetchLocation:(NSString *)errorMessage {
    if (errorMessage) {
        [self showAlertWithTitle:@"You should allow application to get your location\n Check in yout settings."];
        [self.loadingIndicator setHidden:YES];
    } else {
        [self fetchCitiesWeather];
    }
}

#pragma mark -Private methods

-(void) showAlertWithTitle:(NSString *)title {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * okAction  = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:NO completion:nil];
    }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:NO completion:nil];
}

-(void) fetchCitiesWeather {
    [[APIRequestManager sharedManager] fetchCityTile:^(NSArray *cities, NSError *error) {
        if (error) {
            [self showAlertWithTitle:[error.userInfo objectForKey:@"NSLocalizedDescription"]];
        }else {
            self.dataSource.citiesWheatherInfo = cities;
            [self.collectionView reloadData];
        }
        [_loadingIndicator setHidden:YES];
    }];
}


@end
