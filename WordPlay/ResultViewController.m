//
//  ResultViewController.m
//  worldPlay
//
//  Created by Alex Moller on 7/14/15.
//  Copyright (c) 2015 Alex Moller. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@property (weak, nonatomic) IBOutlet UITextView *resultTextView;

@property NSMutableAttributedString *firstPartAppend;



@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    NSDictionary *regularFont = @{NSFontAttributeName:[UIFont fontWithName:@"AvenirNext-Regular" size:16.0],};
    NSDictionary *boldFont = @{NSFontAttributeName:[UIFont fontWithName:@"AvenirNext-Heavy" size:16.0],};

    NSMutableAttributedString *attributedNameString = [[NSMutableAttributedString alloc] initWithString:self.words[0] attributes:boldFont];
    NSMutableAttributedString *attributedAdjectiveString = [[NSMutableAttributedString alloc] initWithString:self.words[1] attributes:boldFont];
    NSMutableAttributedString *attributedPokemonString = [[NSMutableAttributedString alloc] initWithString:self.words[2] attributes:boldFont];
    NSMutableAttributedString *attributedFoodString = [[NSMutableAttributedString alloc] initWithString:self.words[3] attributes:boldFont];
    
    
    NSMutableAttributedString *resultText = [[NSMutableAttributedString alloc] initWithString:@"Once we had a friend named  " attributes:regularFont];
    NSMutableAttributedString *nextPart = [[NSMutableAttributedString alloc] initWithString:@". He or she was very " attributes:regularFont];
    NSMutableAttributedString *nextPart2 = [[NSMutableAttributedString alloc] initWithString:@". His or her favorite pokemon was " attributes:regularFont];
    NSMutableAttributedString *nextPart3 = [[NSMutableAttributedString alloc] initWithString:@" and they loved to eat " attributes:regularFont];

    [resultText  appendAttributedString:attributedNameString];
    [resultText  appendAttributedString:nextPart];
    [resultText  appendAttributedString:attributedAdjectiveString];
    [resultText  appendAttributedString:nextPart2];
    [resultText  appendAttributedString:attributedPokemonString];
    [resultText  appendAttributedString:nextPart3];
    [resultText  appendAttributedString:attributedFoodString];

    self.resultTextView.attributedText = resultText;
    
}

@end
