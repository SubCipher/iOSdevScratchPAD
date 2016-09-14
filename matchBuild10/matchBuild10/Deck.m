//
//  Deck.m
//  matchBuild10
//
//  Created by MacMan on 9/13/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong,nonatomic) NSMutableArray *deck;

@end

@implementation Deck

-(NSMutableArray *)deck{
    if(!_deck) _deck = [[NSMutableArray alloc]init];
    return _deck;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.deck insertObject:card atIndex:0];
    }else {
        [self.deck addObject:card];
    }
}

-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomeCard{
    Card *randomCard = nil;
    
    unsigned index = arc4random() % [self.deck count];
    if([self.deck count]){
    randomCard = self.deck[index];
    [self.deck removeObjectAtIndex:index];
    
    }return randomCard;
}
@end
