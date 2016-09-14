//
//  ViewController.m
//  matchBuild09
//
//  Created by MacMan on 9/12/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *flipCardButtons;
@property (strong,nonatomic)CardMatchingGame *game;


@end


@implementation ViewController

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.flipCardButtons count] usingDeck:[self createDeck]] ;
    return _game;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];

}


- (IBAction)flipCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.flipCardButtons indexOfObject:sender];
    
    [self.game chooseCardAtIndex: chosenButtonIndex];
    [self updateUI];
   
   }

-(void)updateUI{
    
    for(UIButton *cardButton in self.flipCardButtons){
        
        NSUInteger cardButtonIndex = [self.flipCardButtons indexOfObject:cardButton];
        
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
         NSLog(@"%@",self.flipCardButtons[cardButtonIndex]);
    }
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}


-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"subzeroCardBack"];
}
@end

