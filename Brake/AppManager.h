//
//  AppManager.h
//  Brake
//
//  Created by Thomas Hedderwick on 18/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceManager.h"

@class DeviceManager;
@interface AppManager : NSObject
{
    DeviceManager *deviceManager;
}

@property (nonatomic) int count;
@property (nonatomic) NSMutableArray *applications;

+ (id)sharedInstance;
- (NSMutableArray *)getApplicationsFromDevice;

@end
