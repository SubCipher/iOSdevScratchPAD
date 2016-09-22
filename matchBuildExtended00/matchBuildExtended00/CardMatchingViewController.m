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
   //[ self.game matchesToMake:sender.selectedSegmentIndex];
    self.game.numberOfMatches = sender.selectedSegmentIndex;
    
    switch(sender.selectedSegmentIndex){
        case 0:
            self.segmentActionToTake.text = @"OFF";
            break;
        case 1:
        self.segmentActionToTake.text = @"2 card match";
            break;
        case 2:
            self.segmentActionToTake.text = @"3 card match";
            break;
        default:
            self.segmentActionToTake.text =@"enter number of matches";
            break;
    }
}

- (IBAction)switchMatchMode:(UISwitch *)sender {
    
    if(sender.isOn){
        NSLog(@"the switch is on");

        } else{
            NSLog(@"the switch is off");
            }
}


- (IBAction)resetButton:(UIButton *)sender {
    self.game = nil;
    self.game.numberOfMatches = [self.touchCardButtons count];
    NSLog(@"cardButtons reset count %lu",[self.touchCardButtons count]);
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
   
   NSLog(@"card.contents: %@",card.contents);
       return card.isChosen ? card.contents : @"";

}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}


@end
