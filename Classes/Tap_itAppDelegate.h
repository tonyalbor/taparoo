//
//  Tap_itAppDelegate.h
//  Tap it
//
//  Created by Tony Albor on 7/14/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tap_itViewController.h"
#import <FacebookSDK/FacebookSDK.h>

extern NSString *const FBSessionStateChangedNotification;

/*
@interface MyAppDelegate: NSObject
{    
    UIButton *sharedplaybutton;
    UIButton *sharedpausebutton;
    BOOL sharedpaused;
}
@property (nonatomic, retain)  UIButton *sharedplaybutton;
@property (nonatomic, retain)  UIButton *sharedpausebutton;

@end

@implementation MyAppDelegate

@synthesize sharedplaybutton;
@synthesize sharedpausebutton;

@end
*/
 
 
@class Tap_itViewController;

@interface Tap_itAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Tap_itViewController *viewController;    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Tap_itViewController *viewController;

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;
- (void) closeSession;

@end


