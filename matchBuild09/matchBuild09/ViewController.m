//
//  ViewController.m
//  matchBuild09
//
//  Created by MacMan on 9/12/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
@property (nonatomic)int flipCounter;
@property (strong,nonatomic)Deck *deck;
@end

@implementation ViewController

-(Deck *)deck{
    if(!_deck) _deck = [self createDeck];
    return _deck;
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
         Card *randomCard = [self.deck drawRandomCard];
        if(randomCard){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
        [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        self.flipCounter++;
        }
    }
}

@end
