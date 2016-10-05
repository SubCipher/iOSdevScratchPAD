//
//  AttributorViewController04.m
//  Attributor04
//
//  Created by MacMan on 10/3/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "AttributorViewController04.h"
#import "TextStatsViewController04.h"
@interface AttributorViewController04 ()

@property(weak,nonatomic)IBOutlet UITextView *textBody;
@property(weak,nonatomic)IBOutlet UIButton *outlineButton;
@property(weak,nonatomic)IBOutlet UILabel *headline;


@end

@implementation AttributorViewController04


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{ if([segue.identifier isEqualToString:@"textToAnalyzeSegue"]){
    if([segue.destinationViewController isKindOfClass:[TextStatsViewController04 class]]){
        TextStatsViewController04 *tsvc = (TextStatsViewController04 *)segue.destinationViewController;
        tsvc.textToAnalyze = self.textBody.textStorage;
        
    }
}
    
}


-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupOutlineButton];
}


-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFonts];
}

-(void)usePreferredFonts{
    self.textBody.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(preferredFontsChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(void)setupOutlineButton{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]init];
    
    [title setAttributes:@{ NSStrokeWidthAttributeName:@-3,
                            NSStrokeColorAttributeName:self.outlineButton.tintColor
                            }
     
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
    
}


-(IBAction)outlineButton:(UIButton *)sender{
    
    [self.textBody.textStorage addAttributes:@{NSStrokeWidthAttributeName:@3,
                                              NSStrokeColorAttributeName:[UIColor blackColor]}
    
                                       range:self.textBody.selectedRange];
}

-(IBAction)colorTextBodySelection:(UIButton *)sender{
    [self.textBody.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.textBody.selectedRange];
    
}


-(IBAction)UnOutlineButton:(UIButton *)sender{
    [self.textBody.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.textBody.selectedRange];
}



@end
