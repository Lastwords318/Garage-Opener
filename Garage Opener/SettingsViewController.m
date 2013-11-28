//
//  SettingsViewController.m
//  Garage Opener
//
//  Created by Kenneth Edstrand on 11/28/13.
//  Copyright (c) 2013 Kenneth Edstrand. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *ipAddress;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)save:(id)sender {
    
    NSString* newIp = self.ipAddress.text;
    
    [[NSUserDefaults standardUserDefaults] setObject:newIp forKey:@"ipAddress"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    [[[UIAlertView alloc] initWithTitle:@"Success" message:@"SHIT'S BEEN SAVED, YO" delegate:nil cancelButtonTitle:@"THANKS BRO" otherButtonTitles:nil] show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Settings";
    
    self.ipAddress.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"ipAddress"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
