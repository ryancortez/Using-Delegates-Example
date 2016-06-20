//
//  ViewController.h
//  Delegates
//
//  Created by Ryan Cortez on 6/20/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSNAutoFormatHandler.h"

@interface ViewController : UIViewController <UITextFieldDelegate, SSNAutoFormatHandler>


@end

