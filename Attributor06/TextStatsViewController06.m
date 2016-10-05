//
//  TextStatsViewController06.m
//  Attributor06
//
//  Created by MacMan on 10/4/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "TextStatsViewController06.h"

@interface TextStatsViewController06 ()

@property(weak,nonatomic)IBOutlet UILabel *outlineLabel;
@property(weak,nonatomic)IBOutlet UILabel *colorfulLabel;


@end

@implementation TextStatsViewController06


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
    self.outlineLabel.text = [NSString stringWithFormat:@"%lu outline characters",[[self charactersWithAttribute:NSStrokeWidthAttributeName]length]];
    
    self.colorfulLabel.text = [NSString stringWithFormat:@"%lu colorful characters",[[self charactersWithAttribute: NSForegroundColorAttributeName]length]];
    
}



-(NSMutableAttributedString *)charactersWithAttribute:(NSString *)attributeName{
 
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    
    long index = 0;
    while(index < [self.textToAnalyze length]){
        NSRange range;
        id (value)= [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }else{
            index++;
        }
    }return characters;
}



@end
