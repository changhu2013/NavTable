//
//  TeamsDetailController.h
//  NavTable
//
//  Created by tony on 10-9-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TEAM1  1
#define TEAM2  2
#define TEAM3  3
#define TEAM4  4
#define LABLE_TAG 45678

@interface TeamsDetailController : UITableViewController <UITextFieldDelegate> {
	NSArray *listData;
	NSMutableArray *teamsData;
	NSArray *fieldLables;
}

@property (nonatomic, retain) NSArray *listData;
@property (nonatomic, retain) NSArray *fieldLables;
@property (nonatomic, retain) NSMutableArray *teamsData;

-(IBAction)cancel:(id)sender;
-(IBAction)save:(id)sender;
-(IBAction)textFieldDone:(id)sender;

@end

