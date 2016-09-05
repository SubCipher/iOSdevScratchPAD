//
//  CardGameViewController.m
//  matchBuild02
//
//  Created by MacMan on 8/29/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

//@property (strong,nonatomic)PlayingCardDeck *deck;

@end


@implementation CardGameViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
    
}


-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}



-(IBAction)flipTouchCard:(UIButton*)sender{
    
    unsigned long chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game choseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
}

-(void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        
        unsigned long cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
     
    }
    
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents: @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"subzeroCardBack"];
}
@end

