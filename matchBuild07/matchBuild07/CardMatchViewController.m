//
//  CardMatchViewController.m
//  matchBuild07
//
//  Created by MacMan on 9/11/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardMatchViewController ()
@property(strong,nonatomic)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *touchCardButtons;
@property (weak, nonatomic) IBOutlet UILabel *matchScoreLabel;


@end

@implementation CardMatchViewController


-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}



-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.touchCardButtons count] usingDeck:[self createDeck]];
    return _game;
}



- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSInteger chosenButtonIndex = [self.touchCardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
  

}

-(void)updateUI{
    for(UIButton *cardButton in self.touchCardButtons){
        NSInteger cardButtonIndex = [self.touchCardButtons indexOfObject:cardButton];
        Card *card= [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled =!card.isMatched;
        self.matchScoreLabel.text = [NSString stringWithFormat:@"Match Score: %ld",(long)self.game.score];
    }
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"subzeroCardBack"];
}


@end









