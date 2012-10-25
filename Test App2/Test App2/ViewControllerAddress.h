//
//  ViewControllerAddress.h
//  Test App2
//
//  Created by Denis Kochnev on 2012-10-17.
//  Copyright (c) 2012 Denis Kochnev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"

@interface ViewControllerAddress : UITableViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *txtAddressLine;
@property (weak, nonatomic) IBOutlet UITextField *txtPostalCode;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
- (IBAction)btnOk_Click:(UIButton *)sender;
- (IBAction)btnCancel_Click:(UIButton *)sender;
- (IBAction)btnImageFromAlbum_Click:(UIButton *)sender;
- (IBAction)btnImageFromCamera_Click:(UIButton *)sender;
- (IBAction)resignKeyboard:(id)sender;
@property Address *address;
@end
