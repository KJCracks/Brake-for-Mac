//
//  AppDelegate.h
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "MasterViewController.h"


@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSWindowController *_preferencesWindowController;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, strong) IBOutlet MasterViewController *masterViewController;
@property (nonatomic, readonly) NSWindowController *preferencesWindowController;

// Methods
- (IBAction)openPreferences:(id)sender;


@end
