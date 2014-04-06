//
//  Tap_itViewController.h
//  Tap it
//
//  Created by Tony Albor on 7/14/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>

#import "GameCenterManager.h"
#import "Tap_itAppDelegate.h"
#define theAppDelegate ((MyAppDelegate *)[[UIApplication sharedApplication] delegate])


@class GameCenterManager;

@interface Tap_itViewController : UIViewController {
    ADBannerView *banner;
    
    GameCenterManager *gameCenterManager;
    
    
    //BOOL paused;
        
    UIButton *pausebutton;
    UIButton *playbutton;
    
	UIButton *button;	
	UIButton *button2;
	UIButton *button3;
	UIButton *button4;
	UIButton *start;
	//UIButton *reset;
	UIButton *mainMenuButton;
	UIButton *mainMenuButton2;

	UIButton *rules;
	UIButton *b;
	UIButton *b2;
	UIButton *b3;
	UIButton *b4;

	int score;
	UILabel *scoreDisplay;
	UILabel *scoreLabel;
	
	int classic1HighScore;
	int classic30HighScore;
	int endure1HighScore;
	int endure30HighScore;
    int dontTap30HighScore;
    int dontTap1HighScore;
    int taparoo30HighScore;
    int taparoo1HighScore;
    int taparooScore;
    int newTaparooScore;
    
	UILabel *classic1HighScoreDisplay;
	UILabel *classic30HighScoreDisplay;
	UILabel *endure1HighScoreDisplay;
	UILabel *endure30HighScoreDisplay;
    UILabel *dontTap30HighScoreDisplay;
    UILabel *dontTap1HighScoreDisplay;
    UILabel *taparoo30HighScoreDisplay;
    UILabel *taparoo1HighScoreDisplay;
    UILabel *taparooHighScoreDisplay;
    
    IBOutlet UILabel *taparooHighScoreLabel;
	IBOutlet UILabel *highScoreLabel;
	
	NSTimer *timer;
	double timeLeft;
	IBOutlet UILabel *timerDisplay;
	UILabel *timeLeftLabel;
	
	UILabel *chooseYourGameModeLabel;
    UILabel *chooseYourTimingOptionLabel;

    UIButton *showLeaderboardsButton;
    
    UIButton *settings;
    UIButton *submitAllHighScores;
    UIButton *resetAllHighScores;
    UIButton *personalizeButton;

    UIButton *classicButton;
    UIButton *endureButton;
    UIButton *dontTapButton;
    UIButton *taparooButton;
    
    UIButton *thirtyButton;
    UIButton *minuteButton;
    
    UISlider *buttonColorChanger1;
    UIImageView *colorPalette;
    UISegmentedControl *colorText;
    UIButton *resetButtonColorsButton;
    UILabel *resetButtonColorsLabel;
    UILabel *buttonColorLabel;
    UILabel *textColorLabel;
    UILabel *personalizeLabel;
    UILabel *backButtonLabel;
    UIButton *backButton;
    UIButton *smallButton;
    UIButton *tapItButton;
    NSTimer *powerUpTimer;
    
    UIImageView *howToPlayImage;
}

@property(nonatomic, retain) GameCenterManager *gameCenterManager;

@property (nonatomic, retain) IBOutlet UIButton *pausebutton;
@property (nonatomic, retain) IBOutlet UIButton *playbutton;


@property (nonatomic, retain) IBOutlet UIButton *button;
@property (nonatomic, retain) IBOutlet UIButton *button2;
@property (nonatomic, retain) IBOutlet UIButton *button3;
@property (nonatomic, retain) IBOutlet UIButton *button4;
@property (nonatomic, retain) IBOutlet UIButton *start;
//@property (nonatomic, retain) IBOutlet UIButton *reset;
@property (nonatomic, retain) IBOutlet UIButton *mainMenuButton;
@property (nonatomic, retain) IBOutlet UIButton *mainMenuButton2;
@property (nonatomic, retain) IBOutlet UIButton *rules;
@property (nonatomic, retain) IBOutlet UIButton *b;
@property (nonatomic, retain) IBOutlet UIButton *b2;
@property (nonatomic, retain) IBOutlet UIButton *b3;
@property (nonatomic, retain) IBOutlet UIButton *b4;
@property (nonatomic) IBOutlet int score;
@property (nonatomic, retain) IBOutlet UILabel *scoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property (nonatomic,) IBOutlet int highScore;
@property (nonatomic, retain) IBOutlet UILabel *classic1HighScoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *classic30HighScoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *endure1HighScoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *endure30HighScoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *dontTap30HighScoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *dontTap1HighScoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *taparoo30HighScoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *taparoo1HighScoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *taparooHighScoreDisplay;
@property (nonatomic, retain) IBOutlet UILabel *taparooHighScoreLabel;
@property (nonatomic, retain) IBOutlet UILabel *highScoreLabel;
@property (nonatomic, retain) IBOutlet NSTimer *timer;
@property (nonatomic)  double timeLeft;
@property (nonatomic, retain) IBOutlet UILabel *timerDisplay;
@property (nonatomic, retain) IBOutlet UILabel *timeLeftLabel;
@property (nonatomic, retain) IBOutlet UILabel *chooseYourGameModeLabel;
@property (nonatomic, retain) IBOutlet UILabel *chooseYourTimingOptionLabel;
@property (nonatomic, assign)BOOL bannerIsVisible;
@property (nonatomic, retain) IBOutlet ADBannerView *banner;
@property (nonatomic, retain) IBOutlet UIButton *showLeaderboardsButton;
@property (nonatomic, retain) IBOutlet UIButton *settings;
@property (nonatomic, retain) IBOutlet UIButton *submitAllHighScores;
@property (nonatomic, retain) IBOutlet UIButton *resetAllHighScores;
@property (nonatomic, retain) IBOutlet UIButton *personalizeButton;
@property (nonatomic, retain) IBOutlet UIButton *classicButton;
@property (nonatomic, retain) IBOutlet UIButton *endureButton;
@property (nonatomic, retain) IBOutlet UIButton *dontTapButton;
@property (nonatomic, retain) IBOutlet UIButton *taparooButton;
@property (nonatomic, retain) IBOutlet UIButton *thirtyButton;
@property (nonatomic, retain) IBOutlet UIButton *minuteButton;
@property (nonatomic, retain) IBOutlet UISlider *buttonColorChanger1;
@property (nonatomic, retain) IBOutlet UIImageView *colorPalette;
@property (nonatomic, retain) IBOutlet UISegmentedControl *colorText;
@property (nonatomic, retain) IBOutlet UIButton *resetButtonColorsButton;
@property (nonatomic, retain) IBOutlet UILabel *resetButtonColorsLabel;
@property (nonatomic, retain) IBOutlet UILabel *buttonColorLabel;
@property (nonatomic, retain) IBOutlet UILabel *textColorLabel;
@property (nonatomic, retain) IBOutlet UILabel *personalizeLabel;
@property (nonatomic, retain) IBOutlet UILabel *backButtonLabel;
@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) IBOutlet UIButton *smallButton;
@property (nonatomic, retain) IBOutlet UIButton *tapItButton;
@property (nonatomic, retain) IBOutlet UIImageView *howToPlayImage;

-(IBAction)chooseGame: (id)sender;
-(IBAction)chooseMode: (id)sender;
-(IBAction)chooseTime: (id)sender;
-(IBAction)personalize;
-(IBAction)changeButtonColor1;
-(IBAction)changeButtonColor2;
-(IBAction)changeButtonColor3;
-(IBAction)changeButtonColor4;
-(IBAction)colorButton1;
-(IBAction)toggleTextColor: (id)sender;
-(IBAction)resetButtonColors;
//-(IBAction)colorButton2;
//-(IBAction)colorButton3;
//-(IBAction)colorButton4;
//-(void)hideSliders;
-(IBAction)animateButton: (id)sender;
-(void)setTapIt;
-(IBAction)setTitle: (id)sender;
-(void)chooseNextButtonDont;
-(void)gameOver;
-(IBAction)click: (id)sender;
-(IBAction)chooseNextButton;
-(void)updateTimerDisplay;
-(IBAction)resetHighScore;
-(void)setScreen;
-(IBAction)mainMenu;
-(IBAction)PauseResume;
-(IBAction)showLeader;
-(IBAction)showAchievements;
-(IBAction)showSettings;
-(IBAction)submitAllScores;
+ (Tap_itViewController *)notificationPause;

@end

