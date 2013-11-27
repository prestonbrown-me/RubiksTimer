//
//  ViewController.h
//  RubiksTimer
//
//  Created by Developer on 10/28/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *startTimer;

}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (IBAction)leftPressed:(id)sender;
- (IBAction)leftReleased:(id)sender;

- (IBAction)rightPressed:(id)sender;
- (IBAction)rightReleased:(id)sender;

- (void)startTimer;
- (void)updateClock;

- (IBAction)stopTimer:(id)sender;

- (IBAction)resetTimer:(id)sender;

- (IBAction)exitToHere:(UIStoryboardSegue *)sender;

@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;

@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@end
