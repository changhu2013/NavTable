//
//  TeamsViewController.m
//  NavTable
//
//  Created by tony on 10-9-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TeamsViewController.h"
#import "TeamsViewController.h"
#import "TeamsDetailController.h"

@implementation TeamsViewController
@synthesize listData;
- (void)viewDidLoad {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"teamdictionary" ofType:@"plist"];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
	self.listData =  [dict allKeys];
	[dict release];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidUnload {
	self.listData = nil;
}
- (void)dealloc {
	[listData release];
    [super dealloc];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listData count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	NSInteger row = [indexPath row];
	NSString *title = [listData objectAtIndex:row];
	cell.textLabel.text = title;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSInteger row = [indexPath row];
	NSString *groupName = [listData objectAtIndex:row];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"teamdictionary" ofType:@"plist"];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
	
	TeamsDetailController *detailController = [[TeamsDetailController alloc]
													initWithStyle:UITableViewStyleGrouped];
	
	detailController.listData = [dict objectForKey:groupName];	
	[dict release];
	
	//[array release];
    // Navigation logic may go here. Create and push another view controller.
	 [self.navigationController pushViewController:detailController animated:YES];
	 [detailController release];
}


@end

