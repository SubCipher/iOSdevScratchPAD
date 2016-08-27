//
//  CardGameViewController.m
//  TestBedCardMatching
//
//  Created by MacMan on 8/24/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardGameViewController.h"
#import "kpCard.h"
#import "kpPlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()

@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end


@implementation CardGameViewController

-(CardMatchingGame *)game{
    if (!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
                         
    return _game;
    
}

-(kpDeck *)createDeck{
    return [[kpPlayingCardDeck alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
    }
-(void)updateUI{
    
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        kpCard *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
         [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
         cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"score: %ld",(long)self.game.score];
        
    }
    
}

-(NSString *)titleForCard:(kpCard *)card{
             return card.isChosen ? card.contents:@"";

}

-(UIImage *)backgroundImageForCard:(kpCard *)card{
             return [UIImage imageNamed:card.isChosen ? @"CardFront" : @"subzeroCardBack"];
         }
         
    
@end




















