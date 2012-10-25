//
//  ViewControlleraccountDetails.h
//  Test App2
//
//  Created by Denis Kochnev on 2012-10-03.
//  Copyright (c) 2012 Denis Kochnev. All rights reserved.
///Users/dkochnev/Documents/Projects/RemoteRepository/Rep2/Test App2/ViewControlleraccountDetails.h

#import <UIKit/UIKit.h>
#import "Customer.h"
#import "ViewControllerAddress.h"
#import "TabelCellAddressView.h"

@interface ViewControlleraccountDetails : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPhone;
//@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, retain)  Customer *customer;
-(void) InitializeCustomer;

@end
