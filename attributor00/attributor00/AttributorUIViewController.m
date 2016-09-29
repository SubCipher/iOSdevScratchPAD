//
//  AttributorUIViewController.m
//  attributor00
//
//  Created by MacMan on 9/28/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "AttributorUIViewController.h"
#import "TextStatsViewController.h"


@interface AttributorUIViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textBody;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;
@end


@implementation AttributorUIViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"AnalyzeText"]){
        
        if([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
            tsvc.textToAnalyze =self.textBody.textStorage;
        }
    }
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupOutlineButton];
    
}

-(void)setupOutlineButton{
    NSMutableAttributedString *title =
    [[NSMutableAttributedString alloc]initWithString:self.outlineButton.currentTitle];

    [title setAttributes:@{ NSStrokeWidthAttributeName:@3,
                          NSStrokeWidthAttributeName:self.outlineButton.tintColor
                            }
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontsChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
}
-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFonts];
}

-(void)usePreferredFonts{
    self.textBody.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    
}



- (IBAction)changeBodySelectionButton:(UIButton *)sender {
   
    [self.textBody.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.textBody.selectedRange];
     
     }

- (IBAction)outlineButton:(UIButton *)sender {
    [self.textBody.textStorage addAttributes:@{NSStrokeWidthAttributeName:@-3,
                                              NSStrokeWidthAttributeName:[UIColor blackColor]}
                                       range:self.textBody.selectedRange];
}

- (IBAction)removeOutlineButton:(UIButton *)sender {
    [self.textBody.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.textBody.selectedRange];
}

@end















































