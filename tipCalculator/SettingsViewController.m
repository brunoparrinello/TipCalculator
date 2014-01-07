//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Bruno Parrinello on 1/6/14.
//  Copyright (c) 2014 Bruno Parrinello. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultPercentTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (IBAction)selectDefaultPercentage:(id)sender;
- (IBAction)onClickSave:(id)sender;


@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"view Did Load");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float floatValue = [defaults floatForKey:@"defaultTip"];
    
    self.defaultPercentTextField.text = [NSString stringWithFormat:@"%0.0f", floatValue];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectDefaultPercentage:(id)sender {
    //NSArray *tipPercentages = @[@(0.1), @(0.15), @(0.18), @(0.2)];
    //float defaultPercentage = [tipPercentages[self.defaultTipControl.selectedSegmentIndex]floatValue];

}

- (IBAction)onClickSave:(id)sender {
    
    float defaultPercentage = [self.defaultPercentTextField.text floatValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:defaultPercentage forKey:@"defaultTip"];
    [defaults synchronize];
    
    NSLog(@"%f",[defaults floatForKey:@"defaultTip"]);
}



@end
