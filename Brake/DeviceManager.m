//
//  DeviceManager.m
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import "DeviceManager.h"
#import "DFSSHServer.h"
#import "DFSSHOperator.h"
#import "DFSSHConnector.h"
#import "AppManager.h"

@implementation DeviceManager

int timeout = 2;

+ (id)sharedInstance
{
    static dispatch_once_t p = 0;
    
    __strong static id _sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)initWithHost:(NSString *)host user:(NSString *)user password:(NSString *)password port:(int)port
{
    self.host = host;
    self.user = user;
    self.password = password;
    self.port = port;
    
    appManager = [AppManager sharedInstance];
    
    return self;
}

- (id)settingsWithHost:(NSString *)host user:(NSString *)user key:(NSString *)key keyPub:(NSString *)keyPub
{
    self.host = host;
    self.user = user;
    self.key = key;
    self.keyPub = keyPub;
    
    return self;
}

- (void)connectToDevice
{
    NSLog(@"hit");
    [self.delegate updateProgress:@"Connecting" log:@"Connecting to device"];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0,0);
    
    dispatch_async(queue, ^{
        self.server = [[DFSSHServer alloc] init];
        [self.server setSSHHost:self.host port:self.port user:self.user key:self.key keypub:self.keyPub password:self.password];
        self.connection = [[DFSSHConnector alloc] init];
        [self.connection connect:self.server connectionType:[DFSSHConnectionType auto]];
        
        dispatch_queue_t main = dispatch_get_main_queue();
        
        dispatch_async(main, ^{
            if ([self.server connectionStatus]) {
                [self.delegate updateProgress:@"Connected" log:@"Connected to device successfully"];
                self.isConnectedToDevice = YES;
                [self getDeviceName];
                [appManager getApplicationsFromDevice];
            } else {
                [self.delegate updateProgress:@"Error!" log:@"Error during SSH session attempt:"];
                [self disconnectFromDevice];
            }
        });
    });
    }

- (void)disconnectFromDevice
{
    [self.connection closeSSH:self.server];
    [self.delegate updateProgress:@"Disconnected" log:@"Disconnected from device"];
    self.isConnectedToDevice = NO;
}

- (NSString *)getDeviceName
{
    NSString *deviceName = [self executeCommand:@"hostname"];
    [self.delegate updateProgress:[NSString stringWithFormat:@"Connected to %@", deviceName] log:[NSString stringWithFormat:@"Device name: %@", deviceName]];
    self.deviceName = deviceName;
    return self.deviceName;
}

- (NSString *)executeCommand:(NSString *)command
{
    [self.delegate updateProgress:nil log:[NSString stringWithFormat:@"Executing command: %@", command]];
    return [DFSSHOperator execCommand:command server:self.server timeout:[NSNumber numberWithInt:timeout]];
}

- (NSString *)changeDirectory:(NSString *)directory
{
    [self.delegate updateProgress:nil log:[NSString stringWithFormat:@"Changing directory to: %@", directory]];
    return [DFSSHOperator execCommand:[NSString stringWithFormat:@"cd %@", directory] server:self.server timeout:[NSNumber numberWithInt:timeout]];
}

@end
