//
//  CardGameViewController.m
//  TestBedCardMatching
//
//  Created by MacMan on 8/24/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardGameViewController.h"
#import "kpCard.h"
#import "kpPlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (strong,nonatomic)kpDeck *myDeck;

@end


@implementation CardGameViewController

-(kpDeck *)myDeck{
    if(!_myDeck) _myDeck = [self createDeck];
    return _myDeck;
}


-(kpDeck *)createDeck{
    return [[kpPlayingCardDeck alloc]init];
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flip Count: %d",self.flipCount];
}
- (IBAction)touchCardButton:(UIButton *)sender {
    
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"subzeroCardBack"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:(UIControlStateNormal)];
    }
    else{
        kpCard *randomCard = [self.myDeck drawRandomCard];
        if(randomCard){
        [sender setBackgroundImage:[UIImage imageNamed:@"CardFront"] forState:UIControlStateNormal];
        [sender setTitle:randomCard.contents forState:(UIControlStateNormal)];
        }
        
        }
    self.flipCount++;
    }


@end




















