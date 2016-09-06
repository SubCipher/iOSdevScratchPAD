//
//  CardMatchingGame.h
//  matchBuild03
//
//  Created by MacMan on 9/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"


@interface CardMatchingGame : NSObject

@property(nonatomic,readonly)int score;

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void)choseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;



@end
