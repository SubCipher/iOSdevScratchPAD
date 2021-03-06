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


-(void)resetMatchedCardsArray{
    [self.matchOtherCards removeAllObjects];
}

-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else
        {
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        
                        if(self.singleOrMultipleMatchOption == 0){
                            otherCard.matched = YES;
                            card.matched = YES;
                        }
                        else if(self.singleOrMultipleMatchOption == 1){
                            //"------((  multicard card matching  )) -----
                            
                            [self.matchOtherCards addObject:otherCard];
                            
                            if([self.matchOtherCards count] == 2 ){
                                
                                if([self.matchOtherCards containsObject:card]){
                                    NSLog(@"card %@ match found at %@ otherCard",card.contents,otherCard);
                                }else{
                                    [self.matchOtherCards addObject:card];
                                }
                                for(Card *matchedCard in self.matchOtherCards){
                                    
                                    matchedCard.chosen = YES;
                                    matchedCard.matched = YES;
                                }[self resetMatchedCardsArray];
                                break;
                                
                            }

                            
                        }
                    }//match score ends; now do this for mismatches
                    else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen =NO;
                        [self resetMatchedCardsArray];
                        
                    }//break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end