//
//  ViewController.h
//  ExChange
//
//  Created by mac on 2/24/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController : UIViewController<FBLoginViewDelegate,UIApplicationDelegate>

@property (nonatomic,strong) FBLoginView *loginView;
@end

