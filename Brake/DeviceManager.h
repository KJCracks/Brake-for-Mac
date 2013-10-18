//
//  DeviceManager.h
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DFSSHServer.h"
#import "DFSSHOperator.h"
#import "DFSSHConnector.h"
#import "AppManager.h"

@protocol ProgressUpdateDelegate <NSObject>

@required
- (void)updateProgress:(NSString *)message log:(NSString *)log;

@end

@class AppManager;
@interface DeviceManager : NSObject <ProgressUpdateDelegate>
{
    AppManager *appManager;
}

@property (nonatomic) bool isConnectedToDevice;

// General
@property (nonatomic) DFSSHServer *server;
@property (nonatomic) DFSSHConnector *connection;

// Required by user input
@property (nonatomic) NSString *host;
@property (nonatomic) NSString *user;
@property (nonatomic) NSString *password;
@property (nonatomic) int port;

// Optional for key login
@property (nonatomic) NSString *key;
@property (nonatomic) NSString *keyPub;

// Set once connection occurs
@property (nonatomic) NSString *currentDirectory;
@property (nonatomic) NSString *directoryPath;
@property (nonatomic) NSString *deviceName;

// Delegate
@property (nonatomic) id<ProgressUpdateDelegate> delegate;

+ (id)sharedInstance;

- (void)connectToDevice;
- (void)disconnectFromDevice;
- (NSString *)getDeviceName;
- (NSString *)executeCommand:(NSString *)command;
- (NSString *)changeDirectory:(NSString *)directory;

@end
