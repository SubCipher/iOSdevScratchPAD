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

    NSLog(@"******* New CardAtIndex *******");
    NSLog(@"                         ");
    NSLog(@"((((((((((  matchCardsCount %lu   )))))))",[self.matchOtherCards count]);
    NSLog(@"    ");
    for(Card *holdCard in self.matchOtherCards){
        NSLog(@"matchOtherCard: %@ | %@",holdCard.contents,holdCard);
                }
    NSLog(@"    ");
    NSLog(@"    ");
    Card *card = [self cardAtIndex:index];
    NSLog(@"cardAtIndex %@ | %@ card isChosen ? %d isMatched? %d",card.contents, card,card.isChosen, card.isMatched);
    NSLog(@"    ");
    NSLog(@"---------------------------------");
    NSLog(@"    ");
   
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else
        {   int cardCounter = 0;
            for(Card *otherCard in self.cards){
              NSLog(@"otherCard.contents: %@ | %@ | isChosen? %d | isMatched? %d : %d",otherCard.contents,otherCard,otherCard.chosen,otherCard.matched,cardCounter++);
                
                if(otherCard.isChosen && !otherCard.isMatched){
                    NSLog(@"otherCard (%@) | %@ is chosen? %d",otherCard.contents,otherCard,otherCard.isChosen);
                    
                    int matchScore = [card match:@[otherCard]];
                   
                    
                    if(matchScore){
                       
                        self.score += matchScore * MATCH_BONUS;
                        
                        if(self.singleOrMultipleMatchOption == 0){
                            NSLog(@"------((  single card matching  )) -----");
                            otherCard.matched = YES;
                            card.matched = YES;
                        }
                        else if(self.singleOrMultipleMatchOption == 1){
                        NSLog(@"------((  multicard card matching  )) -----");
                            
                            if([self.matchOtherCards containsObject:otherCard]){
                                NSLog(@"card match found at otherCard %@",otherCard.contents);

                            }else{
                                [self.matchOtherCards addObject:otherCard];
                            }
                           
                            NSLog(@"---------------------------------");
                            NSLog(@"              ");
                            NSLog(@"matchOtherCards count %lu",[self.matchOtherCards count]);
                            NSLog(@"             ");
                            NSLog(@"---------------------------------");
                            
                            if([self.matchOtherCards count] == 2 ){
                                
                                NSLog(@"if matchOtherCards count == 2: add %@ to ",card.contents);
                                if([self.matchOtherCards containsObject:card]){
                                    NSLog(@"card %@ match found at %@ otherCard",card.contents,otherCard);
                                }else{
                                [self.matchOtherCards addObject:card];
                                }
                                for(Card *matchedCard in self.matchOtherCards){
                                    NSLog(@"matchedCard %@,%@",matchedCard.contents,card);
                                    matchedCard.chosen = YES;
                                    matchedCard.matched = YES;
                                    }
                                    NSLog(@"before removeAllObjects: %lu",[self.matchOtherCards count]);
                                    [self.matchOtherCards removeAllObjects];
                                    NSLog(@"after removeAllObjects: %lu",[self.matchOtherCards count]);
                                    break;
                            }
                           
                        }
                    }//match score ends; now do this for mismatches
                    else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen =NO;
                        [self.matchOtherCards removeAllObjects];
                        
                    }//break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
           
            
            
        }
    }
}

@end