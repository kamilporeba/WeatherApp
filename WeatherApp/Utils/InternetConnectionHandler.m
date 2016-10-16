//
//  InternetConnectionHandler.m
//  WheaterApp
//
//  Created by Kamil Poręba on 16.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "InternetConnectionHandler.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

@implementation InternetConnectionHandler

+(BOOL) connected {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

@end
