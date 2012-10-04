//
//  Customer.h
//  Test App2
//
//  Created by Denis Kochnev on 2012-10-03.
//  Copyright (c) 2012 Denis Kochnev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
@interface Customer : NSObject

@property NSString *CustomerName;
@property NSString *Phone;
@property NSMutableArray *Addresses;


@end
