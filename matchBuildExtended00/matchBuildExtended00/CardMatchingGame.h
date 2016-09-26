//
//  CardMatchingGame.h
//  matchBuildExtended00
//
//  Created by MacMan on 9/14/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck;

-(Card *)cardAtIndex:(NSUInteger)index;
-(void)chooseCardAtIndex:(NSUInteger)index;
//-(void)matchesToMake:(NSInteger)count;

@property (nonatomic) NSInteger singleOrMultipleMatchOption;
@property (nonatomic,readonly) int score;

@end
