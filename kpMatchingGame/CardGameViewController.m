//
//  CardGameViewController.m
//  kpMatchingGame
//
//  Created by MacMan on 8/28/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardGameViewController.h"
//#import "Deck.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
@property (nonatomic)int flipCount;
@property (strong,nonatomic) Deck *deck;

@end



@implementation CardGameViewController

-(Deck *)deck{
    if(!_deck) _deck = [self createDeck];
    return _deck;

}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
    
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    
    self.flipCountLabel.text = [NSString stringWithFormat:@"FlipCount: %d",self.flipCount];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    if([sender.currentTitle length]){
    [sender setBackgroundImage:[UIImage imageNamed:@"subzeroCardBack"]
                      forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        Card *randomCard = [self.deck drawRandomCard];
    [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"]forState:UIControlStateNormal];
    [sender setTitle:randomCard.contents forState:UIControlStateNormal];

    }
    self.flipCount++;
}



@end
