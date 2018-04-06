//
//  ViewController.m
//  PopUpSimplier
//
//  Created by Eugenie Tyan on 05.04.2018.
//  Copyright © 2018 Eugenie Tyan. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    __weak IBOutlet NSMenu *_menuletMenu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSMenu *theMenu = [[NSMenu alloc] initWithTitle: @"Contextual Menu"];
//    [theMenu insertItemWithTitle:@"Beep" action: @selector(beep:) keyEquivalent:@"" atIndex:0];
//    [theMenu insertItemWithTitle:@"Honk" action: @selector(honk:) keyEquivalent:@"" atIndex:1];
//
//    NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength: NSVariableStatusItemLength];
//    [statusItem setMenu: theMenu];
//    [statusItem setAlternateImage: [NSImage imageNamed:@"StatusHighlighted"]];
//    [statusItem setImage: [NSImage imageNamed:@"Status"]];
//    [statusItem setHighlightMode: YES];

    // Do any additional setup after loading the view.
}


- (void) awakeFromNib
{
    NSMenu *theMenu = [[NSMenu alloc] initWithTitle: @"Contextual Menu"];
    
    NSMenuItem *docsMenuItem = [[NSMenuItem alloc] init];
    [docsMenuItem setTitle:[NSString stringWithFormat:@"Документы"]];
    [docsMenuItem setHidden:NO];
    //[docsMenuItem setRepresentedObject:contentType];
    [docsMenuItem setTarget:self];
    [docsMenuItem setAction:@selector(performSelectedDragOperation:)];
    //[docsMenuItem setTag:operation];
    [docsMenuItem setEnabled:YES];
    [theMenu addItem: docsMenuItem];
    
    NSMenuItem *taskMenuItem = [[NSMenuItem alloc] init];
    [taskMenuItem setTitle:[NSString stringWithFormat:@"Задача"]];
    [taskMenuItem setHidden:NO];
    //[docsMenuItem setRepresentedObject:contentType];
    [taskMenuItem setTarget:self];
    [taskMenuItem setAction:@selector(performSelectedDragOperation:)];
    //[docsMenuItem setTag:operation];
    [taskMenuItem setEnabled:YES];
    [theMenu addItem: taskMenuItem];
    
    NSMenuItem *breakMenuItem = [[NSMenuItem alloc] init];
    [breakMenuItem setTitle:[NSString stringWithFormat:@"Перерыв"]];
    [breakMenuItem setHidden:NO];
    //[docsMenuItem setRepresentedObject:contentType];
    [breakMenuItem setTarget:self];
    [breakMenuItem setAction:@selector(performSelectedDragOperation:)];
    //[docsMenuItem setTag:operation];
    [breakMenuItem setEnabled:YES];
    [theMenu addItem: breakMenuItem];
    
    [theMenu insertItem: [NSMenuItem separatorItem] atIndex:3];
    
    NSMenuItem *restartMenuItem = [[NSMenuItem alloc] init];
    [restartMenuItem setTitle:[NSString stringWithFormat:@"Перезапуск"]];
    [restartMenuItem setHidden:NO];
    //[docsMenuItem setRepresentedObject:contentType];
    [restartMenuItem setTarget:self];
    [restartMenuItem setAction:@selector(performSelectedDragOperation:)];
    //[docsMenuItem setTag:operation];
    [restartMenuItem setEnabled:YES];
    [theMenu addItem: restartMenuItem];
    
    NSMenuItem *exitMenuItem = [[NSMenuItem alloc] init];
    [exitMenuItem setTitle:[NSString stringWithFormat:@"Выход"]];
    [exitMenuItem setHidden:NO];
    //[docsMenuItem setRepresentedObject:contentType];
    [exitMenuItem setTarget:self];
    [exitMenuItem setAction:@selector(performSelectedDragOperation:)];
    //[docsMenuItem setTag:operation];
    [exitMenuItem setEnabled:YES];
    [theMenu addItem: exitMenuItem];
    
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength: NSVariableStatusItemLength];
    [_statusItem setHighlightMode:YES];
    [_statusItem setEnabled:YES];
    [_statusItem setMenu: theMenu];
    //[_statusItem setToolTip:@"IPMenulet"];
    [_statusItem setAlternateImage: [NSImage imageNamed:@"StatusHighlighted"]];
    [_statusItem setImage: [NSImage imageNamed:@"Status"]];
    [_statusItem setTarget:self];

    //[_statusItem setTitle:@"Click Bot CRM"];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void) performSelectedDragOperation: (id) sender {
    
}

@end
