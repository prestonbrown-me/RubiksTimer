//
//  ViewController.m
//  RubiksTimer
//
//  Created by Preston Brown on 10/28/13.
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
    
    //Loads the default view for the text view
    [super viewDidLoad];
    
    //Set Color to basic blue when view loads.
    [_leftButton setBackgroundColor: [UIColor blueColor]];
    [_rightButton setBackgroundColor: [UIColor blueColor]];
    
    
    //Time label is not an integer value, rather, a string that is rendered for
    //looks only before an actual value is assigned to the counter.
    
    self.timeLabel.text = @"00 : 00 : 00";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftPressed:(id)sender {
    isLeftPressed = true;
    //While the button is held, make the color turn to red to indicate it is being pressed
    [_leftButton setBackgroundColor: [UIColor redColor]];
}

- (IBAction)rightPressed:(id)sender {
    isRightPressed = true;
    //While the button is held, make the color turn to red to indicate it is being pressed
    [_rightButton setBackgroundColor: [UIColor redColor]];

}

- (IBAction)leftReleased:(id)sender {
    if (isRightPressed && isLeftPressed) {
        [self startTimer];
        isTimerRunning = true;
    }
    
    isLeftPressed = false;
    //When button is released return to original blue color
    [_leftButton setBackgroundColor: [UIColor blueColor]];
}


- (IBAction)rightReleased:(id)sender {
    if (isRightPressed && isLeftPressed) {
        [self startTimer];
        isTimerRunning = true;
    }
    
    isRightPressed = false;
    //When button is released return to original blue color

    [_rightButton setBackgroundColor: [UIColor blueColor]];
    
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
