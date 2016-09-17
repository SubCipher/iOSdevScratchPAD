//
//  CardMatchViewController.m
//  matchBuild08
//
//  Created by MacMan on 9/12/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface CardMatchViewController ()
@property (weak, nonatomic) IBOutlet UILabel *matchScoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *touchCardButtons;
@property (strong,nonatomic)CardMatchingGame *game;

@end

@implementation CardMatchViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.touchCardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.touchCardButtons indexOfObject:sender];
    
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    }

-(void)updateUI{
    for(UIButton *cardButton in self.touchCardButtons){
        
        NSInteger cardButtonIndex = [self.touchCardButtons indexOfObject: cardButton];
        
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.matchScoreLabel.text = [NSString stringWithFormat:@"Match Score: %ld",(long)self.game.score];
        
        NSLog(@"%@",self.touchCardButtons[cardButtonIndex]);
    }
}


-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"subzeroCardBack"];

}

@end