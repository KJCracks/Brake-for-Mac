//
//  AppDelegate.m
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDoc.h"
#import "DFSSHServer.h"
#import "DFSSHConnector.h"
#import "DFSSHOperator.h"
#import "DeviceManager.h"
#import "MASPreferencesWindowController.h"
#import "GeneralPreferencesViewController.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
    
    [self.window.contentView addSubview:self.masterViewController.view];
    
    // Check if the defaults are set, if not set them with default settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"host"] == nil) {
        [defaults setObject:@"localhost" forKey:@"host"];
    } else if ([defaults objectForKey:@"user"] == nil) {
        [defaults setObject:@"root" forKey:@"user"];
    } else if ([defaults objectForKey:@"password"] == nil) {
        [defaults setObject:@"alpine" forKey:@"password"];
    } else if ([defaults objectForKey:@"port"] == nil) {
        [defaults setObject:[NSNumber numberWithInt:22] forKey:@"port"];
    }
    
    [defaults synchronize];

    self.masterViewController.view.frame = ((NSView *)self.window.contentView).bounds;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return NO;
}

- (NSWindowController *)preferencesWindowController
{
    if (_preferencesWindowController == nil) {
        NSViewController *generalPreferenceViewController = [[GeneralPreferencesViewController alloc] init];
        NSArray *controllers = @[generalPreferenceViewController];
        
        NSString *title = @"Preferences";
        _preferencesWindowController = [[MASPreferencesWindowController alloc] initWithViewControllers:controllers title:title];
    }
    
    return _preferencesWindowController;
}

- (IBAction)openPreferences:(id)sender
{
    [self.preferencesWindowController showWindow:nil];
}

@end
