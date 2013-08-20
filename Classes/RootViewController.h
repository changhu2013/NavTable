//
//  RootViewController.h
//  NavTable
//
//  Created by tony on 10-9-12.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSArray *controllers;
}

@property (nonatomic, retain) NSArray *controllers;

@end
