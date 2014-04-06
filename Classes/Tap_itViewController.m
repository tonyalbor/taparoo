//
//  Tap_itViewController.m
//  Tap it
//
//  Created by Tony Albor on 7/14/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "Tap_itViewController.h"
#include <stdlib.h>
#import <GameKit/GameKit.h>
#import "GameCenterManager.h"
#import "Tap_itAppDelegate.h"
//#import "SynthesizeSingleton.h"
#import "AppSpecificValues.h"
#import "MyButton.h"

@implementation Tap_itViewController

//@synthesize banner, bannerIsVisible;
@synthesize gameCenterManager;
@synthesize button, button2, button3, button4;
@synthesize start, mainMenuButton, mainMenuButton2;
@synthesize rules, chooseYourTimingOptionLabel;
@synthesize b, b2, b3, b4;
@synthesize score, scoreLabel, scoreDisplay, highScore;
@synthesize classic1HighScoreDisplay, classic30HighScoreDisplay, endure1HighScoreDisplay, endure30HighScoreDisplay;
@synthesize dontTap30HighScoreDisplay, dontTap1HighScoreDisplay, taparoo30HighScoreDisplay, taparoo1HighScoreDisplay;
@synthesize taparooHighScoreDisplay, taparooHighScoreLabel, highScoreLabel;
@synthesize timer, timeLeft, timerDisplay, timeLeftLabel;
@synthesize chooseYourGameModeLabel;
@synthesize pausebutton, playbutton, showLeaderboardsButton;
@synthesize settings, submitAllHighScores, resetAllHighScores, personalizeButton;
@synthesize classicButton, endureButton, dontTapButton, taparooButton, thirtyButton, minuteButton;
@synthesize buttonColorChanger1, colorText, colorPalette, resetButtonColorsButton, resetButtonColorsLabel;
@synthesize buttonColorLabel, textColorLabel, personalizeLabel;
@synthesize backButtonLabel, backButton, smallButton, tapItButton;
@synthesize howToPlayImage;

double stop = 5;
int scoreUp = 2;

NSTimer *scatterTimer;

BOOL hasSetTitle = FALSE;

BOOL classic30Mode = FALSE;
BOOL classic1Mode = FALSE;
BOOL endure30Mode = FALSE;
BOOL endure1Mode = FALSE;
bool dontTap30Mode = false;
bool dontTap1Mode = false;
bool taparoo30Mode = false;
bool taparoo1Mode = false;

bool classicMode = false;
bool endureMode  = false;
bool dontTapMode = false;
bool taparooMode = false;

bool x2 = false;
bool x3 = false;
bool xhalf = false;
bool tap = false;

BOOL paused = FALSE;

BOOL allTap = FALSE;

BOOL isShowRules = FALSE;

bool gameStarted = false;

bool pauseExpiration = false;

bool personalizeMode = false;

bool changingColor1Mode = false;
bool changingColor2Mode = false;
bool changingColor3Mode = false;
bool changingColor4Mode = false;

bool text1white = true;
bool text2white = true;
bool text3white = false;
bool text4white = false;





bool buttonIsGlowing = false;

int prevNum = 0;

bool isGameOver = false;

NSString* identifier = NULL;
double percentComplete = 0;

NSTimer *buttonTimer;

int progressAsInt;
int progressAsIntFor1;
int progressAsIntFor2;
int progressAsIntFor3;
int progressAsIntFor4;
/*
-(void)bannerViewDidLoadAD: (ADBannerView *)abanner
{
    if(!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animatedAdBannerOn" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0.0, 50.0);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

-(void)bannerView:(ADBannerView *)aBanner didFailToReceiveAdWithError:(NSError *)error
{
    if(!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animatedAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0.0, -320.0);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }   
}
*/
-(void)resetButtonPositions
{
    CGPoint temp;
    temp.x = 90;
    temp.y = 161;
    button.center = temp;
    
    temp.x = 230;
    button2.center = temp;
    
    temp.x = 90;
    temp.y = 267;
    button3.center = temp;
    
    temp.x = 230;
    button4.center = temp;
    
}

CGFloat ninety = 90;
CGFloat onesixtyone = 161;
CGFloat twothirty = 230;
CGFloat twosixtyseven = 267;

CGPoint one;
CGPoint two;
CGPoint three;
CGPoint four;


//one.makedev(90, 161);



CGPoint temp;
CGPoint temp2;
bool bool1 = true;
bool bool2 = false;
bool bool3 = false;
bool bool4 = false;
int scatter = 1;
int counterScatter = 0;

-(void)scatterButtons
{
    if((taparoo30Mode || taparoo1Mode) && !paused)
    {
        if(scatter == 1)
        {
            if(bool1)
            {
                one.x += 4;
                two.y -= 3;
                three.x -= 4;
                four.y += 3;
            }
            else if(bool2)
            {
                one.y += 3;
                two.x += 4;
                three.y -= 3;
                four.x -= 4;
            }
            else if(bool3)
            {
                one.x -= 4;
                two.y += 3;
                three.x += 4;
                four.y -= 3;
            }
            else if(bool4)
            {
                one.y -= 3;
                two.x -= 4;
                three.y += 3;
                four.x += 4;
            }
            
            if(one.x <= 230 && one.y <= 161 && two.x <= 90 && four.x >= 230)
            {
                bool1 = true;
                bool2 = false;
                bool3 = false;
                bool4 = false;
                one.y = 161;
                two.x = 90;
                three.y = 267;
                four.x = 230;
            }
            else if(one.x >= 230 && one.y <= 267 && two.x <= 161 && four.y >= 267)
            {
                bool1 = false;
                bool2 = true;
                bool3 = false;
                bool4 = false;
                one.x = 230;
                two.y = 161;
                three.x = 90;
                four.y = 267;
            }
            else if(one.y >= 267 && one.x >= 90 && two.x >= 230 && four.x <= 90)
            {
                bool1 = false;
                bool2 = false;
                bool3 = true;
                bool4 = false;
                one.y = 267;
                two.x = 230;
                three.y = 161;
                four.x = 90;
            }
            else if(one.x <= 90 && one.y >= 161 && two.y >= 267 && four.y <= 161)
            {
                bool1 = false;
                bool2 = false;
                bool3 = false;
                bool4 = true;
                one.x = 90;
                two.y = 267;
                three.x = 230;
                four.y = 161;
            }
            button.center = one;
            button2.center = four;
            button3.center = two;
            button4.center = three;
        }
        else if(scatter == 0)
        {
            if(bool1)
            {
                one.y += 3;
                two.x += 4;
                three.y -= 3;
                four.x -= 4;
            }
            else if(bool2)
            {
                one.x += 4;
                two.y -= 3;
                three.x -= 4;
                four.y += 3;
            }
            else if(bool3)
            {
                one.y -= 3;
                two.x -=4;
                three.y += 3;
                four.x += 4;
            }
            else if(bool4)
            {
                one.x -= 4;
                two.y += 3;
                three.x += 4;
                four.y -= 3;
            }
        
            if((one.y <= 267 && one.x <= 90) && (two.y >= 267) && four.y <= 161)
            {
                bool1 = true;
                bool2 = false;
                bool3 = false;
                bool4 = false;
                one.x = 90;
                two.y = 267;
                three.x = 230;
                four.y = 161;
            }
            else if(one.x <= 230 && one.y >= 267 && two.x >= 230 && four.x <= 90)
            {
                bool1 = false;
                bool2 = true;
                bool3 = false;
                bool4 = false;
                one.y = 267;
                two.x = 230;
                three.y = 161;
                four.x = 90;
            }
            else if(one.y >= 161 && one.x >= 230 && two.y <= 161 && four.y >= 267)
            {
                bool1 = false;
                bool2 = false;
                bool3 = true;
                bool4 = false;
                one.x = 230;
                two.y = 161;
                three.x = 90;
                four.y = 267;
            
            }
            else if(one.x >= 90 && one.y <= 161 && two.x <= 90 && four.x >= 230)
            {
                bool1 = false;
                bool2 = false;
                bool3 = false;
                bool4 = true;
                one.y = 161;
                two.x = 90;
                three.y = 267;
                four.x = 230;
            }
        
            button.center = one;
            button2.center = four;
            button3.center = two;
            button4.center = three;
        }
    }
    
    if(!paused) counterScatter++;
    if(counterScatter >= 250)
    {
        if(scatter == 1) scatter = 0;
        else scatter = 1;
        counterScatter = 0;
    }
}

-(IBAction)chooseGame: (id)sender
{

    [classicButton setTitle:@"Classic" forState:UIControlStateNormal];
    [endureButton setTitle:@"Endure" forState:UIControlStateNormal];
    [dontTapButton setTitle:@"Taparoo" forState:UIControlStateNormal];
    [taparooButton setTitle:@"Scatter" forState:UIControlStateNormal];
    [rules setTitle:@"How To Play" forState:UIControlStateNormal];
    
    NSString *game = [sender titleForState:UIControlStateNormal];
    
    backButton.hidden = true;
    classicButton.hidden = true;
    endureButton.hidden = true;
    dontTapButton.hidden = true;
    taparooButton.hidden = true;
    start.hidden = false;
    
    hasSetTitle = TRUE;
    pausebutton.hidden = FALSE;
    playbutton.hidden = TRUE;
    showLeaderboardsButton.hidden = true;
    mainMenuButton2.hidden = false;
    chooseYourGameModeLabel.hidden = true;
    taparooHighScoreLabel.hidden = true;
    taparooHighScoreDisplay.hidden = true;
    settings.hidden = true;
    timerDisplay.hidden = false;
    scoreDisplay.hidden = false;
    scoreLabel.hidden = false;
    timeLeftLabel.hidden = false;
    highScoreLabel.hidden = false;
    pausebutton.hidden = false;
    playbutton.hidden = true;
    

    if     (game == @"Classic :30")
    {
        classic30Mode = true;
        classic30HighScoreDisplay.hidden = false;
        timerDisplay.text = @":30.00";
    }
    else if(game == @"Classic 1:")
    {
        classic1Mode = true;
        classic1HighScoreDisplay.hidden = false;
        timerDisplay.text = @"1:00.00";
    }
    else if(game == @"Endure :30")
    {
        endure30Mode = true;
        endure30HighScoreDisplay.hidden = false;
        timerDisplay.text = @":30.00";
    }
    else if(game == @"Endure 1:")
    {
        endure1Mode = true;
        endure1HighScoreDisplay.hidden = false;
        timerDisplay.text = @"1:00.00";
    }
    
    else if(game == @"How To Play")
    {
        identifier = kAchievementHowTaparoo;
        GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
        achievement.percentComplete = 100.0;
        if(achievement!= NULL)
        {
            [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                if(error != nil){
                    NSLog(@"Achievement failed");
                } else {
                    NSLog(@"Achievement success");
                }
                
            }];
        }
        isShowRules = TRUE;
        chooseYourGameModeLabel.hidden = TRUE;
        button.hidden = TRUE;
        button2.hidden = TRUE;
        button3.hidden = TRUE;
        button4.hidden = TRUE;
        timerDisplay.hidden = TRUE;
        timeLeftLabel.hidden = TRUE;
        playbutton.hidden = TRUE;
        pausebutton.hidden = true;
        highScoreLabel.hidden = TRUE;
        start.hidden = TRUE;
        
        rules.hidden = TRUE;
        mainMenuButton2.hidden = FALSE;
        showLeaderboardsButton.hidden = TRUE;
        
        submitAllHighScores.hidden = true;
        resetAllHighScores.hidden = true;
        
        taparooHighScoreLabel.hidden = TRUE;
        taparooHighScoreDisplay.hidden = TRUE;
        
        scoreDisplay.hidden = true;
        scoreLabel.hidden = true;
        backButton.hidden = false;
        backButtonLabel.hidden = false;
        
        personalizeButton.hidden = true;
        howToPlayImage.hidden = false;
    }

    
    if(classic1Mode || classic30Mode || endure1Mode || endure30Mode)
    {
        button.hidden = false;
        button2.hidden = false;
        button3.hidden = false;
        button4.hidden = false;
        pausebutton.hidden = false;
        playbutton.hidden = true;
        
        [button setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button2 setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button3 setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button4 setTitle:@"Tap It!" forState:UIControlStateNormal];

        
         [self setTapIt];
        
        if(!allTap)
        {
            timer = [NSTimer 
                     scheduledTimerWithTimeInterval:0.1
                     target:self 
                     selector:@selector(updateTimerDisplay) 
                     userInfo:nil			 
                     repeats:YES];
            timerDisplay.text = [NSString stringWithFormat:@":%.1lf", timeLeft];
        }

    }
    
    
    paused = FALSE;
    [timer invalidate];
    timer = nil;
    
    if(classic1Mode || endure1Mode || dontTap1Mode || taparoo1Mode)
    {
        timeLeft = 60;
        timerDisplay.text = @"1:00.00";
    }
    
    else if(classic30Mode || endure30Mode || dontTap30Mode || taparoo30Mode)
        timeLeft = 30;
    
   
    [start setTitle:@"Restart!" forState:UIControlStateNormal];
	
    score = 0;
    NSString* scoreString = [[NSString alloc] initWithFormat:@"%d", score];
    scoreDisplay.text = scoreString;
    
    [game release];//777777777777777777777777777falskdfja;lskdjfal;ksdjfl;askjdfal;ksdjf77
    [scoreString release];//d;lfkjal;sdkjfal;sdkjfal;skdjfal;ksdjfal;ksdjfl;askjdl;akjdfl
	
    
}

-(IBAction)chooseMode:(id)sender
{
    [classicButton setTitle:@"Classic" forState:UIControlStateNormal];
    [endureButton setTitle:@"Endure" forState:UIControlStateNormal];
    [dontTapButton setTitle:@"Taparoo" forState:UIControlStateNormal];
    [taparooButton setTitle:@"Scatter" forState:UIControlStateNormal];
    
    NSString *mode = [sender titleForState:UIControlStateNormal];
    
    classicButton.hidden = true;
    endureButton.hidden = true;
    dontTapButton.hidden = true;
    taparooButton.hidden = true;
    
    thirtyButton.hidden = false;
    minuteButton.hidden = false;
    
    button.hidden = true;
    button2.hidden = true;
    button3.hidden = true;
    button4.hidden = true;
    
    settings.hidden = true;
    
    chooseYourGameModeLabel.hidden = true;
    chooseYourTimingOptionLabel.hidden = false;
    taparooHighScoreDisplay.hidden = true;
    taparooHighScoreLabel.hidden = true;
    showLeaderboardsButton.hidden = true;
    mainMenuButton2.hidden = false;
    
    if(mode == @"Classic")
        classicMode = true;

    else if(mode == @"Endure")
        endureMode = true;
    
    else if(mode == @"Taparoo")
        dontTapMode = true;
    
    else if(mode == @"Scatter")
        taparooMode = true;
    
    [mode release];//dalfjs;ldkjfa;lksjdf;lakjsd;lfkajsd;flkjasdflkjasldkfja;lsdkfjals;dfj
}

-(IBAction)chooseTime: (id)sender
{
    
    [thirtyButton setTitle:@":30.00" forState:UIControlStateNormal];
    [minuteButton setTitle:@"1:00.00" forState:UIControlStateNormal];
    NSString *time = [sender titleForState:UIControlStateNormal];

    if(time == @":30.00")
    {
        timerDisplay.text = @":30.00";
        
        if(classicMode)
            classic30Mode = true;
        else if(endureMode)
            endure30Mode = true;
        else if(dontTapMode)
            dontTap30Mode = true;
        else if(taparooMode)
            taparoo30Mode = true;
        else {}
    }
    
    else if(time == @"1:00.00")
    {
        timerDisplay.text = @"1.00:00";
        
        if(classicMode)
            classic1Mode = true;
        else if(endureMode)
            endure1Mode = true;
        else if(dontTapMode)
            dontTap1Mode = true;
        else if(taparooMode)
            taparoo1Mode = true;
        else {}
    }
    
    else {}
    
    if(classic1Mode || classic30Mode || endure1Mode || endure30Mode)
    {
        button.hidden = false;
        button2.hidden = false;
        button3.hidden = false;
        button4.hidden = false;
        thirtyButton.hidden = true;
        minuteButton.hidden = true;
        chooseYourTimingOptionLabel.hidden = true;
    }
    
    else if(dontTap30Mode || dontTap1Mode)
    {
        button.hidden = false;
        button2.hidden = false;
        button3.hidden = false;
        button4.hidden = false;
        thirtyButton.hidden = true;
        minuteButton.hidden = true;
        chooseYourTimingOptionLabel.hidden = true;
        [button  setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button2 setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button3 setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button4 setTitle:@"Tap It!" forState:UIControlStateNormal];
    }
    
    else if(taparoo30Mode || taparoo1Mode)
    {
        chooseYourTimingOptionLabel.hidden = true;
        thirtyButton.hidden = true;
        minuteButton.hidden = true;
        button.hidden = false;
        button2.hidden = false;
        button3.hidden = false;
        button4.hidden = false;
        playbutton.hidden = true;
        pausebutton.hidden = false;
        
        [button  setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button2  setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button3  setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button4  setTitle:@"Tap It!" forState:UIControlStateNormal];
        
        [self setTitle:sender];
        pausebutton.hidden = false;

    }
    
    
    [self chooseGame:sender];
    
    if(classic30Mode)
        classic30HighScoreDisplay.hidden = false;
    else if(classic1Mode)
        classic1HighScoreDisplay.hidden = false;
    else if(endure30Mode)
        endure30HighScoreDisplay.hidden = false;
    else if(endure1Mode)
        endure1HighScoreDisplay.hidden = false;
    else if(dontTap30Mode)
        dontTap30HighScoreDisplay.hidden = false;
    else if(dontTap1Mode)
        dontTap1HighScoreDisplay.hidden = false;
    else if(taparoo30Mode)
        taparoo30HighScoreDisplay.hidden = false;
    else if(taparoo1Mode)
        taparoo1HighScoreDisplay.hidden = false;
    
    [time release];//a;lsdfj;laksdjf;laksjdfl;aksjdf;laksdjfl;aksjdfl;aksdjfalksdjfl;aksjdfal;k
}

-(IBAction)personalize
{
    personalizeMode = true;
    
    personalizeButton.hidden = true;
    resetAllHighScores.hidden = true;
    submitAllHighScores.hidden = true;
    rules.hidden = true;
    colorPalette.hidden = false;
    colorText.hidden = false;
    resetButtonColorsButton.hidden = false;
    resetButtonColorsLabel.hidden = false;
    personalizeLabel.hidden = false;
    buttonColorLabel.hidden = false;
    textColorLabel.hidden = false;
    backButtonLabel.hidden = false;
    backButton.hidden = false;
    
    button.hidden = false;
    button2.hidden = false;
    button3.hidden = false;
    button4.hidden = false;
    
    CGPoint temp;
    temp.x = 90;
    temp.y = 110;
    button.center = temp;
    
    temp.x = 230;
    button2.center = temp;
    
    temp.x = 90;
    temp.y = 216;
    button3.center = temp;
    
    temp.x = 230;
    button4.center = temp;
    
    [button  setTitle:@"Tap It!" forState:UIControlStateNormal];
    [button2  setTitle:@"Tap It!" forState:UIControlStateNormal];
    [button3  setTitle:@"Tap It!" forState:UIControlStateNormal];
    [button4  setTitle:@"Tap It!" forState:UIControlStateNormal];
    
    buttonColorChanger1.hidden = false;
}

-(void)setAllColorChangingModesToFalse
{
    changingColor1Mode = false;
    changingColor2Mode = false;
    changingColor3Mode = false;
    changingColor4Mode = false;
}

-(IBAction)changeButtonColor1
{
    [self setAllColorChangingModesToFalse];
    changingColor1Mode = true;
    buttonColorChanger1.value = progressAsIntFor1;
    
    if(personalizeMode)
    {
        if(!text1white)
            [colorText setSelectedSegmentIndex:0];
        else
            [colorText setSelectedSegmentIndex:1];
    }
}

-(IBAction)changeButtonColor2
{
    [self setAllColorChangingModesToFalse];
    changingColor2Mode = true;
    buttonColorChanger1.value = progressAsIntFor2;
    
    if(personalizeMode)
    {
        if(!text2white)
            [colorText setSelectedSegmentIndex:0];
        else
            [colorText setSelectedSegmentIndex:1];
    }
}

-(IBAction)changeButtonColor3
{
    [self setAllColorChangingModesToFalse];
    changingColor3Mode = true;
    buttonColorChanger1.value = progressAsIntFor3;
    
    if(personalizeMode)
    {
        if(!text3white)
            [colorText setSelectedSegmentIndex:0];
        else
            [colorText setSelectedSegmentIndex:1];
    }
}

-(IBAction)changeButtonColor4
{
    [self setAllColorChangingModesToFalse];
    changingColor4Mode = true;
    buttonColorChanger1.value = progressAsIntFor4;
    
    if(personalizeMode)
    {
        if(!text4white)
            [colorText setSelectedSegmentIndex:0];
        else
            [colorText setSelectedSegmentIndex:1];
    }
}

-(void)image: (NSString*)name: (int)n
{
    if(changingColor1Mode)
    {
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [classicButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [thirtyButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        progressAsIntFor1 = n;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:progressAsIntFor1 forKey:@"Progress1Key"];
        [defaults synchronize];
    }
    else if(changingColor2Mode)
    {
        [button2 setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [endureButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [minuteButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        progressAsIntFor2 = n;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:progressAsIntFor2 forKey:@"Progress2Key"];
        [defaults synchronize];
    }
    else if(changingColor3Mode)
    {
        [button3 setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [dontTapButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [smallButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        progressAsIntFor3 = n;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:progressAsIntFor3 forKey:@"Progress3Key"];
        [defaults synchronize];
    }
    else if(changingColor4Mode)
    {
        [button4 setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [taparooButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        progressAsIntFor4 = n;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:progressAsIntFor4 forKey:@"Progress4Key"];
        [defaults synchronize];
    }
}

-(void)loadImage: (NSString*)name: (int)n
{
    if(n == 1)
    {
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [classicButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [thirtyButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        //progressAsIntFor1 = n;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:progressAsIntFor1 forKey:@"Progress1Key"];
        [defaults synchronize];
    }
    else if(n == 2)
    {
        [button2 setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [endureButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [minuteButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        //progressAsIntFor2 = n;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:progressAsIntFor2 forKey:@"Progress2Key"];
        [defaults synchronize];
    }
    else if(n == 3)
    {
        [button3 setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [dontTapButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [smallButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        //progressAsIntFor3 = n;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:progressAsIntFor3 forKey:@"Progress3Key"];
        [defaults synchronize];
    }
    else if(n == 4)
    {
        [button4 setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [taparooButton setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        //progressAsIntFor4 = n;
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:progressAsIntFor4 forKey:@"Progress4Key"];
        [defaults synchronize];
    }

}

-(void)loadButtonColors: (int)n1: (int)n2
{
    if(n1 == 0)
    {
        [self loadImage:@"newRed" :1];
        [self loadImage:@"newBlue" :2];
        [self loadImage:@"newGreen" :3];
        [self loadImage:@"newYellow" :4];
    }
    
    else if(n1 == 1)
        [self loadImage:@"n180":n2];
    else if(n1 == 2)
        [self loadImage:@"n170":n2];
    else if(n1 == 3)
        [self loadImage:@"n160":n2];
    else if(n1 == 4)
        [self loadImage:@"n150":n2];
    else if(n1 == 5)
        [self loadImage:@"n140":n2];
    else if(n1 == 6)
        [self loadImage:@"n130":n2];
    else if(n1 == 7)
        [self loadImage:@"n120":n2];
    else if(n1 == 8)
        [self loadImage:@"n110":n2];
    else if(n1 == 9)
        [self loadImage:@"n100":n2];
    else if(n1 == 10)
        [self loadImage:@"n90":n2];
    else if(n1 == 11)
        [self loadImage:@"n80":n2];
    else if(n1 == 12)
        [self loadImage:@"n70":n2];
    else if(n1 == 13)
        [self loadImage:@"n60":n2];
    else if(n1 == 14)
        [self loadImage:@"n50":n2];
    else if(n1 == 15)
        [self loadImage:@"n40":n2];
    else if(n1 == 16)
        [self loadImage:@"n30":n2];
    else if(n1 == 17)
        [self loadImage:@"n20":n2];
    else if(n1 == 18)
        [self loadImage:@"n10":n2];
    else if(n1 == 19)
        [self loadImage:@"newBlue":n2];
    else if(n1 == 20)
        [self loadImage:@"p10":n2];
    else if(n1 == 21)
        [self loadImage:@"p20":n2];
    else if(n1 == 22)
        [self loadImage:@"p30":n2];
    else if(n1 == 23)
        [self loadImage:@"p40":n2];
    else if(n1 == 24)
        [self loadImage:@"p50":n2];
    else if(n1 == 25)
        [self loadImage:@"p60":n2];
    else if(n1 == 26)
        [self loadImage:@"p70":n2];
    else if(n1 == 27)
        [self loadImage:@"p80":n2];
    else if(n1 == 28)
        [self loadImage:@"p90":n2];
    else if(n1 == 29)
        [self loadImage:@"p100":n2];
    else if(n1 == 30)
        [self loadImage:@"p110":n2];
    else if(n1 == 31)
        [self loadImage:@"p120":n2];
    else if(n1 == 32)
        [self loadImage:@"p130":n2];
    else if(n1 == 33)
        [self loadImage:@"p140":n2];
    else if(n1 == 34)
        [self loadImage:@"p150":n2];
    else if(n1 == 35)
        [self loadImage:@"p160":n2];
    else if(n1 == 36)
        [self loadImage:@"p170":n2];
    else if(n1 == 37)
        [self loadImage:@"p180":n2];
    else if(n1 == 38)
        [self loadImage:@"white":n2];
    else if(n1 == 39)
        [self loadImage:@"black":n2];
}

-(IBAction)colorButton1
{
    progressAsInt = (int)(buttonColorChanger1.value + 0.5f);
    
    if(progressAsInt == 1)
        [self image:@"n180":1];
    else if(progressAsInt == 2)
        [self image:@"n170":2];
    else if(progressAsInt == 3)
        [self image:@"n160":3];
    else if(progressAsInt == 4)
        [self image:@"n150":4];
    else if(progressAsInt == 5)
        [self image:@"n140":5];
    else if(progressAsInt == 6)
        [self image:@"n130":6];
    else if(progressAsInt == 7)
        [self image:@"n120":7];
    else if(progressAsInt == 8)
        [self image:@"n110":8];
    else if(progressAsInt == 9)
        [self image:@"n100":9];
    else if(progressAsInt == 10)
        [self image:@"n90":10];
    else if(progressAsInt == 11)
        [self image:@"n80":11];
    else if(progressAsInt == 12)
        [self image:@"n70":12];
    else if(progressAsInt == 13)
        [self image:@"n60":13];
    else if(progressAsInt == 14)
        [self image:@"n50":14];
    else if(progressAsInt == 15)
        [self image:@"n40":15];
    else if(progressAsInt == 16)
        [self image:@"n30":16];
    else if(progressAsInt == 17)
        [self image:@"n20":17];
    else if(progressAsInt == 18)
        [self image:@"n10":18];
    else if(progressAsInt == 19)
        [self image:@"newBlue":19];
    else if(progressAsInt == 20)
        [self image:@"p10":20];
    else if(progressAsInt == 21)
        [self image:@"p20":21];
    else if(progressAsInt == 22)
        [self image:@"p30":22];
    else if(progressAsInt == 23)
        [self image:@"p40":23];
    else if(progressAsInt == 24)
        [self image:@"p50":24];
    else if(progressAsInt == 25)
        [self image:@"p60":25];
    else if(progressAsInt == 26)
        [self image:@"p70":26];
    else if(progressAsInt == 27)
        [self image:@"p80":27];
    else if(progressAsInt == 28)
        [self image:@"p90":28];
    else if(progressAsInt == 29)
        [self image:@"p100":29];
    else if(progressAsInt == 30)
        [self image:@"p110":30];
    else if(progressAsInt == 31)
        [self image:@"p120":31];
    else if(progressAsInt == 32)
        [self image:@"p130":32];
    else if(progressAsInt == 33)
        [self image:@"p140":33];
    else if(progressAsInt == 34)
        [self image:@"p150":34];
    else if(progressAsInt == 35)
        [self image:@"p160":35];
    else if(progressAsInt == 36)
        [self image:@"p170":36];
    else if(progressAsInt == 37)
        [self image:@"p180":37];
    else if(progressAsInt == 38)
        [self image:@"white":38];
    else if(progressAsInt == 39)
        [self image:@"black":39];
}

-(IBAction)toggleTextColor: (id)sender
{
    if([sender selectedSegmentIndex] == 0)
    {
        if(changingColor1Mode)
        {
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [thirtyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [classicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            text1white = false;
        }
        else if(changingColor2Mode)
        {
            [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [endureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [minuteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            text2white = false;
        }
        else if(changingColor3Mode)
        {
            [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [dontTapButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [smallButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            text3white = false;
        }
        else if(changingColor4Mode)
        {
            [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [taparooButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            text4white = false;
        }
    }
    
    else
    {
        if(changingColor1Mode)
        {
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [thirtyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [classicButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            text1white = true;
        }
        else if(changingColor2Mode)
        {
            [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [endureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [minuteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            text2white = true;
        }
        else if(changingColor3Mode)
        {
            [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [dontTapButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [smallButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            text3white = true;
        }
        else if(changingColor4Mode)
        {
            [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [taparooButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            text4white = true;
        }

    }
    
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    [defaults1 setBool:text1white forKey:@"Text1Key"];
    [defaults1 synchronize];
    
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    [defaults2 setBool:text2white forKey:@"Text2Key"];
    [defaults2 synchronize];
    
    NSUserDefaults *defaults3 = [NSUserDefaults standardUserDefaults];
    [defaults3 setBool:text3white forKey:@"Text3Key"];
    [defaults3 synchronize];
    
    NSUserDefaults *defaults4 = [NSUserDefaults standardUserDefaults];
    [defaults4 setBool:text4white forKey:@"Text4Key"];
    [defaults4 synchronize];
}

/*
-(IBAction)colorButton2
{
    [self hideSliders];
    buttonColorChanger2.hidden = false;
    
}

-(IBAction)colorButton3
{
    [self hideSliders];
    buttonColorChanger3.hidden = false;
    
}

-(IBAction)colorButton4
{
    [self hideSliders];
    buttonColorChanger4.hidden = false;
    
}

-(void)hideSliders
{
    buttonColorChanger1.hidden = true;
    buttonColorChanger2.hidden = true;
    buttonColorChanger3.hidden = true;
    buttonColorChanger4.hidden = true;
}
*/

-(IBAction)resetButtonColors
{
    [button setBackgroundImage:[UIImage imageNamed:@"newRed"] forState:UIControlStateNormal];
    [classicButton setBackgroundImage:[UIImage imageNamed:@"newRed"] forState:UIControlStateNormal];
    [thirtyButton setBackgroundImage:[UIImage imageNamed:@"newRed"] forState:UIControlStateNormal];
    
    [button2 setBackgroundImage:[UIImage imageNamed:@"newBlue"] forState:UIControlStateNormal];
    [endureButton setBackgroundImage:[UIImage imageNamed:@"newBlue"] forState:UIControlStateNormal];
    [minuteButton setBackgroundImage:[UIImage imageNamed:@"newBlue"] forState:UIControlStateNormal];
    
    [button3 setBackgroundImage:[UIImage imageNamed:@"newGreen"] forState:UIControlStateNormal];
    [dontTapButton setBackgroundImage:[UIImage imageNamed:@"newGreen"] forState:UIControlStateNormal];
    
    [button4 setBackgroundImage:[UIImage imageNamed:@"newYellow"] forState:UIControlStateNormal];
    [taparooButton setBackgroundImage:[UIImage imageNamed:@"newYellow"] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [classicButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [thirtyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [endureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [minuteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dontTapButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [taparooButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    NSUserDefaults *red = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *blue = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *green = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *yellow = [NSUserDefaults standardUserDefaults];
    
    [red setInteger:0 forKey:@"Progress1Key"];
    [blue setInteger:0 forKey:@"Progress2Key"];
    [green setInteger:0 forKey:@"Progress3Key"];
    [yellow setInteger:0 forKey:@"Progress4Key"];
    
    [red synchronize];
    [blue synchronize];
    [green synchronize];
    [yellow synchronize];
    
    NSUserDefaults *text1 = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *text2 = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *text3 = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *text4 = [NSUserDefaults standardUserDefaults];
    
    [text1 setBool:true forKey:@"Text1Key"];
    [text2 setBool:true forKey:@"Text2Key"];
    [text3 setBool:false forKey:@"Text3Key"];
    [text4 setBool:false forKey:@"Text4Key"];
    
    [text1 synchronize];
    [text2 synchronize];
    [text3 synchronize];
    [text4 synchronize];
    
    
    if(changingColor1Mode)
        colorText.selectedSegmentIndex = 1;
    if(changingColor2Mode)
        colorText.selectedSegmentIndex = 1;
    if(changingColor3Mode)
        colorText.selectedSegmentIndex = 0;
    if(changingColor4Mode)
        colorText.selectedSegmentIndex = 0;
    
}

-(void)setScreen
{
    
    //taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
    
    
	timeLeftLabel.hidden = FALSE;
	timerDisplay.hidden = FALSE;
	scoreLabel.hidden = FALSE;
	scoreDisplay.hidden = FALSE;
	highScoreLabel.hidden = FALSE;
    
    taparooHighScoreLabel.hidden = TRUE;
    taparooHighScoreDisplay.hidden = TRUE;
    
	chooseYourGameModeLabel.hidden = TRUE;
	start.hidden = FALSE;
	//reset.hidden = FALSE;                    RESET BUTTON
	mainMenuButton.hidden = FALSE;
    
    pausebutton.hidden = FALSE;
    showLeaderboardsButton.hidden = TRUE;

	
	score = 0;
	scoreDisplay.text = @"0";
	
	[button setTitle:@"" forState:UIControlStateNormal];
	[button2 setTitle:@"" forState:UIControlStateNormal];
	[button3 setTitle:@"" forState:UIControlStateNormal];
	[button4 setTitle:@"" forState:UIControlStateNormal];
	
	if(classic1Mode || endure1Mode)
	{
		timerDisplay.text = @"1:00.00";
		if(classic1Mode)
			classic1HighScoreDisplay.hidden = FALSE;
		else if(endure1Mode)
			endure1HighScoreDisplay.hidden = FALSE;
	}
		
	else if(classic30Mode || endure30Mode)
	{
		timerDisplay.text = @":30.00";
		if(classic30Mode)
			classic30HighScoreDisplay.hidden = FALSE;
		else if(endure30Mode)
			endure30HighScoreDisplay.hidden = FALSE;
	}
	
	[start setTitle:@"Start!" forState:UIControlStateNormal];
	//[reset setTitle:@"Reset High Score" forState:UIControlStateNormal];
	
	highScoreLabel.text = @"High Score:";
}

-(void)setTapIt
{
	[button setTitle:@"Tap It!" forState:UIControlStateNormal];
	[button2 setTitle:@"Tap It!" forState:UIControlStateNormal];
	[button3 setTitle:@"Tap It!" forState:UIControlStateNormal];
	[button4 setTitle:@"Tap It!" forState:UIControlStateNormal];
    allTap = TRUE;
    
    if(classic1Mode || endure1Mode)
		timerDisplay.text = @"1:00.00";
    else if(classic30Mode || endure30Mode)
        timerDisplay.text = @":30.00";
    else {}
}
    

-(IBAction)setTitle: (id)sender
{	
	NSString *title = [sender titleForState:UIControlStateNormal];
    
    gameStarted = false;
    isGameOver = false;
    counterScatter = 0;
    
    if(title == @"Restart!")
    {
        identifier = kAchievementMessedUp;
        GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
        achievement.percentComplete = 100.0;
        if(achievement!= NULL)
        {
            [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                if(error != nil){
                    NSLog(@"Achievement failed");
                } 
                else {
                    NSLog(@"Achievement success");
                }
                    
            }];
        }
    }
    
    pauseExpiration = false;
    paused = FALSE;
    [timer invalidate];
    timer = nil;
    [scatterTimer invalidate];
    scatterTimer = nil;
    
    if(classic1Mode || classic30Mode || endure30Mode || endure1Mode)
    {
        if(classic1Mode || endure1Mode)
            timeLeft = 60;
		
        else if(classic30Mode || endure30Mode)
            timeLeft = 30;
		
        [self setTapIt];
        [start setTitle:@"Restart!" forState:UIControlStateNormal];
	
        score = 0;
        NSString* scoreString = [[NSString alloc] initWithFormat:@"%d", score];
        scoreDisplay.text = scoreString;
	
        
        if(!allTap)
        {
            timer = [NSTimer 
                     scheduledTimerWithTimeInterval:0.1
                     target:self 
                     selector:@selector(updateTimerDisplay) 
                     userInfo:nil			 
                     repeats:YES];
            timerDisplay.text = [NSString stringWithFormat:@":%.1lf", timeLeft];
        }
        
        hasSetTitle = TRUE;
        pausebutton.hidden = FALSE;
        playbutton.hidden = TRUE;
        showLeaderboardsButton.hidden = TRUE;
    }
    
    else if(dontTap1Mode || dontTap30Mode)
    {
        if(dontTap1Mode)
        {
            timeLeft = 60;
            timerDisplay.text = @"1:00.00";
        }
        else
        {
            timeLeft = 30;
            timerDisplay.text = @":30.00";
        }
        
        [start setTitle:@"Restart!" forState:UIControlStateNormal];
        
        score = 0;
        NSString* scoreString = [[NSString alloc] initWithFormat:@"%d", score];
        scoreDisplay.text = scoreString;
        [button  setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button2 setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button3 setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button4 setTitle:@"Tap It!" forState:UIControlStateNormal];
        
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        button2.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        button3.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        button4.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        
        /*
        
        //[self chooseNextButtonDont];
        [button setTitle:@"Tap It!" forState:UIControlStateNormal];
        [button2 setTitle:@"Tap It!" forState:UIControlStateNormal];
        [smallButton setTitle:@"Tap It!" forState:UIControlStateNormal];
        buttonIsGlowing = true;
        
        hasSetTitle = TRUE;
        pausebutton.hidden = FALSE;
        playbutton.hidden = TRUE;
        showLeaderboardsButton.hidden = TRUE;
        [scoreString release];//a;lskdfjal;ksdfjakl;sdfjal ;sfja ;lsdkfja;ls fa;skdf ja;ksdj faskdf j
         */
    }
    
    else if(taparoo1Mode || taparoo30Mode)
    {
        if(taparoo1Mode)
            timeLeft = 60;
        else timeLeft = 30;
        
        [self resetButtonPositions];
        
        [start setTitle:@"Restart!" forState:UIControlStateNormal];
        
        score = 0;
        NSString* scoreString = [[NSString alloc] initWithFormat:@"%d", score];
        scoreDisplay.text = scoreString;
        
        hasSetTitle = TRUE;
        pausebutton.hidden = FALSE;
        playbutton.hidden = TRUE;
        showLeaderboardsButton.hidden = TRUE;
        
        [self setTapIt];
        if(taparoo1Mode){
            timeLeft = 60;
            timerDisplay.text = @"1:00.00";}
        else{ timeLeft = 30;
            timerDisplay.text = @":30.00";}
        
        [scoreString release];//a;lskdfjal;ksdfjakl;sdfjal ;sfja ;lsdkfja;ls fa;skdf ja;ksdj faskdf j

        
    }
    playbutton.hidden = true;
    pausebutton.hidden = false;
    
    [title release];//a;lskdfjal;ksdfjakl;sdfjal ;sfja ;lsdkfja;ls fa;skdf ja;ksdj faskdf j

}


-(IBAction)animateButton: (id)sender
{
    
    UIImage *startk = [UIImage imageWithContentsOfFile:@"newTapItButtonYellow"];
    UIImage *one = [UIImage imageWithContentsOfFile:@"newTapItButtonYellow1"];
    UIImage *two = [UIImage imageWithContentsOfFile:@"newTapItButtonYellow2"];
    UIImage *three = [UIImage imageWithContentsOfFile:@"newTapItButtonYellow3"];
    
    if(tapItButton.currentImage == startk)
        [tapItButton setImage:[UIImage imageNamed:@"newTapItButtonYellow1"] forState:UIControlStateNormal];
    else if(tapItButton.currentImage == one)
        [tapItButton setImage:[UIImage imageNamed:@"newTapItButtonYellow2"] forState:UIControlStateNormal];
    else if(tapItButton.currentImage == two)
        [tapItButton setImage:[UIImage imageNamed:@"newTapItButtonYellow3"] forState:UIControlStateNormal];
    else if(tapItButton.currentImage == three)
        [tapItButton setImage:[UIImage imageNamed:@"newTapItButtonYellow"] forState:UIControlStateNormal];
    
    [startk release];
    [one release];
    [two release];
    [three release];
     
    NSString *title = [sender titleForState:UIControlStateNormal];
    if(title == @"new")
        buttonIsGlowing = false;
}


-(void)chooseNextButtonDont
{
	NSString* scoreString = [[NSString alloc] initWithFormat:@"%d", score];
	scoreDisplay.text = scoreString;
    
    [button  setTitle:@"" forState:UIControlStateNormal];
    [button2  setTitle:@"" forState:UIControlStateNormal];
    [button3  setTitle:@"" forState:UIControlStateNormal];
    [button4  setTitle:@"" forState:UIControlStateNormal];
        
    
    int powerUp1 = arc4random() % 8;
    int powerUp2 = arc4random() % 8;
    int powerUp3 = arc4random() % 8;
    int powerUp4 = arc4random() % 8;
    
    while(powerUp1 == powerUp2 || powerUp1 == powerUp3 || powerUp4 == powerUp1 ||
          powerUp2 == powerUp3 || powerUp3 == powerUp4 || powerUp2 == powerUp4)
    {
        powerUp1 = arc4random() % 8;
        powerUp3 = arc4random() % 8;
        powerUp4 = arc4random() % 8;
    }
    
   // int powerUpButton = arc4random() % 4;
   // int nextButton1 = arc4random() % 4;
   // while(powerUpButton == nextButton1)
      //  nextButton1 = arc4random() % 4;
   // while(prevNum == nextButton1)
     //   nextButton1 = arc4random() % 4;
    
    switch (powerUp1) {
        case 0:
            [button setTitle:@"-3" forState:UIControlStateNormal];
            break;
        case 1:
            [button setTitle:@"-2" forState:UIControlStateNormal];
            break;
        case 2:
            [button setTitle:@"-1" forState:UIControlStateNormal];
            break;
        case 3:
            [button setTitle:@"+1" forState:UIControlStateNormal];
            break;
        case 4:
            [button setTitle:@"+2" forState:UIControlStateNormal];
            break;
        case 5:
            [button setTitle:@"+3" forState:UIControlStateNormal];
            break;
        case 6:
            [button setTitle:@"+5" forState:UIControlStateNormal];
            break;
        case 7:
            [button setTitle:@"-5" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    switch (powerUp2) {
        case 0:
            [button2 setTitle:@"-3" forState:UIControlStateNormal];
            break;
        case 1:
            [button2 setTitle:@"-2" forState:UIControlStateNormal];
            break;
        case 2:
            [button2 setTitle:@"-1" forState:UIControlStateNormal];
            break;
        case 3:
            [button2 setTitle:@"+1" forState:UIControlStateNormal];
            break;
        case 4:
            [button2 setTitle:@"+2" forState:UIControlStateNormal];
            break;
        case 5:
            [button2 setTitle:@"+3" forState:UIControlStateNormal];
            break;
        case 6:
            [button2 setTitle:@"+5" forState:UIControlStateNormal];
            break;
        case 7:
            [button2 setTitle:@"-5" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    switch (powerUp3) {
        case 0:
            [button3 setTitle:@"-3" forState:UIControlStateNormal];
            break;
        case 1:
            [button3 setTitle:@"-2" forState:UIControlStateNormal];
            break;
        case 2:
            [button3 setTitle:@"-1" forState:UIControlStateNormal];
            break;
        case 3:
            [button3 setTitle:@"+1" forState:UIControlStateNormal];
            break;
        case 4:
            [button3 setTitle:@"+2" forState:UIControlStateNormal];
            break;
        case 5:
            [button3 setTitle:@"+3" forState:UIControlStateNormal];
            break;
        case 6:
            [button3 setTitle:@"+5" forState:UIControlStateNormal];
            break;
        case 7:
            [button3 setTitle:@"-5" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    switch (powerUp4) {
        case 0:
            [button4 setTitle:@"-3" forState:UIControlStateNormal];
            break;
        case 1:
            [button4 setTitle:@"-2" forState:UIControlStateNormal];
            break;
        case 2:
            [button4 setTitle:@"-1" forState:UIControlStateNormal];
            break;
        case 3:
            [button4 setTitle:@"+1" forState:UIControlStateNormal];
            break;
        case 4:
            [button4 setTitle:@"+2" forState:UIControlStateNormal];
            break;
        case 5:
            [button4 setTitle:@"+3" forState:UIControlStateNormal];
            break;
        case 6:
            [button4 setTitle:@"+5" forState:UIControlStateNormal];
            break;
        case 7:
            [button4 setTitle:@"-5" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}



 -(IBAction)resetHighScore
{
    classic1HighScore = 0;
    classic1HighScoreDisplay.text = @"0";
    
    classic30HighScore = 0;
    classic30HighScoreDisplay.text = @"0";
	
    endure1HighScore = 0;
    endure1HighScoreDisplay.text = @"0";
	
    endure30HighScore = 0;
    endure30HighScoreDisplay.text = @"0";
    
    dontTap30HighScore = 0;
    dontTap30HighScoreDisplay.text = @"0";
    
    dontTap1HighScore = 0;
    dontTap1HighScoreDisplay.text = @"0";
    
    taparoo30HighScore = 0;
    taparoo30HighScoreDisplay.text = @"0";
    
    taparoo1HighScore = 0;
    taparoo1HighScoreDisplay.text = @"0";

    taparooScore = 0;
    taparooHighScoreDisplay.text = @"0";
    
    NSString* message = @"Your local high scores have been reset.";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"High Scores Reset" message:message delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
    [alert release];
    [message release];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"Classic30HighScoreKey"];
    [defaults setInteger:0 forKey:@"Classic1HighScoreKey"];
    [defaults setInteger:0 forKey:@"Endure30HighScoreKey"];
    [defaults setInteger:0 forKey:@"Endure1HighScoreKey"];
    [defaults setInteger:0 forKey:@"DontTap30HighScoreKey"];
    [defaults setInteger:0 forKey:@"DontTap1HighScoreKey"];
    [defaults setInteger:0 forKey:@"Taparoo30HighScoreKey"];
    [defaults setInteger:0 forKey:@"Taparoo1HighScoreKey"];
    
    [defaults synchronize];
    
    
    
}


-(IBAction)showSettings
{
    howToPlayImage.hidden = true;
    button.hidden = TRUE;
    button2.hidden = true;
    button3.hidden = TRUE;
    button4.hidden = true;
    
    settings.hidden = true;
    submitAllHighScores.hidden = false;
    resetAllHighScores.hidden = false;
    personalizeButton.hidden = false;
    mainMenuButton2.hidden = false;
    
    taparooHighScoreDisplay.hidden = true;
    taparooHighScoreLabel.hidden = true;
    chooseYourGameModeLabel.hidden = true;
    rules.hidden = false;
    showLeaderboardsButton.hidden = true;
    classicButton.hidden = true;
    endureButton.hidden = true;
    dontTapButton.hidden = true;
    taparooButton.hidden = true;
    backButton.hidden = true;
    backButtonLabel.hidden = true;
    buttonColorChanger1.hidden = true;
    textColorLabel.hidden = true;
    buttonColorLabel.hidden = true;
    colorPalette.hidden = true;
    colorText.hidden = true;
    personalizeLabel.hidden = true;
    resetButtonColorsButton.hidden = true;
    resetButtonColorsLabel.hidden = true;
    
}

-(void)submitAllScoresDoe
{
    GKScore *classic1Reporter = [[[GKScore alloc] initWithCategory:@"2"] autorelease];
    classic1Reporter.value = score;
    
    [classic1Reporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
         {
             NSLog(@"Submitting a score failed.");
         }
         else
             NSLog(@"Submitting score succeeded.");
     }];
    
    GKScore *classic30Reporter = [[[GKScore alloc] initWithCategory:@"1"] autorelease];
    classic30Reporter.value = score;
    
    [classic30Reporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
             NSLog(@"Submitting a score failed.");
         else
             NSLog(@"Submitting score succeeded.");
     }];
    
    GKScore *endure30Reporter = [[[GKScore alloc] initWithCategory:@"3"] autorelease];
    endure30Reporter.value = score;
    
    [endure30Reporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
             NSLog(@"Submitting a score failed.");
         else
             NSLog(@"Submitting score succeeded.");
     }];
    
    GKScore *endure1Reporter = [[[GKScore alloc] initWithCategory:@"4"] autorelease];
    endure1Reporter.value = score;
    
    [endure1Reporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
             NSLog(@"Submitting a score failed.");
         else
             NSLog(@"Submitting score succeeded.");
     }];
    
    GKScore *taparooReporter = [[[GKScore alloc] initWithCategory:@"5"] autorelease];
    taparooReporter.value = newTaparooScore;
    
    [taparooReporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
             NSLog(@"Submitting a score failed.");
         else
             NSLog(@"Submitting score succeeded.");
     }];
   
    GKScore *dontTap30Reporter = [[[GKScore alloc] initWithCategory:@"6"] autorelease];
    dontTap30Reporter.value = score;
    
    [dontTap30Reporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
             NSLog(@"Submitting a score failed.");
         else
             NSLog(@"Submitting score succeeded.");
     }];
    
    GKScore *dontTap1Reporter = [[[GKScore alloc] initWithCategory:@"7"] autorelease];
    dontTap1Reporter.value = score;
    
    [dontTap1Reporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
             NSLog(@"Submitting a score failed.");
         else
             NSLog(@"Submitting score succeeded.");
     }];
    
    GKScore *taparoo30Reporter = [[[GKScore alloc] initWithCategory:@"8"] autorelease];
    taparoo30Reporter.value = score;
    
    [taparoo30Reporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
             NSLog(@"Submitting a score failed.");
         else
             NSLog(@"Submitting score succeeded.");
     }];
    
    GKScore *taparoo1Reporter = [[[GKScore alloc] initWithCategory:@"9"] autorelease];
    taparoo1Reporter.value = score;
    
    [taparoo1Reporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
             NSLog(@"Submitting a score failed.");
         else
             NSLog(@"Submitting score succeeded.");
     }];

    
}

-(IBAction)submitAllScores
{
    [self submitAllScoresDoe];
    [self submitAllScoresDoe];
    [self submitAllScoresDoe];
    
    NSString* message = @"Your scores should now be submitted to the leaderboards.";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"High Scores Submitted" message:message delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
    [alert release];
    [message release];
}

-(void)gameOver
{
	[button setTitle:@"Game" forState:UIControlStateNormal];
	[button2 setTitle:@"Over!" forState:UIControlStateNormal];
	[button3 setTitle:@"Game" forState:UIControlStateNormal];
	[button4 setTitle:@"Over!" forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    button2.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    button3.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    button4.titleLabel.font = [UIFont boldSystemFontOfSize:13];
	
	[timer invalidate];
	timer = nil;
    [scatterTimer invalidate];
    scatterTimer = nil;
    
    isGameOver = true;
    gameStarted = false;
	
	if(classic1Mode)
	{
        
        if(score >= 100)
        {
            identifier = kAchievementKeepTappin;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        if(score >= 115)
        {
            identifier = kAchievementFingersMadeTappin;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        if(score >= 130)
        {
            identifier = kAchievementHeyPrettyGood;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
          
        
        
        
        GKScore *classic1Reporter = [[[GKScore alloc] initWithCategory:@"2"] autorelease];
        classic1Reporter.value = score;
        
        [classic1Reporter reportScoreWithCompletionHandler:^(NSError *error)
         {
             if(error != nil)
                 NSLog(@"Submitting a score failed.");
             else
                 NSLog(@"Submitting score succeeded.");
         }];

        
		if(score > classic1HighScore)
		{
            classic1HighScore = score;
            NSString* classic1HighScoreString = [[NSString alloc] initWithFormat:@"%d", classic1HighScore];
            classic1HighScoreDisplay.text = classic1HighScoreString;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:classic1HighScore forKey:@"Classic1HighScoreKey"];
            [defaults synchronize];
            
            taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
            newTaparooScore = taparooScore + dontTap30HighScore + dontTap1HighScore + taparoo30HighScore + taparoo1HighScore;
            
            NSString* taparooHighScoreString = [[NSString alloc] initWithFormat:@"%d", newTaparooScore];
            
            taparooHighScoreDisplay.text = taparooHighScoreString;

        }
	}
	
	else if(classic30Mode)
	{
        if(score >= 50)
        {
            identifier = kAchievementFastFingers;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        if(score >= 60)
        {
            identifier = kAchievementQuickTapping;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        if(score >= 70)
        {
            identifier = kAchievementTaparooFingers;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        if(score == 1)
        {
            identifier = kAchievementQuickLoss;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
       
        
        GKScore *classic30Reporter = [[[GKScore alloc] initWithCategory:@"1"] autorelease];
        classic30Reporter.value = score;
        
        [classic30Reporter reportScoreWithCompletionHandler:^(NSError *error)
         {
             if(error != nil)
                 NSLog(@"Submitting a score failed.");
             else
                 NSLog(@"Submitting score succeeded.");
         }];
        
		if(score > classic30HighScore)
		{
			classic30HighScore = score;
			NSString* classic30HighScoreString = [[NSString alloc] initWithFormat:@"%d", classic30HighScore];
            classic30HighScoreDisplay.text = classic30HighScoreString;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:classic30HighScore forKey:@"Classic30HighScoreKey"];
            [defaults synchronize];
            
            taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
            newTaparooScore = taparooScore + dontTap30HighScore + dontTap1HighScore + taparoo30HighScore + taparoo1HighScore;
            
            
            NSString* taparooHighScoreString = [[NSString alloc] initWithFormat:@"%d", newTaparooScore];
            
            taparooHighScoreDisplay.text = taparooHighScoreString;

		}
	}
	
	else if(endure1Mode)
	{
        if(score >= 100)
        {
            identifier = kAchievementLongTap;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        if(score >= 115)
        {
            identifier = kAchievementLongerTap;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        if(score >= 130)
        {
            identifier = kAchievementAlottaTappin;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        
        if(score == 0)
        {
            identifier = kAchievementBored;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                        
                }];
            }
                
        }
        
        
        GKScore *endure1Reporter = [[[GKScore alloc] initWithCategory:@"4"] autorelease];
        endure1Reporter.value = score;
        
        [endure1Reporter reportScoreWithCompletionHandler:^(NSError *error)
         {
             if(error != nil)
                 NSLog(@"Submitting a score failed.");
             else
                 NSLog(@"Submitting score succeeded.");
         }];

        
		if(score > endure1HighScore)
		{
			endure1HighScore = score;
            NSString* endure1HighScoreString = [[NSString alloc] initWithFormat:@"%d", endure1HighScore];
            endure1HighScoreDisplay.text = endure1HighScoreString;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:endure1HighScore forKey:@"Endure1HighScoreKey"];
            [defaults synchronize];
			            
            taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
            newTaparooScore = taparooScore + dontTap30HighScore + dontTap1HighScore + taparoo30HighScore + taparoo1HighScore;
            
            
            NSString* taparooHighScoreString = [[NSString alloc] initWithFormat:@"%d", newTaparooScore];
            
            taparooHighScoreDisplay.text = taparooHighScoreString;

		}
	}
	
	else if(endure30Mode)
	{
        
        if(score >= 50)
        {
            identifier = kAchievementEnduring;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        if(score >= 60)
        {
            identifier = kAchievementJustKeepTapping;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        if(score >= 70)
        {
            identifier = kAchievementEnduranceMaster;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                    if(error != nil){
                        NSLog(@"Achievement failed");
                    } else {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
        
        GKScore *endure30Reporter = [[[GKScore alloc] initWithCategory:@"3"] autorelease];
        endure30Reporter.value = score;
        
        [endure30Reporter reportScoreWithCompletionHandler:^(NSError *error)
         {
             if(error != nil)
                 NSLog(@"Submitting a score failed.");
             else
                 NSLog(@"Submitting score succeeded.");
         }];
        
		if(score > endure30HighScore)
		{
			endure30HighScore = score;
            NSString* endure30HighScoreString = [[NSString alloc] initWithFormat:@"%d", endure30HighScore];
            endure30HighScoreDisplay.text = endure30HighScoreString;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:endure30HighScore forKey:@"Endure30HighScoreKey"];
            [defaults synchronize];
            taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
            newTaparooScore = taparooScore + dontTap30HighScore + dontTap1HighScore + taparoo30HighScore + taparoo1HighScore;
            
            
            NSString* taparooHighScoreString = [[NSString alloc] initWithFormat:@"%d", newTaparooScore];
            
            taparooHighScoreDisplay.text = taparooHighScoreString;
            

		}
	}
    
    GKScore *taparooReporter = [[[GKScore alloc] initWithCategory:@"5"] autorelease];
    taparooReporter.value = newTaparooScore;
    
    [taparooReporter reportScoreWithCompletionHandler:^(NSError *error)
     {
         if(error != nil)
             NSLog(@"Submitting a score failed.");
         else
             NSLog(@"Submitting score succeeded.");
     }];
    
    
    if(taparooScore >= 250)
    {
        identifier = kAchievementTaparooIsOkay;
        GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
        achievement.percentComplete = 100.0;
        if(achievement!= NULL)
        {
            [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                if(error != nil){
                    NSLog(@"Achievement failed");
                } else {
                    NSLog(@"Achievement success");
                }
                
            }];
        }
        
    }
    
    if(taparooScore >= 300)
    {
        identifier = kAchievementTaparooIsCool;
        GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
        achievement.percentComplete = 100.0;
        if(achievement!= NULL)
        {
            [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                if(error != nil){
                    NSLog(@"Achievement failed");
                } else {
                    NSLog(@"Achievement success");
                }
                
            }];
        }
        
    }
    
    if(taparooScore >= 350)
    {
        identifier = kAchievementTaparooIsFun;
        GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
        achievement.percentComplete = 100.0;
        if(achievement!= NULL)
        {
            [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                if(error != nil){
                    NSLog(@"Achievement failed");
                } else {
                    NSLog(@"Achievement success");
                }
                
            }];
        }
        
    }
    
    if(taparooScore >= 400)
    {
        identifier = kAchievementTapTapTaparoo;
        GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
        achievement.percentComplete = 100.0;
        if(achievement!= NULL)
        {
            [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                if(error != nil){
                    NSLog(@"Achievement failed");
                } else {
                    NSLog(@"Achievement success");
                }
                
            }];
        }
        
    }
    
    if(classic1HighScore > 0 && classic30HighScore > 0 && endure1HighScore > 0 && endure30HighScore > 0)
    {
        identifier = kAchievementExperimental;
        GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
        achievement.percentComplete = 100.0;
        if(achievement!= NULL)
        {
            [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                if(error != nil){
                    NSLog(@"Achievement failed");
                } else {
                    NSLog(@"Achievement success");
                }
                
            }];
        }
    }
    
    if(dontTap30Mode)
    {
        GKScore *dontTap30Reporter = [[[GKScore alloc] initWithCategory:@"6"] autorelease];
        dontTap30Reporter.value = score;
        
        [dontTap30Reporter reportScoreWithCompletionHandler:^(NSError *error)
         {
             if(error != nil)
                 NSLog(@"Submitting a score failed.");
             else
                 NSLog(@"Submitting score succeeded.");
         }];
        
        if(score > dontTap30HighScore)
        {
            dontTap30HighScore = score;
            NSString* dontTap30HighScoreString = [[NSString alloc] initWithFormat:@"%d", dontTap30HighScore];
            
            dontTap30HighScoreDisplay.text = dontTap30HighScoreString;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:dontTap30HighScore forKey:@"DontTap30HighScoreKey"];
            [defaults synchronize];
            
            taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
            newTaparooScore = taparooScore + dontTap30HighScore + dontTap1HighScore + taparoo30HighScore + taparoo1HighScore;
            
            NSString* taparooHighScoreString = [[NSString alloc] initWithFormat:@"%d", newTaparooScore];
            
            taparooHighScoreDisplay.text = taparooHighScoreString;
        }
    }
    
    
    
    else if(dontTap1Mode)
    {
        
        GKScore *dontTap1Reporter = [[[GKScore alloc] initWithCategory:@"7"] autorelease];
        dontTap1Reporter.value = score;
        
        [dontTap1Reporter reportScoreWithCompletionHandler:^(NSError *error)
         {
             if(error != nil)
                 NSLog(@"Submitting a score failed.");
             else
                 NSLog(@"Submitting score succeeded.");
         }];
        
        if(score > dontTap1HighScore)
        {
            dontTap1HighScore = score;
            NSString* dontTap1HighScoreString = [[NSString alloc] initWithFormat:@"%d", dontTap1HighScore];
            
            dontTap1HighScoreDisplay.text = dontTap1HighScoreString;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:dontTap1HighScore forKey:@"DontTap1HighScoreKey"];
            [defaults synchronize];
            
            taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
            newTaparooScore = taparooScore + dontTap30HighScore + dontTap1HighScore + taparoo30HighScore + taparoo1HighScore;
            
            NSString* taparooHighScoreString = [[NSString alloc] initWithFormat:@"%d", newTaparooScore];
            
            taparooHighScoreDisplay.text = taparooHighScoreString;
        }
    }
    
    else if(taparoo30Mode)
    {
        GKScore *taparoo30Reporter = [[[GKScore alloc] initWithCategory:@"8"] autorelease];
        taparoo30Reporter.value = score;
        
        [taparoo30Reporter reportScoreWithCompletionHandler:^(NSError *error)
         {
             if(error != nil)
                 NSLog(@"Submitting a score failed.");
             else
                 NSLog(@"Submitting score succeeded.");
         }];
        
        if(score > taparoo30HighScore)
        {
            taparoo30HighScore = score;
            NSString* taparoo30HighScoreString = [[NSString alloc] initWithFormat:@"%d", taparoo30HighScore];
            
            taparoo30HighScoreDisplay.text = taparoo30HighScoreString;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:taparoo30HighScore forKey:@"Taparoo30HighScoreKey"];
            [defaults synchronize];
            
            taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
            newTaparooScore = taparooScore + dontTap30HighScore + dontTap1HighScore + taparoo30HighScore + taparoo1HighScore;
            
            NSString* taparooHighScoreString = [[NSString alloc] initWithFormat:@"%d", newTaparooScore];
            
            taparooHighScoreDisplay.text = taparooHighScoreString;
        }
    }
    
    else if(taparoo1Mode)
    {
        GKScore *taparoo1Reporter = [[[GKScore alloc] initWithCategory:@"9"] autorelease];
        taparoo1Reporter.value = score;
        
        [taparoo1Reporter reportScoreWithCompletionHandler:^(NSError *error)
         {
             if(error != nil)
                 NSLog(@"Submitting a score failed.");
             else
                 NSLog(@"Submitting score succeeded.");
         }];
        
        if(score > taparoo1HighScore)
        {
            taparoo1HighScore = score;
            NSString* taparoo1HighScoreString = [[NSString alloc] initWithFormat:@"%d", taparoo1HighScore];
            
            taparoo1HighScoreDisplay.text = taparoo1HighScoreString;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:taparoo1HighScore forKey:@"Taparoo1HighScoreKey"];
            [defaults synchronize];
            
            taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
            newTaparooScore = taparooScore + dontTap30HighScore + dontTap1HighScore + taparoo30HighScore + taparoo1HighScore;
            
            NSString* taparooHighScoreString = [[NSString alloc] initWithFormat:@"%d", newTaparooScore];
            
            taparooHighScoreDisplay.text = taparooHighScoreString;
        }
    }
     
}  


-(IBAction)click: (id)sender
{
    
	NSString *title = [sender titleForState:UIControlStateNormal];
	
    if(taparoo30Mode || taparoo1Mode)
    {
       if(allTap)
        {
            one = button.center;
            two = button3.center;
            three = button4.center;
            four = button2.center;
            
            scatterTimer = [NSTimer 
                 scheduledTimerWithTimeInterval:.02
                 target:self 
                 selector:@selector(scatterButtons) 
                 userInfo:nil			 
                 repeats:YES];
        }
    }
    if(classic30Mode || classic1Mode || endure30Mode || endure1Mode || taparoo30Mode || taparoo1Mode)
    {
    
        if(paused) {}
    
        else
        {
            if(allTap)
            {
                timer = [NSTimer 
                         scheduledTimerWithTimeInterval:0.1
                         target:self 
                         selector:@selector(updateTimerDisplay) 
                         userInfo:nil			 
                         repeats:YES];
                timerDisplay.text = [NSString stringWithFormat:@":%.1lf", timeLeft];
                allTap = FALSE;
                ++score;
                gameStarted = true;
                [self chooseNextButton];
            }
    
            else if(title == @"Tap It!")
            {
                ++score;
                [self chooseNextButton];
                allTap = FALSE;
            }
        
            else if(!hasSetTitle) {}
            else if(classic1Mode || classic30Mode || taparoo1Mode || taparoo30Mode)
                [self gameOver];
            else if(endure30Mode || endure1Mode)
            {
                if(title == @"Game" || title == @"Over!") {}
                else 
                {
                    if(score <= 0) {}
                    else
                        --score;
                    [self chooseNextButton];
                }
            }
        
            if(classic1Mode || classic30Mode || endure1Mode || endure30Mode)
            {
                // [self setTapIt];
            
                button.hidden = FALSE;
                button2.hidden = FALSE;
                button3.hidden = FALSE;
                button4.hidden = FALSE;

            }
        }
    
        if(isShowRules)
        {
            identifier = kAchievementReadyToPlay;
            GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
            achievement.percentComplete = 100.0;
            if(achievement!= NULL)
            {
                [achievement reportAchievementWithCompletionHandler: ^(NSError *error)
                {
                    if(error != nil)
                    {
                        NSLog(@"Achievement failed");
                    } 
                    else 
                    {
                        NSLog(@"Achievement success");
                    }
                    
                }];
            }
        }
        
    }
    
    else if(dontTap30Mode || dontTap1Mode)
    {
        if(isGameOver) {}
        else
        {
            if(paused) {}
            else
            {
                if(!gameStarted)
                {
                    timer = [NSTimer 
                             scheduledTimerWithTimeInterval:0.1
                             target:self 
                             selector:@selector(updateTimerDisplay) 
                             userInfo:nil			 
                             repeats:YES];
                    timerDisplay.text = [NSString stringWithFormat:@":%.1lf", timeLeft];
                    allTap = FALSE;
                    [self chooseNextButtonDont];
                    gameStarted = true;
                    
                    button.titleLabel.font = [UIFont systemFontOfSize:17];
                    button2.titleLabel.font = [UIFont systemFontOfSize:17];
                    button3.titleLabel.font = [UIFont systemFontOfSize:17];
                    button4.titleLabel.font = [UIFont systemFontOfSize:17];

                }
                /*
                if(title == @"Taparoo!")
                { 
                    tap = true;
                    stop = 5;
                }
                if(title == @"x2")
                {
                    x2 = true;
                    stop = 5;
                    scoreUp = scoreUp * 2;
                    [self chooseNextButtonDont];
                }
                if(title == @"x3")
                {
                    x3 = true;
                    stop = 5;
                    scoreUp = scoreUp * 3;
                    [self chooseNextButtonDont];
                }
                if(title == @"x0.5")
                {
                    xhalf = true;
                    stop = 5;
                    scoreUp = scoreUp / 2;
                    [self chooseNextButtonDont];
                }*/
                if(title == @"Tap It!" || title == @"+1")
                {
                    buttonIsGlowing = false;
                    ++score;
                    [self chooseNextButtonDont];
                }
                else if(title == @"+2")
                {
                    score += 2;
                    [self chooseNextButtonDont];
                }
                else if(title == @"+3")
                {
                    score += 3;
                    [self chooseNextButtonDont];
                }
                else if(title == @"-1")
                {
                    if(score > 0) score -= 1;
                    else score = 0;
                    [self chooseNextButtonDont];
                }
                else if(title == @"-2")
                {
                    if(score > 1) score -= 2;
                    else score = 0;
                    [self chooseNextButtonDont];
                }
                else if(title == @"-3") 
                { 
                    if(score > 2) score -= 3;
                    else score = 0;
                    [self chooseNextButtonDont];
                }
                else if(title == @"-5")
                {
                    if(score > 4) score -= 5;
                    else score = 0;
                    [self chooseNextButtonDont];
                }
                else if(title == @"+5")
                {
                    score += 5;
                    [self chooseNextButtonDont];
                }
                else if(tap) {[self chooseNextButtonDont];}
                else if(title == @"")
                {
                    [self gameOver];
                }
            }
        }
    }
}

-(IBAction)chooseNextButton
{
	NSString* scoreString = [[NSString alloc] initWithFormat:@"%d", score];
	scoreDisplay.text = scoreString;
	
	[button setTitle:@"" forState:UIControlStateNormal];
	[button2 setTitle:@"" forState:UIControlStateNormal];
	[button3 setTitle:@"" forState:UIControlStateNormal];
	[button4 setTitle:@"" forState:UIControlStateNormal];
	
	int nextButton = arc4random() % 4;
    while(prevNum == nextButton)
        nextButton = arc4random() % 4;
	if(nextButton == 0)
		[button  setTitle:@"Tap It!" forState:UIControlStateNormal];
	else if(nextButton == 1)
		[button2 setTitle:@"Tap It!" forState:UIControlStateNormal];
	else if(nextButton == 2)
		[button3 setTitle:@"Tap It!" forState:UIControlStateNormal];
	else
		[button4 setTitle:@"Tap It!" forState:UIControlStateNormal];
    
    prevNum = nextButton;
}	

-(void)updateTimerDisplay;
{
    if(paused) {}
    else
    {
        timeLeft -= 0.1;
        if(classic30Mode || endure30Mode)
        {
            if(timeLeft >= 20.0 && score >= 20)
            {
                identifier = kAchievementGoodStart;
                GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
                achievement.percentComplete = 100.0;
                if(achievement!= NULL)
                {
                    [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                        if(error != nil){
                            NSLog(@"Achievement failed GOOD START");
                        } else {
                            NSLog(@"Achievement success GOOD START");
                        }
                        
                    }];
                }
            
            }
        }
        
        else if(classic1Mode || endure1Mode)
        {
            if(timeLeft >= 50.0 && score >= 20)
            {
                identifier = kAchievementGoodStart;
                GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
                achievement.percentComplete = 100.0;
                if(achievement!= NULL)
                {
                    [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
                        if(error != nil){
                            NSLog(@"Achievement failed");
                        } else {
                            NSLog(@"Achievement success");
                        }
                        
                    }];
                }
                
            }

        }
        
        else {}
        
        if(timeLeft <= 0)
        {
            timerDisplay.text = [NSString stringWithFormat:@":0.00"];
            [self gameOver];
        }
        else
            timerDisplay.text = [NSString stringWithFormat:@":%.1lf", timeLeft];
    
        
    }
}

-(IBAction)mainMenu
{
    [timer invalidate];
	timer = nil;
    [scatterTimer invalidate];
    scatterTimer = nil;
    
    counterScatter = 0;
    howToPlayImage.hidden = true;
    stop = 5;
    tap = false;
    x2 = false;
    x3 = false;
    xhalf = false;
    gameStarted = false;
    score = 0;
    scoreDisplay.text = @"0";
    classicButton.hidden = false;
    endureButton.hidden = false;
    dontTapButton.hidden = false;
    taparooButton.hidden = false;
	timeLeftLabel.hidden = TRUE;
	timerDisplay.hidden = TRUE;
	scoreLabel.hidden = TRUE;
	scoreDisplay.hidden = TRUE;
	start.hidden = TRUE;
	//reset.hidden = TRUE;
	mainMenuButton.hidden = TRUE;
	mainMenuButton2.hidden = TRUE;
	highScoreLabel.hidden = TRUE;
	classic1HighScoreDisplay.hidden = TRUE;
	classic30HighScoreDisplay.hidden = TRUE;
	endure1HighScoreDisplay.hidden = TRUE;
	endure30HighScoreDisplay.hidden = TRUE;
    dontTap1HighScoreDisplay.hidden = true;
    dontTap30HighScoreDisplay.hidden = true;
    taparoo1HighScoreDisplay.hidden = true;
    taparoo30HighScoreDisplay.hidden = true;
	chooseYourGameModeLabel.hidden = FALSE;
	hasSetTitle = FALSE;
    /*
	b.hidden = TRUE;
	b2.hidden = TRUE;
	b3.hidden = TRUE;
	b4.hidden = TRUE;
     */
	button.hidden = true;
	button2.hidden = true;
	button3.hidden = true;
	button4.hidden = true;
	rules.hidden = FALSE;
    showLeaderboardsButton.hidden = FALSE;
    
    taparooHighScoreDisplay.hidden = FALSE;
    taparooHighScoreLabel.hidden = FALSE;
	
	classic1Mode = FALSE;
	classic30Mode = FALSE;
	endure30Mode = FALSE;
	endure1Mode = FALSE;
    dontTap30Mode = false;
    dontTap1Mode = false;
    taparoo30Mode = false;
    taparoo1Mode = false;
    
    pausebutton.hidden = TRUE;
    playbutton.hidden = TRUE;
    paused = FALSE;
    
    allTap = FALSE;
    
    isShowRules = FALSE;
    
    rules.hidden = true;
    settings.hidden = false;
    showLeaderboardsButton.hidden = false;
    submitAllHighScores.hidden = true;
    resetAllHighScores.hidden = true;
    chooseYourTimingOptionLabel.hidden = true;
    thirtyButton.hidden = true;
    minuteButton.hidden = true;
    pauseExpiration = false;
    isGameOver = false;
    resetButtonColorsButton.hidden = true;
    resetButtonColorsLabel.hidden = true;
    buttonColorLabel.hidden = true;
    textColorLabel.hidden = true;
    personalizeLabel.hidden = true;
    
    classicMode = false;
    endureMode = false;
    dontTapMode = false;
    taparooMode = false;
    
    [self setAllColorChangingModesToFalse];
    buttonColorChanger1.hidden = true;
    colorPalette.hidden = true;
    colorText.hidden = true;
    personalizeMode = false;
    personalizeButton.hidden = true;
    backButton.hidden = true;
    backButtonLabel.hidden = true;
    smallButton.hidden = true;
    tapItButton.hidden = true;
    scoreUp = 2;
	
	[button setTitle:@"Classic :30" forState:UIControlStateNormal];
	[button2 setTitle:@"Classic 1:" forState:UIControlStateNormal];
	[button3 setTitle:@"Endure :30" forState:UIControlStateNormal];
	[button4 setTitle:@"Endure 1:" forState:UIControlStateNormal];
	score = 0;
	
	[timer invalidate];
	timer = nil;
    
    
    [self resetButtonPositions];
}

-(IBAction)PauseResume
{
    if(!gameStarted) {}
    else
    {
    
    
    if(paused)
    {
        paused = FALSE;
        pausebutton.hidden = TRUE;
        playbutton.hidden = TRUE;
    }
    else 
    {
        if(pauseExpiration)
        {playbutton.hidden = true;
            pausebutton.hidden = true;}
        else{
        paused = TRUE;
        pausebutton.hidden = TRUE;
        playbutton.hidden = FALSE;
            pauseExpiration = true;}
    }
    
    identifier = kAchievementBetterThings;
    GKAchievement *achievement= [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
    achievement.percentComplete = 100.0;
    if(achievement!= NULL)
    {
        [achievement reportAchievementWithCompletionHandler: ^(NSError *error){
            if(error != nil){
                NSLog(@"Achievement failed");
            } else {
                NSLog(@"Achievement success");
            }
                
        }];
    }
    }
}

+(Tap_itViewController *) notificationPause
{
    paused = TRUE;
   // playbutton.hidden = FALSE;
   // pausebutton.hidden = TRUE;
}

-(IBAction)showLeader
{
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if(leaderboardController != nil)
    {
        leaderboardController.leaderboardDelegate = self;
        [self presentModalViewController:leaderboardController animated:TRUE];
        
    }
}

-(void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [self dismissModalViewControllerAnimated:TRUE];
}

-(IBAction)showAchievements
{
    GKAchievementViewController *achievements = [[GKAchievementViewController alloc] init];
    if (achievements != NULL)
    {
        achievements.achievementDelegate = self;
        [self presentModalViewController: achievements animated: YES];
    }
}

-(void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController;
{
    [self dismissModalViewControllerAnimated: YES];
    [viewController release];
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
   
   //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage       imageNamed:@"bg1.png"]];
    
	classic1HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Classic1HighScoreKey"];
	classic30HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Classic30HighScoreKey"];
	endure1HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Endure1HighScoreKey"];
	endure30HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Endure30HighScoreKey"];
    dontTap30HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"DontTap30HighScoreKey"];
    dontTap1HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"DontTap1HighScoreKey"];
    taparoo30HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Taparoo30HighScoreKey"];
    taparoo1HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Taparoo1HighScoreKey"];
    
    progressAsIntFor1 = [[NSUserDefaults standardUserDefaults] integerForKey:@"Progress1Key"];
    progressAsIntFor2 = [[NSUserDefaults standardUserDefaults] integerForKey:@"Progress2Key"];
    progressAsIntFor3 = [[NSUserDefaults standardUserDefaults] integerForKey:@"Progress3Key"];
    progressAsIntFor4 = [[NSUserDefaults standardUserDefaults] integerForKey:@"Progress4Key"];
    
    text1white = [[NSUserDefaults standardUserDefaults] boolForKey:@"Text1Key"];
    text2white = [[NSUserDefaults standardUserDefaults] boolForKey:@"Text2Key"];
    text3white = [[NSUserDefaults standardUserDefaults] boolForKey:@"Text3Key"];
    text4white = [[NSUserDefaults standardUserDefaults] boolForKey:@"Text4Key"];
    
    if(text1white)
    {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [classicButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [thirtyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else
    {
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [classicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [thirtyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if(text2white)
    {
        [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [endureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [minuteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else
    {
        [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [endureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [minuteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if(text3white)
    {
        [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [dontTapButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else
    {
        [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [dontTapButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if(text4white)
    {
        [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [taparooButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else
    {
        [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [taparooButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    [self loadButtonColors:progressAsIntFor1 :1];
    [self loadButtonColors:progressAsIntFor2 :2];
    [self loadButtonColors:progressAsIntFor3 :3];
    [self loadButtonColors:progressAsIntFor4 :4];

	NSString* classic1HighScoreString = [[NSString alloc] initWithFormat:@"%i", classic1HighScore];
	NSString* classic30HighScoreString = [[NSString alloc] initWithFormat:@"%i", classic30HighScore];
	NSString* endure1HighScoreString = [[NSString alloc] initWithFormat:@"%i", endure1HighScore];
	NSString* endure30HighScoreString = [[NSString alloc] initWithFormat:@"%i", endure30HighScore];
    NSString* dontTap30HighScoreString = [[NSString alloc] initWithFormat:@"%i", dontTap30HighScore];
    NSString* dontTap1HighScoreString = [[NSString alloc] initWithFormat:@"%i", dontTap1HighScore];
    NSString* taparoo30HighScoreString = [[NSString alloc] initWithFormat:@"%i", taparoo30HighScore];
    NSString* taparoo1HighScoreString = [[NSString alloc] initWithFormat:@"%i", taparoo1HighScore];


	classic1HighScoreDisplay.text = classic1HighScoreString;
	classic30HighScoreDisplay.text = classic30HighScoreString;
	endure1HighScoreDisplay.text = endure1HighScoreString;
	endure30HighScoreDisplay.text = endure30HighScoreString;
    dontTap30HighScoreDisplay.text = dontTap30HighScoreString;
    dontTap1HighScoreDisplay.text = dontTap1HighScoreString;
    taparoo30HighScoreDisplay.text = taparoo30HighScoreString;
    taparoo1HighScoreDisplay.text = taparoo1HighScoreString;
    
    [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error) {
        if(error == nil)
            NSLog(@"Authentication Successful!");
        else
            NSLog(@"Authentication Failed!");
    }];
    
    
    taparooScore = classic1HighScore + classic30HighScore + endure1HighScore + endure30HighScore;
    newTaparooScore = taparooScore + dontTap30HighScore + dontTap1HighScore + taparoo30HighScore + taparoo1HighScore;
    
    NSString* taparooHighScoreString = [[NSString alloc] initWithFormat:@"%d", newTaparooScore];
    
    taparooHighScoreDisplay.text = taparooHighScoreString;
   /*
   [[NSNotificationCenter defaultCenter]
    addObserver:self
    selector:@selector(sessionStateChanged:)
    name:FBSessionStateChangedNotification
    object:nil];
   */
   
   // Check the session for a cached token to show the proper authenticated
   // UI. However, since this is not user intitiated, do not show the login UX.
   Tap_itAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
   [appDelegate openSessionWithAllowLoginUI:NO];
   
   [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
   
   [[NSNotificationCenter defaultCenter] removeObserver:self];
   
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc
{
	[button release];
	[button2 release];
	[button3 release];
	[button4 release];
	[start release];
	//[reset release];
	[mainMenuButton release];
	[mainMenuButton release];
	[scoreDisplay release];
	[scoreLabel release];
	[timer release];
	[timerDisplay release];
	[timeLeftLabel release];
	[classic1HighScoreDisplay release];
	[classic30HighScoreDisplay release];
	[endure1HighScoreDisplay release];
	[endure30HighScoreDisplay release];
    [dontTap30HighScoreDisplay release];
    [dontTap1HighScoreDisplay release];
    [taparoo30HighScoreDisplay release];
    [taparoo1HighScoreDisplay release];
    [taparooHighScoreDisplay release];
    [taparooHighScoreLabel release];
	[highScoreLabel release];
	[chooseYourGameModeLabel release];
    [chooseYourTimingOptionLabel release];
	[b release];
	[b2 release];
	[b3 release];
	[b4 release];
    [pausebutton release];
    [playbutton release];
    [showLeaderboardsButton release];
    [settings release];
    [submitAllHighScores release];
    [resetAllHighScores release];
    [personalizeButton release];
    [classicButton release];
    [endureButton release];
    [dontTapButton release];
    [taparooButton release];
    [thirtyButton release];
    [minuteButton release];
    [buttonColorChanger1 release];
    [colorText release];
    [colorPalette release];
    [resetButtonColorsButton release];
    [resetButtonColorsLabel release];
    [buttonColorLabel release];
    [textColorLabel release];
    [personalizeLabel release];
    [backButton release];
    [backButtonLabel release];
    [smallButton release];
    [tapItButton release];
    [powerUpTimer release];
    [scatterTimer release];
    [howToPlayImage release];
   // [gameCenterManager release];
    
    [super dealloc];
}

@end
