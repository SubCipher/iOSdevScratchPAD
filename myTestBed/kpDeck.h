//
//  kpDeck.h
//  myTestBed
//
//  Created by MacMan on 8/22/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "kpCard.h"

@interface kpDeck : NSObject

-(void)addCard:(kpCard *)card atTop:(BOOL)atTop;
-(void)addCard:(kpCard *)card;

-(kpCard *)drawRandomCard;



@end
