//
//  MainWindowController.h
//  HelloSystemSound
//
//  Created by Bear on 2014/3/10.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//


@interface MainWindowController : NSWindowController <NSTableViewDelegate, NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *tableView;

@end
