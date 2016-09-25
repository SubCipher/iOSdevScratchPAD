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



        NSLog(@"******* New CardAtIndex *******");
        NSLog(@"    ");
        NSLog(@"cardAtIndex %@ | %@ card isChosen ? %d isMatched? %d",card.contents, card,card.isChosen, card.isMatched);

    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }
    else{
            
        for(Card *otherCard in self.cards){
            NSLog(@"otherCard.contents: %@ | %@ | isChosen? %d | isMatched? %d",otherCard.contents,otherCard,otherCard.chosen,otherCard.matched);
                
            if(otherCard.isChosen && !otherCard.isMatched){
                NSLog(@"otherCard (%@) | %@ is chosen? %d",otherCard.contents,otherCard,otherCard.isChosen);
                  
                  
                int matchScore = [card match:@[otherCard]];
                    

                if(matchScore){
                        [self.matchOtherCards addObject:otherCard];
                        self.score += matchScore * MATCH_BONUS;
                        
                        /* -----------((  single card matching  ))) ---------*/
                        
                    if(self.cardsToStoreForMatch == 0){
                        
                        NSLog(@"0::cardsToStoreForMatch = %lu",self.cardsToStoreForMatch);
                        otherCard.matched = YES;
                        card.matched = YES;
        
                            /* -----------((  multiCard matching  ))) ---------*/
                            
                    }else if(self.cardsToStoreForMatch == 1){
                        NSLog(@"1::cardsToStoreForMatch = %lu ",self.cardsToStoreForMatch);
                        [self.matchOtherCards addObject:card];
                        NSLog(@"matchOtherCards count %lu",[self.matchOtherCards count]);
                            
                            
                        if([self.matchOtherCards count] > 1){
                                
                            for(Card *holdCard in self.matchOtherCards){
                                    NSLog(@"hold card = %@ |%@ ",holdCard.contents,holdCard);
                                    holdCard.matched = YES;
                                    holdCard.chosen = YES;
                                    
                                    }
                                }
                            }
                    else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen =NO;
                        
                        }
                    //break;
                    }
                }
            }  self.score -= COST_TO_CHOOSE;
                card.chosen = YES;
                NSLog(@"end run cardAtIndex %@,isChosen %@ | %d",card.contents,card,card.isChosen);
            
        }
    }
}

@end