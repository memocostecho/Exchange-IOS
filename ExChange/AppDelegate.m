//
//  AppDelegate.m
//  ExChange
//
//  Created by mac on 2/24/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>

@interface AppDelegate ()
@property (nonatomic,strong)  NSString * token;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
  
    // Override point for customization after application launch.
    
    _window.tintColor = [UIColor redColor];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:settings{
    NSLog(@"hola");
    
}







// Delegation methods
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    NSString* tokenString = @"token";
    const void *devTokenBytes = [devToken bytes];
    NSLog(@"%@",devToken);
    
    NSString *token = [[devToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"content---%@", token);
    
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    
    
    [preferences setValue:token forKey:tokenString];
    
    //self.token = token;
    
    NSDictionary *userAndMail = [preferences objectForKey:@"userAndMail"];

        
        
        
        NSString *username = [userAndMail objectForKey:@"username"];
        NSString *mail = [userAndMail objectForKey:@"email"];
    
    
    NSString * urlString = [NSString stringWithFormat:@"https://secretinini.appspot.com/_ah/api/exchanges/v1/adduser?deviceRegistered=%@&mail=%@&name=%@",token,mail,username];
    
        
        NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"%@",urlString);
        NSLog(@"%@",url);
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data, NSError *connectionError)
         {
             if (data.length > 0 && connectionError == nil)
             {
                 NSDictionary *respuesta = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
                 
                 NSLog(@"%@",respuesta);
                 //self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
                 //self.greetingContent.text = [greeting objectForKey:@"content"];
             }
             else{
             
             }
         }];
    


    
    //a estas alturas se supone que ya se guardo el token y se puede enviar al WS
    
    
    
    // self.registered = YES;
    // [self sendProviderDeviceToken:devTokenBytes]; // custom method
}


- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"Error in registration. Error: %@", err);
}


/*
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
}
*/

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    BOOL urlWasHandled = [FBAppCall handleOpenURL:url
                                sourceApplication:sourceApplication
                                  fallbackHandler:^(FBAppCall *call) {
                                      NSLog(@"Unhandled deep link: %@", url);
                                      // Here goes the code to handle
                                      // the links.
                                      // Use the links to show a relevant
                                      // view of your app to the user
                                  }];
    
    return urlWasHandled;
}



@end
