//
//  AppDoc.m
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import "AppDoc.h"
#import "AppModel.h"

@implementation AppDoc

- (id)initWithIcon:(NSImage *)icon name:(NSString *)name developer:(NSString *)developer version:(NSString *)version appid:(NSUInteger)appid applicationDirectory:(NSString *)applicationDirectory applicationBaseDirectory:(NSString *)applicationBaseDirectory applicationDisplayName:(NSString *)applicationDisplayName applicationName:(NSString *)applicationName applicationBaseName:(NSString *)applicationBaseName realUniqueID:(NSString *)realUniqueID applicationVersion:(NSString *)applicationVersion
{
    if ((self = [super init])) {
        self.data = [[AppModel alloc] initWithIcon:icon name:name developer:developer version:version appid:appid applicationDirectory:applicationDirectory applicationBaseDirectory:applicationBaseDirectory applicationDisplayName:applicationDisplayName applicationName:applicationName applicationBaseName:applicationBaseName realUniqueID:realUniqueID applicationVersion:applicationVersion];
        self.icon = icon;
    }
    
    return self;
}

/*- (id)initWithIcon:(NSImage *)icon name:(NSString *)name
{
    if ((self = [super init])) {
        self.icon = icon;
        self.data = [[AppModel alloc] initWithIcon:icon name:name];
    }
    
    return self;
}*/

@end
