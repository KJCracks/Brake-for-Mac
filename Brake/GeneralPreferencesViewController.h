//
//  GeneralPreferencesViewController.h
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import "MASPreferencesWindowController.h"

@interface GeneralPreferencesViewController : NSViewController <MASPreferencesViewController, NSWindowDelegate>

@property (nonatomic) IBOutlet NSTextField *hostField;
@property (nonatomic) IBOutlet NSTextField *userField;
@property (nonatomic) IBOutlet NSTextField *passwordField;
@property (nonatomic) IBOutlet NSTextField *portField;

@property (nonatomic) IBOutlet NSTextField *keyField; // not yet integrated
@property (nonatomic) IBOutlet NSTextField *keyPubField; // not yet integrated

@property (nonatomic) NSButton *saveButton;
@property (nonatomic) NSButton *clearButton;

// Methods
- (IBAction)saveValues:(id)sender;

@end

