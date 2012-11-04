//
//  ProtocolName.h
//
//  Created by Igor Tomych on 10/20/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol StudentsSearch <NSObject>
-(NSArray *)searchForStudents:(NSString *)name;
@end

@interface StudentsApi : NSObject <StudentsSearch>
- (NSString*)studentNameForPath:(NSIndexPath*)studentPath;
@end