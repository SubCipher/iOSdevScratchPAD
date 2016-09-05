//
//  CardMatchingGame.h
//  matchBuild02
//
//  Created by MacMan on 9/1/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic,readonly)NSInteger score;

-(void)choseCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;


@end
