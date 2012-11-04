//
//  UIStudentsViewController.h
//  lecture2
//
//  Created by Igor Tomych on 10/20/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StudentsApi;

@interface UIStudentsViewController : UITableViewController {
//    StudentsApi *_studentsApi;
}

@property (nonatomic, retain) StudentsApi *studentsApi;
- (void)loadData;
@end
