//
//  CardMatchingGame.m
//  TestBedCardMatching
//
//  Created by MacMan on 8/24/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic,readwrite)NSInteger score;
@property (nonatomic,strong)NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;

}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(kpDeck *)deck{

    self = [super init];
    
    if(self){
        for(int i = 0; i < count; i++){
            
            kpCard *card = [deck drawRandomCard];
            
            if(card){
                [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
        }
    }
    return self;
    
}


-
@end
