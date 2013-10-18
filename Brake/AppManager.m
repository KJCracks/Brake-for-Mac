//
//  AppManager.m
//  Brake
//
//  Created by Thomas Hedderwick on 18/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import "AppManager.h"
#import "DeviceManager.h"

@implementation AppManager

+ (id)sharedInstance
{
    static dispatch_once_t p = 0;
    
    __strong static id _sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (NSMutableArray *)getApplicationsFromDevice
{
    deviceManager = [DeviceManager sharedInstance];
    
    if (deviceManager.isConnectedToDevice == NO) {
        // Device needs to be connected to get applications
        return nil;
    }
    
    NSString *returnString = [NSString string];
    
    returnString = [deviceManager changeDirectory:@"/var/private/mobile/Applications/"];
    
    NSLog(@"%@", returnString);
    
    return nil;
}

@end
