//
//  TextStatsViewController04.m
//  Attributor04
//
//  Created by MacMan on 10/4/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "TextStatsViewController04.h"

@interface TextStatsViewController04 ()
@property(weak,nonatomic)IBOutlet UILabel *outlineStatsLabel;
@property(weak,nonatomic)IBOutlet UILabel *colorfulStatsLabel;


@end

@implementation TextStatsViewController04


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void)setTextToAnalyze:(NSMutableAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if(self.view.window){
        [self updateUI];
    }
}

-(void)updateUI{
    
    self.colorfulStatsLabel.text = [NSString stringWithFormat:@"%lu colorful characters",[[self charactersWithAttribute:NSForegroundColorAttributeName]length]];
    
    self.outlineStatsLabel.text =[NSString stringWithFormat:@"%lu outline characters",[[self charactersWithAttribute:NSStrokeWidthAttributeName]length]];
                                    
                                    
                                    }
-(NSAttributedString *)charactersWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    
    long index =0;
    while(index <[self.textToAnalyze length]){
        NSRange range;
        id(value) = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }else{
            index++;
        }
    } 
    
    return characters;
}
@end
