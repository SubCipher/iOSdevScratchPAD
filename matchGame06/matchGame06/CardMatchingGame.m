//
//  CardMatchingGame.m
//  matchGame06
//
//  Created by MacMan on 9/10/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property(nonatomic,readwrite)NSInteger score;
@property(strong,nonatomic)NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    
    self = [super init];
    if(self){
        for(int i = 0; i <= count; i++){
            Card *card = [deck drawRandomCard];
            //if([self.cards count]){
            if(card){
            [self.cards addObject:card];
        }else{
            self = nil;
            break;
        }
        
        }
        
        
    }return self;
}

@end
