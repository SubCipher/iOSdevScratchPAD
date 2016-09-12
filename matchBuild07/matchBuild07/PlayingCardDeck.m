//
//  PlayingCardDeck.m
//  matchBuild07
//
//  Created by MacMan on 9/11/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck


-(instancetype)init{
    self = [super init];
    if(self){
        
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank =1; rank <= [PlayingCard maxRank];rank++){
                PlayingCard *card = [[PlayingCard alloc]init];
                if(card){
                    card.rank = rank;
                    card.suit = suit;
                    [self addCard:card];
                }
            }
        }
    }return self;
}
@end
