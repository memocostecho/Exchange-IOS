//
//  ViewController.m
//  ExChange
//
//  Created by mac on 2/24/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Reachability *internetConection = [Reachability reachabilityForLocalWiFi];
    //[Reachability reachabilityWithHostName:@"www.google.com"];
    //[Reachability reachabilityForInternetConnection];
    NetworkStatus estado = [internetConection currentReachabilityStatus];
    if (estado == ReachableViaWiFi) {
        
        self.loginView =
        [[FBLoginView alloc] initWithPublishPermissions:@[@"public_profile", @"email", @"user_friends",@"publish_actions"] defaultAudience:0
         ] ;
        // Align the button in the center horizontally
        self.loginView.frame = CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height-150, 200, 80);
        
        
        
        [self.view addSubview:self.loginView];
        
        self.loginView.delegate = self;
        
        
        
    } else if (estado == ReachableViaWWAN) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"La conexion a Internet es por redCelular" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        [av show];
    } else {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No hay conexion a Internet" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [av show];
    }

    
    
    

}




// Call method when user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    
    NSLog(@"El usuario: %@",[user objectForKey:@"email"]);
    
    NSDictionary * fbUserAndMail = @{ @"email"     : [user objectForKey:@"email"],
                                                       @"username" : user.name
                                                       // etc.
                                                       };
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    
    NSString* userAndMail = @"userAndMail";
    
    [preferences setValue:fbUserAndMail forKey:userAndMail];

    
    
    
    NSString* tokenString = @"token";
    
   /* if([preferences objectForKey:tokenString] == nil)
    {*/
        
        
        UIUserNotificationType types = UIUserNotificationTypeBadge |
        UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationActionContextDefault;
        
        UIUserNotificationSettings *mySettings =
        [UIUserNotificationSettings settingsForTypes:types categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
        
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
        
        
   // }
   /* else
    {
      //  [[UIApplication sharedApplication] unregisterForRemoteNotifications];
        
        
        
    }*/
    
    
    //NSLog(@"El usuario: %@",[user objectForKey:@"data"]);
    
    
    
    ViewController *NVC = [self.storyboard instantiateViewControllerWithIdentifier:@"tabViewController"];
    [self presentViewController:NVC animated:YES completion:nil];
    //self.profilePictureView.profileID = user.id;
    //self.nameLabel.text = user.name;
}





@end
