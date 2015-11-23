//
//  ViewController.h
//  Calculator_exercise
//
//  Created by Carlos Sanchez San Segundo on 18/11/15.
//  Copyright © 2015 Carlos Sanchez San Segundo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int total;
    int mode;
    NSString *valueString;
    IBOutlet UILabel *label;
    BOOL lastButtonWasMode;
    
    IBOutlet UILabel *loglabel;
    
}

-(IBAction)tappedClear:(id)sender;
-(IBAction)tappedNumber:(UIButton*)btn;
-(IBAction)tappedPlus:(id)sender;
-(IBAction)tappedMinus:(id)sender;
-(IBAction)tappedEquals:(id)sender;
-(void)setMode:(int)m;



@end

