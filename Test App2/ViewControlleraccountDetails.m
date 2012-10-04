//
//  ViewControlleraccountDetails.m
//  Test App2
//
//  Created by Denis Kochnev on 2012-10-03.
//  Copyright (c) 2012 Denis Kochnev. All rights reserved.
//

#import "ViewControlleraccountDetails.h"

@interface ViewControlleraccountDetails ()

@end

@implementation ViewControlleraccountDetails

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [_lblName setText:@"Name: test"];
    [_lblPhone setText:@"Phone: 416-388-5993"];
    Customer *customer = [[Customer alloc] init];
    customer.CustomerName = @"John Smith";
    customer.Phone = @"416-388-5993";
    
    Address *address = [[Address alloc] init];
    address.Country = @"Canada";
    address.City = @"Toronto";
    address.Province = @"Ontario";
    address.AddressLine = @"33 Isabella street";
    address.PostalCode = @"M2K2J7";
    
    Address *address2 = [[Address alloc] init];
    address2.Country = @"Canada";
    address2.City = @"Toronto";
    address2.Province = @"Ontario";
    address2.AddressLine = @"10 Ruddington drive";
    address2.PostalCode = @"M2K2J7";
    
    [customer.Addresses addObject:address];
    [customer.Addresses addObject:address2];
    
    [_lblPhone setText:customer.Phone];
    [_lblName setText:customer.CustomerName];
    //NSObject *i = [_navBar.items objectAtIndex: 1];
    
    for (id addr in customer.Addresses) {
        
        NSLog(((Address*)addr).AddressLine);
    }
    
   // NSString *sTitle = [[NSString alloc] initWithFormat:@"Account details {0}", @"John"];
    NSString *sTitle = [[NSString alloc] initWithFormat:@"Account details %@", @""];
    [_navBar setTitle: sTitle];
    //[_navBar set]
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
