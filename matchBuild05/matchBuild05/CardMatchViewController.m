//
//  CardMatchViewController.m
//  matchBuild05
//
//  Created by MacMan on 9/7/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface CardMatchViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *flipCardButtons;

@property(nonatomic)int score;
@property(strong,nonatomic)CardMatchingGame *game;

@end

@implementation CardMatchViewController

-(void)setScore:(int)score{
    _score = score;
    
}


-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.flipCardButtons count] usingDeck:[self createDeck]];
                        return _game;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];

}

- (IBAction)flipCardButton:(UIButton *)sender {
   
    NSInteger chosenButtonIndex = [self.flipCardButtons indexOfObject:sender];
    [self.game choseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(void)updateUI{
    for(UIButton *cardButton in self.flipCardButtons){
        NSInteger cardButtonIndex = [self.flipCardButtons indexOfObject:cardButton];
        
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
         cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    }
         }


-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
         }
 -(UIImage *)backgroundImageForCard:(Card *)card{
             return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"subzeroCardBack" ];
         }

@end