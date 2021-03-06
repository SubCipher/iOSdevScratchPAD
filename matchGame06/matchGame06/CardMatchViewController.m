//
//  CardMatchViewController.m
//  matchGame06
//
//  Created by MacMan on 9/9/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardMatchViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *touchCardButtons;
@property (strong,nonatomic)Deck *deck;

@property(strong,nonatomic)CardMatchingGame *game;
@end

@implementation CardMatchViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.touchCardButtons count] usingDeck:[self createDeck]];
    return _game;
                        
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];

}

- (IBAction)flipCardButton:(UIButton *)sender {
    NSInteger chosenButtonIndex = [self.touchCardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
    
}

-(void)updateUI{
    for(UIButton *cardButton in self.touchCardButtons){
        NSInteger cardButtonIndex = [self.touchCardButtons indexOfObject:cardButton];
        
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage: [self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled =!card.isMatched;}
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"subzeroCardBack"];
    
}
@end
