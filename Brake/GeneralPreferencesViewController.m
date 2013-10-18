//
//  GeneralPreferencesViewController.m
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import "GeneralPreferencesViewController.h"

@interface GeneralPreferencesViewController ()

@end

@implementation GeneralPreferencesViewController

- (id)init
{
    return [super initWithNibName:@"GeneralPreferencesViewController" bundle:nil];
}

- (void)updateTextFields
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [self.hostField setStringValue:[defaults objectForKey:@"host"]];
    self.userField.stringValue = [defaults objectForKey:@"user"];
    self.passwordField.stringValue = [defaults objectForKey:@"password"];
    self.portField.stringValue = [defaults objectForKey:@"port"];
}

- (void)awakeFromNib
{
    [self updateTextFields];
}

- (IBAction)saveValues:(id)sender
{
    NSLog(@"did save");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setValue:self.hostField.stringValue forKey:@"host"];
    [defaults setValue:self.userField.stringValue forKey:@"user"];
    [defaults setValue:self.passwordField.stringValue forKey:@"password"];
    [defaults setValue:self.portField.stringValue forKey:@"port"];
    
    [defaults synchronize];
}

- (IBAction)clear:(id)sender 
{
    [NSUserDefaults resetStandardUserDefaults];
}

#pragma mark - MASPreferencesViewController

- (NSString *)identifier
{
    return @"GeneralPreferences";
}

- (NSImage *)toolbarItemImage
{
    return [NSImage imageNamed:NSImageNamePreferencesGeneral];
}

- (NSString *)toolbarItemLabel
{
    return @"General";
}

@end
