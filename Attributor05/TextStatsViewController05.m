//
//  TextStatsViewController05.m
//  Attributor05
//
//  Created by MacMan on 10/4/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "TextStatsViewController05.h"

@interface TextStatsViewController05 ()

@property(weak,nonatomic)IBOutlet UILabel *outlineStats;
@property(weak,nonatomic)IBOutlet UILabel *colorfulStats;


@end

@implementation TextStatsViewController05

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
    self.outlineStats.text = [NSString stringWithFormat:@"%lu outline stats",[[self charactersWithAttribute:NSStrokeWidthAttributeName]length]];
    
    self.colorfulStats.text = [NSString stringWithFormat:@"%lu colorful stats",[[self charactersWithAttribute:NSForegroundColorAttributeName]length]];
    
}


-(NSAttributedString *)charactersWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    
    long index = 0;
    while (index < [self.textToAnalyze length]){
        NSRange range;
        id (value) = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }else{
            index++;
            
        }
        
    }return characters;
}
@end















