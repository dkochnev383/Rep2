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

@synthesize customer;

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
    if (self.customer ==nil)
    {
        self.customer = [[Customer alloc] init];
        [self InitializeCustomer];
    }
    
    //[_lblName setText:@"Name: test"];
    //[_lblPhone setText:@"Phone: 416-388-5993"];

    [_lblPhone setText:customer.Phone];
    [_lblName setText:customer.CustomerName];
    
    
   // NSString *sTitle = [[NSString alloc] initWithFormat:@"Account details {0}", @"John"];
    NSString *sTitle = [[NSString alloc] initWithFormat:@"Account details %@", customer.Phone ];
    UINavigationItem *navItem = [_navBar.items objectAtIndex:0];
    [navItem setTitle:sTitle];

    //register NIB with custom cell design
    UINib *countryNib = [UINib nibWithNibName:@"TableCellAddressView" bundle:nil];
    [self.tableView registerNib:countryNib
         forCellReuseIdentifier:@"TableCellAddressView"];
  
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view.
}

-(void) InitializeCustomer
{
    //Customer *customer = [[Customer alloc] init];
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
    
    //test addresses
    for (id addr in customer.Addresses) {
        NSLog(((Address*)addr).AddressLine);
    }
}

//DataSource Implementation =================================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [customer.Addresses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  /*
    //Method 1 - use storyboard + standard prototype - subtitle
    static NSString *cellIdentifier = @"Cell1";
    UITableViewCell *tableCell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (tableCell == nil)
    {
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        //tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    tableCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    tableCell.textLabel.text = [[customer.Addresses objectAtIndex:indexPath.row] AddressLine];
    tableCell.detailTextLabel.text =[[customer.Addresses objectAtIndex:indexPath.row] PostalCode];
    return  tableCell;
    */
    
    
/*
    //Method 2 - load from nib file
    //in my case nib name is the same as identifier in cell
    static NSString *cellIdentifier2 = @"TableCellAddressView";
    TabelCellAddressView *tableCell2 = (TabelCellAddressView *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
    if (tableCell2 == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:cellIdentifier2 owner:self options:nil];
        id firstObject = [topLevelObjects objectAtIndex:0];
        if ( [ firstObject isKindOfClass:[UITableViewCell class]] )
            tableCell2 = firstObject;
        else tableCell2 = [topLevelObjects objectAtIndex:1];
        
    }
    [tableCell2.lblTitle setText:@"ttttt"];
    return tableCell2;
 */
 
    /*
    //Method 3 - load from nib file via tbleview registerNib:@""...
    static NSString *cellIdentifier2 = @"TableCellAddressView";
    TabelCellAddressView *tableCell2 = (TabelCellAddressView *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
    [tableCell2.lblTitle setText:@"ttttt"];
    return tableCell2;
    */
    
    /*
    //Method 4 - use storyboard + custom prototype
    static NSString *cellIdentifier = @"Cell1";
    UITableViewCell *tableCell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    tableCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //tableCell.textLabel.text = [[customer.Addresses objectAtIndex:indexPath.row] AddressLine];
    //tableCell.detailTextLabel.text =[[customer.Addresses objectAtIndex:indexPath.row] PostalCode];
    return  tableCell;
    */
    
    //Method 5 - use storyboard + custom prototype in another view
    UITableViewController *myViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyViewController"];
    static NSString *cellIdentifier = @"CellFromAnotherView";
    UITableViewCell *tableCell = (UITableViewCell *) [myViewController.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (tableCell == nil)
    {
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //tableCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //tableCell.textLabel.text = [[customer.Addresses objectAtIndex:indexPath.row] AddressLine];
    //tableCell.detailTextLabel.text =[[customer.Addresses objectAtIndex:indexPath.row] PostalCode];
    return  tableCell;
    
    
    //  If a picture exists then use it
    /*
     if ([img smallPicture])
     {
     tableCell.imageView.contentMode = UIViewContentModeScaleAspectFit;
     tableCell.imageView.image = [UIImage imageWithData:[currentCell smallPicture]];
     }
     [tableCell setSelected:true];
     //NSInteger *i = [states indexOfAccessibilityElement:key];
     */
}

//  Swipe to delete has been used.  Remove the table item
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //  Get a reference to the table item in our data array
        //Address *itemToDelete = [self.customer.Addresses objectAtIndex:indexPath.row];
        //  Delete the item in Core Data - if bound to data
        //[self.managedObjectContext deleteObject:itemToDelete];
        
        //  Remove the item from our array
        [self.customer.Addresses removeObjectAtIndex:indexPath.row];
        
        //  Commit the deletion in core data
        //NSError *error;
        //if (![self.managedObjectContext save:&error])
        //    NSLog(@"Failed to delete picture item with error: %@", [error domain]);
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

//---DataSource Implementation =================================

//+=======Seque implementation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"seqViewAddress"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        ViewControllerAddress *viewAddress = segue.destinationViewController;
        viewAddress.address = [customer.Addresses objectAtIndex:indexPath.row];
        
        //UINavigationController *navController = (UINavigationController *)[segue destinationViewController];
        //PictureListMainTable *piclist = (PictureListMainTable *)[[navController viewControllers] lastObject];
        //piclist.managedObjectContext = managedObjectContext;
        
        /*
        Single1ViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SingleView"];
        svc.post_id = post_id;
        svc.page = 998;
        [self.navigationController pushViewController:svc animated:YES];
        */
    }
}
//-=======Seque implementation


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
