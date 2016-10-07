//
//  CardMatchViewController.m
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"



@interface CardMatchViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *flipCardButtonCollection;
@property(strong,nonatomic)CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *matchScoreLabel;
@property(nonatomic)int score;

@property(strong,nonatomic)Deck *deck;


@end

@implementation CardMatchViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
    
}

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.flipCardButtonCollection count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    return nil;
}

- (IBAction)flipCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.flipCardButtonCollection indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];

}

-(IBAction)segmentedControlAction:(UISegmentedControl *)sender{
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.game.singleOrMultipleOption = 0;
            break;
        case 1:
            self.game.singleOrMultipleOption = 1;
            break;
            
        default:
            self.game.singleOrMultipleOption = [self.game singleOrMultipleOption];
            break;
    }
}

-(IBAction)resetButton:(UIButton *)sender{
    self.game = nil;
    [self updateUI];
}

-(void)updateUI{
    for(UIButton *cardButton in self.flipCardButtonCollection){
        NSInteger cardButtonIndex = [self.flipCardButtonCollection indexOfObject:cardButton];
        
        Card *card= [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
    }self.matchScoreLabel.text = [NSString stringWithFormat:@"Match Score: %d",self.game.score];
}


-(NSString *)titleForCard:(Card *)card{
    return card.chosen ? card.contents :@" ";
    
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" :@"cardBack"];
    
}


@end
