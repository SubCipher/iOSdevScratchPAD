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
    return (index <[self.cards count]) ? self.cards[index] : nil;
}

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;


-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];

    if(!card.isMatched){
        
        if(card.isChosen){
            card.chosen = NO;
        }
        
        else{
            
            for(Card *otherCard in self.cards){
               
                  if(otherCard.isChosen && !otherCard.isMatched){
                    NSLog(@"     ");
                    NSLog(@"     ");
                    NSLog(@"----Start Call match method \"[card match:@[otherCard]]\" from CardMatchingGame.m ------");
                    NSLog(@"     ");
                    NSLog(@"(otherCard)memory address = %@ || otherCard.contents = %@ ||",otherCard,otherCard.contents);

                    NSLog(@"     ");
                    NSLog(@"(cardAtIndex)memory address = %@ || card.contents = %@ || chosenCardIndex = %lu ",card,card.contents,index);
                    NSLog(@"     ");
                    NSLog(@"     ");
                      
                      int matchScore = [card match:@[otherCard]];
                      
                        if(matchScore){
                            self.score += matchScore * MATCH_BONUS;
                            otherCard.matched = YES;
                            card.matched = YES;
                        }else{
                            self.score -= MISMATCH_PENALTY;
                            otherCard.chosen =NO;
                        }break;
                }
            }self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
        }

    }
}

@end