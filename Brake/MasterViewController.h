//
//  MasterViewController.h
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DeviceManager.h"
#import "AppManager.h"

@class DeviceManager;
@class AppManager;
@interface MasterViewController : NSViewController <NSTableViewDelegate, ProgressUpdateDelegate>
{
    DeviceManager *manager;
    AppManager *appManager;
}

@property (strong) NSMutableArray *apps;

// Interface Builder Outlets

@property (weak) IBOutlet NSTextField *applicationName;
@property (weak) IBOutlet NSTextField *applicationVersion;
@property (weak) IBOutlet NSTextField *applicationDeveloper;
@property (weak) IBOutlet NSImageView *iconView;

@property (weak) IBOutlet NSButton *crackButton;
@property (weak) IBOutlet NSButton *queueButton;
@property (weak) IBOutlet NSButton *connectButton;
@property (weak) IBOutlet NSTableView *applicationTableView;
@property (weak) IBOutlet NSTableView *descriptionTableView;

// Methods
- (IBAction)connectToDevice:(id)sender;

@end
