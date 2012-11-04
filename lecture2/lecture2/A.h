//
//  A.h
//  lecture2
//
//  Created by Igor Tomych on 10/23/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol Talking <NSObject>
@required
- (void)say;
@optional
- (void)bullShit:(NSString *)words;
@end

@interface A : NSObject <Talking>

@end
