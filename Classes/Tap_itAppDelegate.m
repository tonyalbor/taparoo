//
//  Tap_itAppDelegate.m
//  Tap it
//
//  Created by Tony Albor on 7/14/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "Tap_itAppDelegate.h"
#import "Tap_itViewController.h"

@implementation Tap_itAppDelegate

@synthesize window;
@synthesize viewController;

#pragma mark -
#pragma mark Application lifecycle

NSString *const FBSessionStateChangedNotification = @"com.tonyalbor.taparoo:FBSessionStateChangedNotification";

/*
 * Callback for session changes.
 */
- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
   switch (state) {
      case FBSessionStateOpen:
         if (!error) {
            // We have a valid session
            NSLog(@"User session found");
         }
         break;
      case FBSessionStateClosed:
      case FBSessionStateClosedLoginFailed:
         [FBSession.activeSession closeAndClearTokenInformation];
         break;
      default:
         break;
   }
   
   [[NSNotificationCenter defaultCenter]
    postNotificationName:FBSessionStateChangedNotification
    object:session];
   
   if (error) {
      UIAlertView *alertView = [[UIAlertView alloc]
                                initWithTitle:@"Error"
                                message:error.localizedDescription
                                delegate:nil
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil];
      [alertView show];
   }
}

/*
 * Opens a Facebook session and optionally shows the login UX.
 */
- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI {
   return [FBSession openActiveSessionWithReadPermissions:nil
                                             allowLoginUI:allowLoginUI
                                        completionHandler:^(FBSession *session,
                                                            FBSessionState state,
                                                            NSError *error) {
                                           [self sessionStateChanged:session
                                                               state:state
                                                               error:error];
                                        }];
}

/*
 * If we have a valid session at the time of openURL call, we handle
 * Facebook transitions by passing the url argument to handleOpenURL
 */
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
   // attempt to extract a token from the url
   return [FBSession.activeSession handleOpenURL:url];
}

- (void) closeSession {
   [FBSession.activeSession closeAndClearTokenInformation];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
 

    // Add the view controller's view to the window and display.
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    
    [viewController release];
    [window release];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    [Tap_itViewController notificationPause];
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
   
   // We need to properly handle activation of the application with regards to Facebook Login
   // (e.g., returning from iOS 6.0 Login Dialog or from fast app switching).
   [FBSession.activeSession handleDidBecomeActive];
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
   
   [FBSession.activeSession close];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
