//
//  TeamsDetailController.m
//  NavTable
//
//  Created by tony on 10-9-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TeamsDetailController.h"


@implementation TeamsDetailController

@synthesize listData;
@synthesize fieldLables;
@synthesize teamsData;

-(IBAction)cancel:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)save:(id)sender {
	
	for (UIView *oneView in self.tableView.subviews) {
		if ([oneView isMemberOfClass:[UITableViewCell class]]) {
			UITableViewCell *cell = (UITableViewCell *)oneView;
			for (UIView *twoView in cell.contentView.subviews) {
				if ([twoView isMemberOfClass:[UITextField class]]) {
					UITextField *textField = (UITextField *)twoView;
					NSLog(@"行 %i -- value %@", textField.tag ,textField.text);
				}
			}
		}
	}
	
	[self.navigationController popViewControllerAnimated:YES];
	
}

-(IBAction)textFieldDone:(id)sender {
	[sender resignFirstResponder];	
}

- (void)viewDidLoad {
	teamsData = [[NSMutableArray alloc] init];
	for (id name in listData) {
		[teamsData addObject:name];
	}
	
	NSArray *array = [[NSArray alloc] initWithObjects:@"第一队：",@"第二队：",@"第三队：",@"第四队：", nil];
	self.fieldLables = array;
	[array release];
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] 
									initWithTitle:@"Cancel" 
									style:UIBarButtonItemStyleBordered 
									target:self 
									action:@selector(cancel:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] 
									 initWithTitle:@"Save" 
									 style:UIBarButtonItemStyleBordered 
									 target:self 
									 action:@selector(save:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	[saveButton release];	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	self.listData = nil;
	self.teamsData = nil;
	self.fieldLables = nil;
	self.listData = nil;
}

- (void)dealloc {
	[listData release];
	[teamsData release];
	[fieldLables release];
    [super dealloc];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [teamsData count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 75, 25)];
		label.textAlignment = UITextAlignmentRight;
		label.tag = LABLE_TAG;
		label.font = [UIFont boldSystemFontOfSize:14];
		[cell.contentView addSubview:label];
		
		[label release];
		
		UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(90, 12, 200, 25)];
		textField.clearsOnBeginEditing = NO;
		[textField setDelegate:self];
		textField.returnKeyType = UIReturnKeyDone;
		[textField addTarget:self action:@selector(textFieldDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
		
		[cell.contentView addSubview:textField];
		
		[textField release];
		
	}
	
	NSInteger row = [indexPath row];
    
	UILabel *label = (UILabel *)[cell viewWithTag:LABLE_TAG];
	UITextField *textField = nil;
	for (UIView *oneView in cell.contentView.subviews) {
		if ([oneView isMemberOfClass:[UITextField class]]) {
			textField = (UITextField *)oneView;
		}
	}

	label.text = [fieldLables objectAtIndex:row];
	textField.text = [listData objectAtIndex:row];
	textField.tag = row;
	
    return cell;
}

#pragma mark 文本字段控件的委托方法 
- (void)textFieldDidEndEditing:(UITextField *)textField {
	NSLog(@"修改 行 %i -- value %@", textField.tag ,textField.text);
}

@end

