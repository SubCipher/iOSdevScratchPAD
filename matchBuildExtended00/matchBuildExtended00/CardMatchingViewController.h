//
//  CardMatchingViewController.h
//  matchBuildExtended00
//
//  Created by MacMan on 9/15/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//
//mandatory abstract class required for implementation


#import <UIKit/UIKit.h>
#import "Deck.h"


@interface CardMatchingViewController : UIViewController

//protected for subclasses
-(Deck *)createDeck; //abstract

@end
