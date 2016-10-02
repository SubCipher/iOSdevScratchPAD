//
//  AttributorViewController02.m
//  Attributor02
//
//  Created by MacMan on 10/1/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "AttributorViewController02.h"

@interface AttributorViewController02 ()

@property (weak, nonatomic) IBOutlet UITextView *textBody;

@property (weak, nonatomic) IBOutlet UILabel *headlineLabel;

@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end




@implementation AttributorViewController02

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupOutlineButton];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontsChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(void)viewDidDisappear:(BOOL)animated{
   
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontsChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (IBAction)changeTextBodyColor:(UIButton *)sender {
 
    [self.textBody.textStorage addAttribute:NSForegroundColorAttributeName
                                      value:sender.backgroundColor
                                      range:self.textBody.selectedRange];
    
}

-(IBAction)outlineButton:(UIButton *)sender{
    
    [self.textBody.textStorage addAttributes:@{NSStrokeWidthAttributeName:@-3,
                                               NSStrokeColorAttributeName:[UIColor blackColor]
                                               }
                                       range:self.textBody.selectedRange];
}


-(void)setupOutlineButton{
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{ NSStrokeWidthAttributeName:@3,
                            NSStrokeColorAttributeName:self.outlineButton.tintColor}
                   range:NSMakeRange(0, [title length])];
    
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFonts];
}

-(void)usePreferredFonts{
    self.textBody.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headlineLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

-(void)unOutlineBodySelection:(UIButton *)sender{
    [self.textBody.textStorage removeAttribute:NSStrokeWidthAttributeName
                                         range:self.textBody.selectedRange];
}

@end