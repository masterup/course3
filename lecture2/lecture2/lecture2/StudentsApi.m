//
//  Student.m
//  lecture2
//
//  Created by Igor Tomych on 10/20/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import "StudentsApi.h"

@implementation StudentsApi

- (NSString*)studentNameForPath:(NSIndexPath*)studentPath {
    return [NSString stringWithFormat:@"Student name %d", studentPath.row];
}

@end
