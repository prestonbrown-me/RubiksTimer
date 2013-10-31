//
//  ViewController.m
//  RubiksTimer
//
//  Created by Developer on 10/28/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

bool isLeftPressed, isRightPressed, isTimerRunning;

int timeVal = 0, minVal, milVal, secVal;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.timeLabel.text = @"00 : 00 : 00";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftPressed:(id)sender {
    isLeftPressed = true;
}

- (IBAction)leftReleased:(id)sender {
    if (isRightPressed && isLeftPressed) {
        [self startTimer];
        isTimerRunning = true;
    }
    
    isLeftPressed = false;
}

- (IBAction)rightPressed:(id)sender {
    isRightPressed = true;
}

- (IBAction)rightReleased:(id)sender {
    if (isRightPressed && isLeftPressed) {
        [self startTimer];
        isTimerRunning = true;
    }
    
    isRightPressed = false;
    
}

- (void)startTimer {
    
    if (!isTimerRunning) {
        
        startTimer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                target:self
                                                selector:@selector(updateClock)
                                                userInfo:nil
                                                repeats:YES];
        
        [UIView transitionWithView:self.resetButton
                          duration:0.4
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];
        self.resetButton.hidden = true;
        
        [UIView transitionWithView:self.infoButton
                          duration:0.4
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];
        self.infoButton.hidden = true;
    
    }
}

- (void)updateClock{
    timeVal++;
    
    secVal = (timeVal % (100 * 60)) / 100;
    minVal = timeVal / (60 * 100);
    milVal = ((timeVal % (100 * 100)) % 100);
    
    self.timeLabel.text = [NSString stringWithFormat:@"%02i : %02i : %02i", minVal, secVal, milVal];
    
    
}

- (IBAction)stopTimer:(id)sender {
    if (isTimerRunning) {
        [startTimer invalidate];
        isTimerRunning = false;
        
        [UIView transitionWithView:self.resetButton
                          duration:1.0
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];
        self.resetButton.hidden = false;
        
        [UIView transitionWithView:self.infoButton
                          duration:0.4
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];
        self.infoButton.hidden = false;

    }

}

- (IBAction)resetTimer:(id)sender {
    if (!isTimerRunning) {
        timeVal = 0;
        self.timeLabel.text = @"00 : 00 : 00";

    }
}

- (IBAction)exitToHere:(UIStoryboardSegue *)sender{
    
}
@end
