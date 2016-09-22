//
//  CardMatchingGame.m
//  matchBuildExtended00
//
//  Created by MacMan on 9/14/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (strong,nonatomic) NSMutableArray *cards;
@property (strong,nonatomic) NSMutableArray *matchOtherCards;
@property (nonatomic,readwrite) int score;
@end


@implementation CardMatchingGame


//-(void)matchesToMake:(NSInteger)count{
//    self.numberOfMatches = count + 2;
//    NSLog(@"numberOfMatches = %lu",self.numberOfMatches);
//}


-(NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(NSMutableArray *)matchOtherCards{
    if(!_matchOtherCards) _matchOtherCards = [[NSMutableArray alloc]init];
    return _matchOtherCards;
    
}
-(instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self){
      
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else {
                self = nil;
                break;
            }
        }
    }return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    if(self.cards == nil){
        self.score = 0;
        }
    return (index <[self.cards count]) ? self.cards[index] : nil;
}

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index{
    if(self.numberOfMatches){
        
    Card *card = [self cardAtIndex:index];
        if(!card.isChosen){
        NSLog(@"========New Selection==========");
        NSLog(@"    ");
        NSLog(@"cardAtIndex %@ | card isChosen ? %d",card.contents,card.isChosen);
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }
        else{
            for(Card *otherCard in self.cards){
            
                if(otherCard.isChosen && !otherCard.isMatched){
                    NSLog(@"otherCard (%@) is chosen? %d",otherCard.contents,otherCard.isChosen);
                    
                    int matchScore =+ [card match:@[otherCard]];
                    
                    NSLog(@"match this next: new cardAtIndex = %@",card.contents);
                    //int matchScore = [card match:self.matchOtherCards];
                    NSLog(@"matchScore %d",matchScore);
                    NSLog(@"self.score %d",self.score);
                    if(matchScore == 2){
                        NSLog(@"matchScore %d",matchScore);
                        NSLog(@"self.score %d",self.score);
                        self.score += matchScore * MATCH_BONUS;
            
                        otherCard.matched = YES;
                        card.matched = YES;
                }else{
                    self.score -= MISMATCH_PENALTY;
                    otherCard.chosen =NO;
                    
                }
                break;
                }
            }
            }self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
        }
    }
}
@end