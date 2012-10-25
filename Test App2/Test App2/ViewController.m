//
//  ViewController.m
//  Test App2
//
//  Created by Denis Kochnev on 2012-10-03.
//  Copyright (c) 2012 Denis Kochnev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{

    
    //========Arrays===================
    // Compose a static array of string objects
    NSString *objs[3] = {@"One", @"Two", @"Three"};
    // Create an array object with the static array
    NSArray *arrayOne = [NSArray arrayWithObjects:&(*objs) count:3];
    // Create an array with a nil-terminated list of objects
    NSArray *arrayTwo = [[NSArray alloc] initWithObjects:@"One", @"Two", @"Three", nil];
    NSString *theString = [arrayTwo objectAtIndex:1]; // returns second object in array
    
    NSArray *myArray = @[ @"Hello World", @67, [NSDate date] ];
    id theObject = myArray[1];
        for (NSString *cityName in myArray) {
        if ([cityName isEqualToString:@"Hello World"]) {
            NSLog(@"We're near the mothership!");
            break;
        }
    }
    
    //enumerate with blocks
    [myArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isEqual:@"Hello World"]) {
            NSLog(@"We're near the mothership!");
            *stop = YES;
        }
    }];
    
    static int sum = 0;
    for (id item in myArray) {
        if ([item isKindOfClass:[NSNumber class]]) {
            int i = (int)[item intValue];
            sum += i;
        }
    }
    
    //copy arrays
    NSArray *myArray2 = [myArray copy];
    
    //mutable arrays
    NSMutableArray *myMutableArray = [NSMutableArray arrayWithCapacity:1];
    NSDate *today = [NSDate date];
    myMutableArray[0] = today;
    
    
    
    //=====Dictionaries=================
    // First create an array of keys and a complementary array of values
    NSArray *keyArray = [NSArray arrayWithObjects:@"IssueDate", @"IssueName", @"IssueIcon", nil];
    NSArray *valueArray = [NSArray arrayWithObjects:[NSDate date], @"Numerology Today", @333, nil];
    // Create a dictionary, passing in the key array and value array
    NSDictionary *dictionaryOne = [NSDictionary dictionaryWithObjects:valueArray forKeys:keyArray];
    // Create a dictionary by alternating value and key and terminating with nil
    NSDictionary *dictionaryTwo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSDate date],
                                   @"IssueDate", @"Numerology Today", @"IssueName", @333, @"IssueIcon", nil];
    //[dictionaryTwo setValue:@"value 1" forKey:@"TestKey"];
    
    
    NSDictionary *myDictionary = @{
    @"name" : NSUserName(),
    @"date" : [NSDate date],
    @"processInfo" : [NSProcessInfo processInfo]
    };
    
    //access to array elements
    NSDate *date = [dictionaryTwo objectForKey:@"IssueDate"];
    NSString *theName = myDictionary[@"name"];
    NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc] init];
    mutableDict[@"name"] = @"John Doe";
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender {
    
}
@end
