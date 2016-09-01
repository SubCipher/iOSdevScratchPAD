//
//  CardGameViewController.m
//  matchBuild02
//
//  Created by MacMan on 8/29/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipLabelText;
@property (nonatomic)int flipCount;
@property (strong,nonatomic)PlayingCardDeck *deck;


@end


@implementation CardGameViewController

-(PlayingCardDeck *)deck{
    if(!_deck) _deck = [self createDeck];
    return _deck;
}

-(PlayingCardDeck *)createDeck{
    return [PlayingCardDeck new];
}


-(void)setFlipCount:(int)flipCount{
    
    _flipCount = flipCount;
    self.flipLabelText.text = [NSString stringWithFormat:@"Flip Count %d",self.flipCount];
}


-(IBAction)flipTouchCard:(UIButton*)sender{
    if([sender.currentTitle length]){
        
    [sender setBackgroundImage:[UIImage imageNamed:@"subzeroCardBack"] forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else {
        Card *randomCard = [self.deck drawRandomCard];
    [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
    [sender setTitle:randomCard.contents forState:UIControlStateNormal];
}
    
    self.flipCount++;
}


@end