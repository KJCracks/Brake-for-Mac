//
//  AppDoc.h
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppModel;

@interface AppDoc : NSObject

@property (strong) AppModel *data;
@property (strong) NSImage *icon;

// Methods

- (id)initWithIcon:(NSImage *)icon name:(NSString *)name developer:(NSString *)developer version:(NSString *)version appid:(NSUInteger)appid applicationDirectory:(NSString *)applicationDirectory applicationBaseDirectory:(NSString *)applicationBaseDirectory applicationDisplayName:(NSString *)applicationDisplayName applicationName:(NSString *)applicationName applicationBaseName:(NSString *)applicationBaseName realUniqueID:(NSString *)realUniqueID applicationVersion:(NSString *)applicationVersion;

//- (id)initWithIcon:(NSImage *)icon name:(NSString *)name;

@end
