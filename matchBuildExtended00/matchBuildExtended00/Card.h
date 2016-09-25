//
//  Card.h
//  matchBuildExtended00
//
//  Created by MacMan on 9/14/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;

@property (nonatomic,getter=isMatched)BOOL matched;
@property (nonatomic,getter=isChosen)BOOL chosen;

-(int)match:(NSArray *)otherCards;

@end
