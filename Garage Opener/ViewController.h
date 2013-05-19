//
//  ViewController.h
//  Garage Opener
//
//  Created by Kenneth Edstrand on 5/17/13.
//  Copyright (c) 2013 Kenneth Edstrand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>


- (IBAction)buttonHit:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *ipTextField;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;

@end
