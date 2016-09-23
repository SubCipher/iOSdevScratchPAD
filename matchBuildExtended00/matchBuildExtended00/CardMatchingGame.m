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


-(void)matchesToMake:(NSInteger)count{
   // self.cardsToStoreForMatch = 0;
    self.cardsToStoreForMatch = count +1;
    }


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
   
    
    Card *card = [self cardAtIndex:index];
        if(!card.isChosen){
        NSLog(@"******* New Selection*******");
        NSLog(@"    ");
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
                    NSLog(@"cardsToStore in matchOtherCards %lu",(long)self.cardsToStoreForMatch);
                    
                   
                    //int matchScore = [card match:@[otherCard]];
                    if([self.matchOtherCards count] >= self.cardsToStoreForMatch ){
                        [self.matchOtherCards removeAllObjects];
                        //card = nil;
                    }

                    [self.matchOtherCards addObject:otherCard];
                    for(Card *storedCard in self.matchOtherCards){
                        NSLog(@"cards in matchOtherCards array %lu: %@",(unsigned long)[self.matchOtherCards count],storedCard.contents);
                    }

                   
                    int matchScore = [card match:self.matchOtherCards];

                    if(matchScore){
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
            card = nil;
        }
    }
}
@end