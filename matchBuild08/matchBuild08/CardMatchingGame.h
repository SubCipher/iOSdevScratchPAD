//
//  CardMatchingGame.h
//  matchBuild08
//
//  Created by MacMan on 9/12/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property(nonatomic,readonly)NSInteger score;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

@end
