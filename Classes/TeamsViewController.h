//
//  TeamsViewController.h
//  NavTable
//
//  Created by tony on 10-9-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@interface TeamsViewController : SecondLevelViewController {
	NSArray *listData;
}

@property (nonatomic, retain) NSArray *listData;

@end
