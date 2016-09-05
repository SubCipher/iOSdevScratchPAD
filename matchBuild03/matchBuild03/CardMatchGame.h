//
//  CardMatchGame.h
//  matchBuild03
//
//  Created by MacMan on 9/3/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCardDeck.h"

@interface CardMatchGame : NSObject

@property(nonatomic,readonly)NSInteger score;

-(instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck;

-(void)choseCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;


@end
