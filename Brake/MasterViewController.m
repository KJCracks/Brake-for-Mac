//
//  MasterViewController.m
//  Brake
//
//  Created by Thomas Hedderwick on 17/10/2013.
//  Copyright (c) 2013 Dybero. All rights reserved.
//

#import "MasterViewController.h"
#import "AppDoc.h"
#import "AppModel.h"
#import "DeviceManager.h"
#import "AppManager.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        
        manager = [DeviceManager sharedInstance];
        appManager = [AppManager sharedInstance];
    }
    
    return self;
}

- (void)updateProgress:(NSString *)message log:(NSString *)log
{
    [self.connectButton setTitle:message];
    NSLog(@"%@", log);
}

- (IBAction)connectToDevice:(id)sender
{
    if (manager.isConnectedToDevice == YES) {
        [manager disconnectFromDevice];
        [self updateProgress:@"Connect to Device" log:nil];
    } else {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        manager.host = [defaults objectForKey:@"host"];
        manager.user = [defaults objectForKey:@"user"];
        manager.password = [defaults objectForKey:@"password"];
        manager.port = [defaults integerForKey:@"port"];
        [manager connectToDevice];
        //[self updateProgress:@"Disconnect" log:nil];
    }
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    if ([tableColumn.identifier isEqualToString:@"Applications"]) {
        cellView.textField.stringValue = @"Please connect to your device.";
            
        return cellView;
    } else {
        if ([tableColumn.identifier isEqualToString:@"Applications"]) {
            AppDoc *appDoc = [self.apps objectAtIndex:row];
            cellView.imageView.image = appDoc.icon;
            cellView.textField.stringValue = appDoc.data.name;
            
            return cellView;
        }
    }
    
    return cellView;
}

- (AppDoc *)selectedAppDoc
{
    NSInteger selectedRow = [self.applicationTableView selectedRow];
    
    if (selectedRow >= 0 && self.apps.count > selectedRow) {
        AppDoc *selectedApp = [self.apps objectAtIndex:selectedRow];
        
        return selectedApp;
    }
    
    return nil;
}

- (void)setDetailInfo:(AppDoc *)doc
{
    NSString *name = @"";
    NSImage *image = nil;
    
    if (doc != nil) {
        name = doc.data.name;
        image = doc.icon;
    }
    
    [self.applicationTableView setStringValue:name];
    [self.iconView setImage:image];
    [self.applicationName setStringValue:name];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    AppDoc *selectedDoc = [self selectedAppDoc];
    
    [self setDetailInfo:selectedDoc];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.apps count];
}

@end
