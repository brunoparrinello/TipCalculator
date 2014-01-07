//
//  TipViewController.m
//  tipCalculator
//
//  Created by Bruno Parrinello on 1/6/14.
//  Copyright (c) 2014 Bruno Parrinello. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"


@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;
- (IBAction)onValueChange:(id)sender;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Bruno's Tip Calc";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"view did load");
    [self updateValues];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    
    float billAmount = [self.billTextField.text floatValue];
    
    float tipAmount = billAmount * [self.tipPercentTextField.text floatValue]/100;
    //NSArray *tipValues = @[@(0.1), @(0.15), @(0.18), @(0.2)];
    //float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex]floatValue];
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];

}

- (void)onSettingsButton {
    [self.view endEditing:YES];
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (IBAction)onValueChange:(id)sender {
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float floatValue = [defaults floatForKey:@"defaultTip"];
    
    self.tipPercentTextField.text = [NSString stringWithFormat:@"%0.0f", floatValue];
}

- (void)viewDidAppear:(BOOL)animated {
    [self updateValues];
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

@end
