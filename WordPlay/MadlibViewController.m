//
//  EnterNameViewController.m
//  worldPlay
//
//  Created by Alex Moller on 7/14/15.
//  Copyright (c) 2015 Alex Moller. All rights reserved.
//

#import "MadlibViewController.h"
#import "ResultViewController.h"

@interface MadlibViewController ()

@property int counter;
@property NSMutableArray *words;
@property (weak, nonatomic) IBOutlet UILabel *enterLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation MadlibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.counter = 0;
    self.words = [[NSMutableArray alloc] init];
    [self setupLabel];
    self.nextButton.enabled = NO;

}

- (void)setupLabel {

    self.textField.text = @"";
    switch (self.counter) {
        case 0:
            self.enterLabel.text = @"Enter a Name";
            break;
        case 1:
            self.enterLabel.text = @"Enter an Adjective";
            break;
        case 2:
            self.enterLabel.text = @"Enter a Pokemon";
            break;
        case 3:
            self.enterLabel.text = @"Enter your favorite food";
            break;
        default:
            break;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ResultViewController *vc = segue.destinationViewController;
    vc.words = self.words;
}


-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
}
- (IBAction)textFieldChanged:(UITextField *)textField {
    NSString *textFieldText = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (textFieldText.length > 0) {
        self.nextButton.enabled = YES;
    } else {
        self.nextButton.enabled = NO;
    }
}

- (IBAction)nextButtonPressed:(UIButton *)sender {
    self.nextButton.enabled = NO;
    self.words[self.counter] = self.textField.text;
    self.counter++;
    if (self.counter == 4) {
        [self performSegueWithIdentifier:@"EnterToResultsSegue" sender:self];
    }
    [self setupLabel];
}


@end
