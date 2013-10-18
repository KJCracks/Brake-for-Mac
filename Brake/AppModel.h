//
//  AppModel.h
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject

// Application Data
@property (nonatomic, strong) NSImage *icon;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *developer;
@property (nonatomic, strong) NSString *version;
@property (nonatomic) NSUInteger appid;

// Clutch needed Data
@property (nonatomic, strong) NSString *applicationDirectory;
@property (nonatomic, strong) NSString *applicationBaseDirectory;
@property (nonatomic, strong) NSString *applicationDisplayName;
@property (nonatomic, strong) NSString *applicationName;
@property (nonatomic, strong) NSString *applicationBaseName;
@property (nonatomic, strong) NSString *realUniqueID;
@property (nonatomic, strong) NSString *applicationVersion;

// Methods
- (id)initWithIcon:(NSImage *)icon name:(NSString *)name developer:(NSString *)developer version:(NSString *)version appid:(NSUInteger)appid applicationDirectory:(NSString *)applicationDirectory applicationBaseDirectory:(NSString *)applicationBaseDirectory applicationDisplayName:(NSString *)applicationDisplayName applicationName:(NSString *)applicationName applicationBaseName:(NSString *)applicationBaseName realUniqueID:(NSString *)realUniqueID applicationVersion:(NSString *)applicationVersion;

//- (id)initWithIcon:(NSImage *)icon name:(NSString *)name;

@end
