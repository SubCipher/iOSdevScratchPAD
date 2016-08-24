//
//  kpDeck.m
//  myTestBed
//
//  Created by MacMan on 8/22/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "kpDeck.h"

@interface kpDeck()

@property (strong,nonatomic) NSMutableArray *cards;

@end


@implementation kpDeck

-(NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(void)addCard:(kpCard *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }
    else {
        [self.cards addObject:card];
    
    }
}

-(void)addCard:(kpCard *)card{
    
    [self addCard:card atTop:NO];
}


-(kpCard *)drawRandomCard{
    
    kpCard *randomCard = nil;
    
    if([self.cards count]){
    unsigned index = arc4random() % [self.cards count];
   
    
    randomCard = self.cards[index];
    [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
    
}

    
@end











