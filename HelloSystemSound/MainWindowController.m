//
//  MainWindowController.m
//  HelloSystemSound
//
//  Created by Bear on 2014/3/10.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()
    @property (nonatomic, strong) NSArray *directoryContents;
@end

@implementation MainWindowController

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    self.directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/System/Library/Sounds"
                                                                                 error:nil];
    
    [self.tableView reloadData];
}

#pragma mark NSTableViewDateSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    if(self.directoryContents == nil) {
        return 0;
    }
    
    return [self.directoryContents count];
}


- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
    return [self.directoryContents objectAtIndex:rowIndex];
}


#pragma mark NStableViewDelegate

- (void)tableViewSelectionIsChanging:(NSNotification *)aNotification
{
    NSLog(@"clicked!");
    NSString *soundName = [self.directoryContents objectAtIndex:self.tableView.selectedRow];
    soundName = [soundName stringByDeletingPathExtension];
	NSSound *systemSound = [NSSound soundNamed:soundName];
	[systemSound play];
}

@end
