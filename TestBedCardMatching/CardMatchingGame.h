//
//  CardMatchingGame.h
//  TestBedCardMatching
//
//  Created by MacMan on 8/24/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "kpCard.h"
#import "kpDeck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(kpDeck *)deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(kpCard *)cardAtIndex: (NSUInteger)index;

@property (nonatomic,readonly)NSInteger score;
@end
