//
//  TabelCellAddressView.m
//  Test App2
//
//  Created by Denis Kochnev on 2012-10-20.
//  Copyright (c) 2012 Denis Kochnev. All rights reserved.
//

#import "TabelCellAddressView.h"

@implementation TabelCellAddressView
@synthesize lblTitle;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //[lblTitle setText:@"Title 1111"];
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
