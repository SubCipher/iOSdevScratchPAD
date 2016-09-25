//
//  CardMatchingViewController.m
//  matchBuildExtended00
//
//  Created by MacMan on 9/15/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchingViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardMatchingViewController ()

//@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlOutlet;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *touchCardButtons;

@property (weak, nonatomic) IBOutlet UILabel *matchScoreLabel;
@property (nonatomic)int score;
@property (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *segmentActionToTake;

@end

@implementation CardMatchingViewController


-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.touchCardButtons count] usingDeck:[self createDeck]];
    
    return _game;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
    
}

- (IBAction)touchCardBiutton:(UIButton *)sender {
    
    NSInteger chosenCardIndex = [self.touchCardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenCardIndex];
    [self updateUI];
   
}


- (IBAction)segmentedControlAction:(UISegmentedControl *)sender {

    
    switch(sender.selectedSegmentIndex){
        case 0:
            self.segmentActionToTake.text = @"Reg Match";
            self.game.cardsToStoreForMatch = 0;
            break;
        case 1:
        self.segmentActionToTake.text = @"Super Match";
            self.game.cardsToStoreForMatch = 1;
            break;
        default:
            self.segmentActionToTake.text =@"enter number of matches";
            self.game.cardsToStoreForMatch = [self.game cardsToStoreForMatch];
            break;
    }
}


- (IBAction)resetButton:(UIButton *)sender {
    self.game = nil;
    NSLog(@"cardButtons reset count %lu",(unsigned long)[self.touchCardButtons count]);
    
    [self updateUI];
}

-(void)updateUI{

   for(UIButton *cardButton in self.touchCardButtons){
      NSInteger cardButtonIndex = [self.touchCardButtons indexOfObject:cardButton];
    
       /*display playing card from playing card deck created with initWithCardCount::
        in cardMatchingGame.h  */
       
       Card *card = [self.game cardAtIndex:cardButtonIndex];
       

       
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.matchScoreLabel.text = [NSString stringWithFormat:@"Match Score: %d",self.game.score];
   }
   
    
}


-(NSString *)titleForCard:(Card *)card{
    NSLog(@"( cards on screen-- card.contents: %@ | %@ | isChosen? %d | isMatched? %d",card.contents,card,card.chosen,card.matched);
       return card.isChosen ? card.contents : @"";

}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}


@end
