//
//  CardGameViewController.m
//  matchBuild03
//
//  Created by MacMan on 9/3/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipCouintLabel;
@property (nonatomic)int flipCounter;

@end
@implementation CardGameViewController

-(void)setFlipCounter:(int)flipCounter{
    _flipCounter = flipCounter;
    self.flipCouintLabel.text = [NSString stringWithFormat:@"Flip Count: %d",self.flipCounter];
}

- (IBAction)flipCardTouch:(UIButton *)sender {
    if([sender.currentTitle length]){
    [sender setBackgroundImage:[UIImage imageNamed:@"subzeroCardBack"] forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCounter++;
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
        [sender setTitle:@"A" forState:UIControlStateNormal];
        
        self.flipCounter++;
     }

    
}




@end
