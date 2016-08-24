//
//  kpPlayingCard.m
//  myTestBed
//
//  Created by MacMan on 8/23/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "kpPlayingCard.h"

@implementation kpPlayingCard


-(NSString *)contents{
    NSArray *rankStrings = [kpPlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+(NSArray *)validSuits{
    
    return @[@"♣️",@"♥️",@"♠️",@"♦️"];
}

-(void)setSuit:(NSString *)suit{
    if([[kpPlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *)suit{
    return _suit ? _suit : @"?";
}

+(NSArray *)rankStrings{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger )maxRank {
    return [[self rankStrings]count]-1;
}

-(void)setRank:(NSUInteger )rank{
    if(rank <= [kpPlayingCard maxRank]){
        _rank = rank;
    }
}





@end
