//
//  CardGameViewController.m
//  matchBuild02
//
//  Created by MacMan on 8/29/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *touchCardFlipLabel;
@property (nonatomic)int flipCount;

@end



@implementation CardGameViewController
- (IBAction)touchCardButton:(UIButton *)sender {
    
    [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
    [sender setTitle:@"A♦️" forState:UIControlStateNormal];
    
    
}


@end
