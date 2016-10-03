//
//  TextStatsViewController02.m
//  Attributor02
//
//  Created by MacMan on 10/2/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "TextStatsViewController02.h"

@interface TextStatsViewController02 ()

@property(weak,nonatomic)IBOutlet UILabel *outlineLabelCount;
@property(weak,nonatomic)IBOutlet UILabel *colorfulLabelCount;

@end

@implementation TextStatsViewController02

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}


-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if(self.view.window){
        [self updateUI];
    }
}

-(void)updateUI{
    self.outlineLabelCount.text = [NSString stringWithFormat:@"%lu Outline characters",[[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    
    self.colorfulLabelCount.text = [NSString stringWithFormat:@"%lu Colorful characters",[[self charactersWithAttribute: NSStrokeWidthAttributeName] length]];
    
}


-(NSAttributedString *)charactersWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    long index = 0;
    while(index < [self.textToAnalyze length]){
        NSRange range;
        id(value) = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }
        else{
            index++;
            
        }
    }return characters;
    }

@end
