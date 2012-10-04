//
//  Customer.m
//  Test App2
//
//  Created by Denis Kochnev on 2012-10-03.
//  Copyright (c) 2012 Denis Kochnev. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (id)init { // or however it is named
    if ((self = [super init])) {
        _Addresses = [[NSMutableArray alloc] init];
        // ... more?
    }
    return self;
}


@end
