//
//  PlayingCard.m
//  matchBuildExtended00
//
//  Created by MacMan on 9/14/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//



#import "PlayingCard.h"

@interface PlayingCard()

@property (nonatomic)int score;

@end

@implementation PlayingCard
@synthesize suit = _suit;

int numberToGuess = 0;

-(int)match:(NSMutableArray *)otherCards{
   
    NSLog(@" NEW SET ");
    NSLog(@"  ");
    NSLog(@" otherCards count: %lu",[otherCards count]);
 
    PlayingCard *otherCard = [otherCards firstObject];
    
    NSLog(@"numberToGuess %d",numberToGuess);
//    if(numberToGuess >= 2){
//        [otherCards removeAllObjects];
//        numberToGuess = 0;
//        }
    
    NSLog(@"firstCard object: %@",otherCard.contents);
    NSLog(@"self.contents %@",self.contents);
    NSLog(@"--------------------");


    
    return self.score;
}

+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSArray *)validSuits{
    
    return @[@"♦️",@"♥️",@"♠️",@"♣️"];
}
-(NSString *)contents{
    
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString *)suit{
    return _suit ? _suit  : @ "?";
}

-(void)setRank:(NSUInteger)rank{
    
    if(rank <[PlayingCard maxRank]){
        _rank = rank;
    }
}

+(NSUInteger)maxRank{
    return [[self rankStrings ]count] -1;
}


@end
