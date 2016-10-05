//
//  AttributorViewController05.m
//  Attributor05
//
//  Created by MacMan on 10/4/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "AttributorViewController05.h"
#import "TextStatsViewController05.h"

@interface AttributorViewController05 ()

@property(weak,nonatomic)IBOutlet UITextView *bodyText;
@property(weak,nonatomic)IBOutlet UIButton *outlineButtton;
@property(weak,nonatomic)IBOutlet UILabel *headlineLabel;



@end

@implementation AttributorViewController05

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupOutlineButton];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(prefrerredFontsDidChange:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"textToAnalyzeSegue"]){
        if([segue.destinationViewController isKindOfClass:[TextStatsViewController05 class]]){
            TextStatsViewController05 *tsvc = (TextStatsViewController05 *)segue.destinationViewController;
            tsvc.textToAnalyze = self.bodyText.textStorage;
            
            
        }
    }
}



-(void)usePreferredFonts{
    self.bodyText.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headlineLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

-(void)prefrerredFontsDidChange:(NSNotification *)notification{
    [self usePreferredFonts];
    
}

-(void)setupOutlineButton{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outlineButtton.currentTitle];
    
    [title setAttributes:@{ NSStrokeWidthAttributeName:@3,
                            NSStrokeWidthAttributeName:self.outlineButtton.tintColor}
                   range:NSMakeRange(0, [title length])];
    
    
    [self.outlineButtton setAttributedTitle:title forState:UIControlStateNormal];
}


-(IBAction)changeTextColorButtton:(UIButton *)sender{
    
    [self.bodyText.textStorage addAttribute:NSForegroundColorAttributeName
                                      value:sender.backgroundColor
                                      range:self.bodyText.selectedRange];
    
}


-(IBAction)outlineButton:(UIButton *)sender{
    [self.bodyText.textStorage addAttributes:@{ NSStrokeWidthAttributeName:@-3,
                                                NSStrokeWidthAttributeName:[UIColor blueColor]}
                                       range:self.bodyText.selectedRange];
    
}



@end
