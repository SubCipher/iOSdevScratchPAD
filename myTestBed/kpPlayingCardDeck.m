//
//  kpPlayingCardDeck.m
//  myTestBed
//
//  Created by MacMan on 8/23/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "kpPlayingCardDeck.h"
#import "kpPlayingCard.h"

@implementation kpPlayingCardDeck

-(instancetype)init{
    self = [super init];
    
    if(self){
        for(NSString *suit in [kpPlayingCard validSuits]){
            for(NSUInteger rank =1; rank <= [kpPlayingCard maxRank];++rank){
                kpPlayingCard *card = [kpPlayingCard new];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }return self;
}

@end
