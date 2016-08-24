//
//  kpPlayingCard.h
//  myTestBed
//
//  Created by MacMan on 8/23/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "kpCard.h"

@interface kpPlayingCard : kpCard

@property (strong,nonatomic)NSString *suit;
@property (nonatomic)NSUInteger rank;


+(NSArray *)validSuits;
+(NSUInteger )maxRank;
@end
