//
//  ViewController.m
//  Calculator_exercise
//      by Shaped
//
//  Created by Carlos Sanchez San Segundo on 18/11/15.
//  Copyright © 2015 Carlos Sanchez San Segundo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.+
    valueString = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)tappedClear:(id)sender
{
    loglabel.text = @"Hemos pulsado: C";
    valueString = @"";
    label.text = @"0";
    lblconsola.text = @"";
    total = 0;
}



-(IBAction)tappedNumber:(UIButton*)btn
{
    int num = btn.tag;
    loglabel.text = [NSString stringWithFormat: @"Hemos pulsado: %i",num];

    //Si hemos pulsado 0 y seguimos con el total a cero no hacemos nada
    if (num == 0 && total == 0)
    {
        return;
    }


    if (lastButtonWasMode) {
        lastButtonWasMode = NO;
        lblconsola.text = valueString; //registramos el valor en la consola
        if (mode == 1)
            {
            lblconsola.text = [lblconsola.text stringByAppendingString:@" + "];
            }
        if (mode == -1)
        {
            lblconsola.text = [lblconsola.text stringByAppendingString:@" - "];
        }
        valueString = @"";
    }
    
    
    NSString *numAsString = [NSString stringWithFormat: @"%i",num];
    valueString = [valueString stringByAppendingString:numAsString];
    label.text = valueString;
    
    //Almacenamos el total en una variable
    if (total == 0) {
        total = [valueString intValue];
    }
}
-(IBAction)tappedPlus:(id)sender
{
    loglabel.text = @"Hemos pulsado: +";
    [self setMode:(1)];
}

-(IBAction)tappedMinus:(id)sender
{
    loglabel.text = @"Hemos pulsado: -";
    [self setMode:(-1)];
}

-(IBAction)tappedEquals:(id)sender
{
    loglabel.text = @"Hemos pulsado: =";
    lblconsola.text = [lblconsola.text stringByAppendingString:valueString]; //registramos el valor en la consola
    lblconsola.text = [lblconsola.text stringByAppendingString:@" = "];
    if (mode == 0) {
        return;
    }
    if (mode == 1)
        {
            
        loglabel.text = [NSString stringWithFormat: @"tengo %i y voy a añadir %i",total,[valueString intValue]];
        //total = total + [valueString intValue];
        total += [valueString intValue];
            
        }
    else
        {
        loglabel.text = [NSString stringWithFormat: @"tengo %i y voy a restar %i",total,[valueString intValue]];
        //total = total - [valueString intValue];
        total -= [valueString intValue];

        }
    label.text = [NSString stringWithFormat:@"%i",total];
    valueString = label.text;
    lblconsola.text = [lblconsola.text stringByAppendingString:[NSString stringWithFormat:@"%i",total]];

    
}

-(void)setMode:(int)m
{
    if (total == 0) {
        return;
    }
    mode = m;
    lastButtonWasMode = YES;
    total = [valueString intValue];
    
}

@end
