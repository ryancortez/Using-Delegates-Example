//
//  SSNAutoFormatHandler.h
//  Delegates
//
//  Created by Ryan Cortez on 6/20/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SSNAutoFormatHandler <NSObject>

- (void) textFieldDidEnterSSN: (NSString *) ssn;

@end
