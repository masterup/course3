//
//  UIDevice+UniqueIdentifier.m
//  lecture2
//
//  Created by Igor Tomych on 10/23/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import "UIDevice+UniqueIdentifier.h"

@implementation UIDevice (UniqueIdentifier)

-(NSString *)uniqueIdentifier {
    NSLog(@"custom unique Identifier");
    return @"my custom id";
}

@end
