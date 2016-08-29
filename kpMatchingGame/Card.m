//
//  Card.m
//  kpMatchingGame
//
//  Created by MacMan on 8/26/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Card.h"


@implementation Card

-(NSArray *)otherCards{
    NSArray *otherCards = [[NSArray alloc]init];
    
    return otherCards;
}

-(int)match:(NSArray *)otherCards{
    int score = 0;
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score =1;
        }
        
    }
    
    return score;
}

@end

