//
//  PlayingCardDeck.m
//  kpMatchingGame
//
//  Created by MacMan on 8/27/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "PlayingCardDeck.h"
@implementation PlayingCardDeck

-(instancetype)init{
    self = [super init];
    
    if(self) {
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank =1; rank <=[PlayingCard maxRank];++rank){
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
        
        
    }
    return self;
}
@end
