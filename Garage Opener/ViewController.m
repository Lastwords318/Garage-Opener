//
//  ViewController.m
//  Garage Opener
//
//  Created by Kenneth Edstrand on 5/17/13.
//  Copyright (c) 2013 Kenneth Edstrand. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *waitSpinner;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Garage Door";
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Settings"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(settings:)];
    
    
}

-(void)settings:(id)sender
{
    [self.navigationController pushViewController:[[SettingsViewController alloc] initWithNibName:nil bundle:nil] animated:YES];
}

-(void)applicationDidBecomeActive:(NSNotification*)notification
{
    [self statusButton:nil];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self buttonHit:nil];    
    return YES;
    
}

-(NSURL*)URLWithSuffix:(NSString*)suffix
{
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"ipAddress"],suffix]];
}

- (IBAction)statusButton:(id)sender {
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[self URLWithSuffix:@""]];
    
    [self.waitSpinner startAnimating];
    
    [NSURLConnection sendAsynchronousRequest:request
                                        queue:[NSOperationQueue mainQueue]
                            completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
     
                                NSString* result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                
                                [self.waitSpinner stopAnimating];
                                
                                if([result rangeOfString:@"Closed"].location != NSNotFound)
                                {
                                    self.tempLabel.text = @"Closed";
                                }
                                else
                                {
                                    self.tempLabel.text = @"Open";
                                }
                                
                            }];
    
}

- (IBAction)tempTapped:(id)sender {
    
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[self URLWithSuffix:@"Status"]];
    [self.waitSpinner startAnimating];

    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               [self.waitSpinner stopAnimating];
                               
                               
                               NSString* result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               
                               self.tempLabel.text = [result stringByAppendingString:@"° F"];
                               
                               
                               
                               
                           }];
}

- (IBAction)buttonHit:(id)sender
{
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[self URLWithSuffix:@"Garage"]];
    [self.waitSpinner startAnimating];
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               [self.waitSpinner stopAnimating];
                               
                            
                               self.tempLabel.text = @"Clicked!";
                               
                               
                           }];

    
}
@end
