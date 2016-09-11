//
//  CardMatchViewController.m
//  matchGame06
//
//  Created by MacMan on 9/9/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchViewController.h"
#import "PlayingCardDeck.h"

@interface CardMatchViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
@property(strong,nonatomic)Deck *cardDeck;
@property(nonatomic)int flipCounter;

@end

@implementation CardMatchViewController


-(Deck *)cardDeck{
    if(!_cardDeck) _cardDeck = [self createDeck];
    return _cardDeck;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];

}

-(void)setFlipCounter:(int)flipCounter{
    _flipCounter = flipCounter;
    self.flipCountLabel.text = [NSString stringWithFormat:@"Flip Count: %d",self.flipCounter];
}

- (IBAction)flipCardButton:(UIButton *)sender {
    
    if([sender.currentTitle length]){
    [sender setBackgroundImage:[UIImage imageNamed:@"subzeroCardBack"] forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCounter++;
    }else{
        
        Card *randomCard = [self.cardDeck drawRandomCard];
        if(randomCard){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
        [sender setTitle:randomCard.contents forState:UIControlStateNormal];
       
        }
    } self.flipCounter++;
}

@end
