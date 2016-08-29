//
//  Deck.h
//  kpMatchingGame
//
//  Created by MacMan on 8/26/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;


-(Card *)drawRandomCard;


@end
