//
//  MatchCardViewController.m
//  matchBuild10
//
//  Created by MacMan on 9/13/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "MatchCardViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface MatchCardViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreMatchLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *flisCardButtons;
@property (strong,nonatomic)CardMatchingGame *game;

@end


@implementation MatchCardViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.flisCardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSInteger chosenButtonIndex = [self.flisCardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
}

-(void)updateUI{
    
    for(UIButton *cardButton in self.flisCardButtons){
        NSInteger cardButtonIndex = [self.flisCardButtons indexOfObject:cardButton];
        
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        self.scoreMatchLabel.text = [NSString stringWithFormat:@"Flip Score %d",self.game.score];
        cardButton.enabled = !card.isChosen;
    }
}

-(NSString *)titleForCard:(Card *)card{
    
    return card.isChosen ? card.contents : @ "";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"subzeroCardBack"];
}
         
@end