//
//  ViewController.m
//  Garage Opener
//
//  Created by Kenneth Edstrand on 5/17/13.
//  Copyright (c) 2013 Kenneth Edstrand. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.ipTextField setDelegate:self];
    
    [self.ipTextField setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"lastURL"]];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self buttonHit:nil];
    
    return YES;
    
}



- (IBAction)buttonHit:(id)sender
{
    
    NSString* textfieldvalue = self.ipTextField.text;
    
    [[NSUserDefaults standardUserDefaults] setValue:textfieldvalue forKey:@"lastURL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSURL* myURL = [NSURL URLWithString:textfieldvalue];
    
    NSString* result = [NSString stringWithContentsOfURL:myURL encoding:NSASCIIStringEncoding error:nil];
    
    NSLog(@"result is %@",result);
    
    
    [self.ipTextField resignFirstResponder];
    
}


@end
