//
//  CardMatchingGame.m
//  matchBuild03
//
//  Created by MacMan on 9/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property(nonatomic,readwrite)int score;
@property(strong,nonatomic)NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{
 
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
    
}


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    
    self = [super init];
    
    if(self){
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if(card){
            [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
    
}


static const int MISMATCH_PENALTY =2;
static const int MATCH_BONUS =4;
static const int COST_TO_CHOOSE =1;

-(void)choseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }
        else {
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchSore = [card match:@[otherCard]];
                    if(matchSore){
                        self.score += matchSore*MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                        
                    }else{
                        self.score = MISMATCH_PENALTY;
                        otherCard.chosen =NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
                    }
                }
            }
@end














