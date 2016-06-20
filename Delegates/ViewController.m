//
//  ViewController.m
//  Delegates
//
//  Created by Ryan Cortez on 6/20/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

#pragma mark - Properties

// Main text input for the App
@property (weak, nonatomic) IBOutlet UITextField *textField;

// All switches in the App
@property (weak, nonatomic) IBOutlet UISwitch *beginEditingSwitchOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *endEditingSwitchOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *changeCharactersInRangeSwitchOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *clearSwitchOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *returnSwitchOutlet;
@end

#pragma mark -

@implementation ViewController


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Bring up the keyboard when the App launches
    [self.textField becomeFirstResponder];
}


#pragma mark - UITextFieldDelegate

// For every UITextFieldDelegate method, print a NSLog to the console with the method name

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.beginEditingSwitchOutlet.isOn){
    NSLog(@"textFieldShouldBeginEditing");
    }
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.endEditingSwitchOutlet.isOn){
        NSLog(@"textFieldDidEndEditing");
    }
}

-(BOOL)textFieldShouldClear:(UITextField *)textField {
    if (self.clearSwitchOutlet.isOn){
        NSLog(@"textFieldShouldClear");
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.returnSwitchOutlet.isOn){
        NSLog(@"textFieldShouldReturn");
    }
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (self.changeCharactersInRangeSwitchOutlet.isOn) {
        NSLog(@"shouldChangeCharactersInRange");
    }
    
    // Finds Social Security Number in format "nnn-nn-nnnn"
    NSRange r;
    NSString *regEx = @"[0-9]{3}-[0-9]{2}-[0-9]{4}";
    r = [self.textField.text rangeOfString:regEx options:NSRegularExpressionSearch];
    
    // When a Social Security Number is found
    if (r.location != NSNotFound) {
        [self textFieldDidEnterSSN:[self.textField.text substringWithRange:r]];
    }
    
    return YES;
}


#pragma mark - SSNAutoFormatHandler

// Called when a Social Security Number is found
- (void) textFieldDidEnterSSN:(NSString *) ssn {
    NSLog(@"textFieldDidEnterSSN has been called, the Social Security Number is %@", ssn);
}

@end
