//
//  AppModel.m
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

- (id)initWithIcon:(NSImage *)icon name:(NSString *)name developer:(NSString *)developer version:(NSString *)version appid:(NSUInteger)appid applicationDirectory:(NSString *)applicationDirectory applicationBaseDirectory:(NSString *)applicationBaseDirectory applicationDisplayName:(NSString *)applicationDisplayName applicationName:(NSString *)applicationName applicationBaseName:(NSString *)applicationBaseName realUniqueID:(NSString *)realUniqueID applicationVersion:(NSString *)applicationVersion
{
    if ((self = [super init])) {
        self.icon = icon;
        self.name = name;
        self.developer = developer;
        self.version = version;
        self.appid = appid;
        
        self.applicationDirectory = applicationDirectory;
        self.applicationBaseDirectory = applicationBaseDirectory;
        self.applicationDisplayName = applicationDisplayName;
        self.applicationName = applicationName;
        self.applicationBaseName = applicationBaseName;
        self.realUniqueID = realUniqueID;
        self.applicationVersion = applicationVersion;
    }
    
    return self;
}

/*- (id)initWithIcon:(NSImage *)icon name:(NSString *)name
{
    if ((self = [super init])) {
        self.icon = icon;
        self.name = name;
    }
    
    return self;
}*/

@end
