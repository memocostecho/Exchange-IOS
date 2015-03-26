//
//  CrearIntercambio.m
//  ExChange
//
//  Created by mac on 2/24/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import "CrearIntercambio.h"
#import <FacebookSDK/FacebookSDK.h>

@interface CrearIntercambio ()

@end

@implementation CrearIntercambio

NSArray *tableData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    
    
    
    //[[UIApplication sharedApplication] unregisterForRemoteNotifications];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (IBAction)crearIntercambio:(UIButton *)sender {
    
    if(([self.nombreIntercambioTF.text length] >0) && ([self.motivoIntercambioTF.text length]>0)){
        self.nombreIntercambioTF.backgroundColor=[UIColor whiteColor];
        self.motivoIntercambioTF.backgroundColor =[UIColor whiteColor];
        
        // Check if the Facebook app is installed and we can present
        // the message dialog
        
        NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
        
        //self.token = token;
        
        NSDictionary *userAndMail = [preferences objectForKey:@"userAndMail"];
        
        
        
        
        NSString *username = [userAndMail objectForKey:@"username"];
        NSString *mail = [userAndMail objectForKey:@"email"];

        
        
        
        NSString * montoAGuardar =  [NSString stringWithFormat:@"%i", (int)self.montoTF.text];
        NSString * nombreIntercambio = self.nombreIntercambioTF.text;
        NSString * motivo = self.motivoIntercambioTF.text;
        NSString * exchangeId=[NSString stringWithFormat:@"%@_%@",nombreIntercambio,motivo]; //self.motivoIntercambioTF.text;
        NSString * token = [preferences objectForKey:@"token"];
        
        
        
        //Message Code
        /*
        
        FBLinkShareParams *params = [[FBLinkShareParams alloc] init];
        params.link =
        [NSURL URLWithString:@"https://developers.facebook.com/docs/ios/share/"];
        params.name = @"Message Dialog Tutorial";
        params.caption = @"Build great social apps that engage your friends.";
        params.picture = [NSURL URLWithString:@"http://i.imgur.com/g3Qc1HN.png"];
        params.linkDescription = @"Send links from your app using the iOS SDK.";
        
        
        
        if([FBSession activeSession].state != FBSessionStateOpen){
            
            BOOL result = [FBSession openActiveSessionWithAllowLoginUI:NO];
            if(result)
            {
                
            }
        }
        
       
        
        [FBDialogs presentMessageDialogWithLink:[NSURL URLWithString:@"https://developers.facebook.com/docs/ios/"]
                                        handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                            
                                             NSLog(@"hla");
                                            
                                            if(error) {
                                                // An error occurred, we need to handle the error
                                                // See: https://developers.facebook.com/docs/ios/errors
                                                NSLog([NSString stringWithFormat:@"Error messaging link: %@", error.description]);
                                            } else {
                                                // Success
                                                NSLog(@"result %@", results);
                                            }
                                        }];
         
         */
        
        
        FBLinkShareParams *params = [[FBLinkShareParams alloc] init];
        params.link =
        [NSURL URLWithString:@"https://itunes.apple.com/en/app/whatsapp-messenger/id310633997?mt=8"];
        params.name = @"Descarga Exhcange en tu telefono para entrar al intercambio";
        params.caption = @"Unete a este intercambio al que te invito";
        params.picture = [NSURL URLWithString:@"http://gallery.yopriceville.com/var/resizes/Free-Clipart-Pictures/Gifts-and-Chocolates-PNG-/White_Gift_Box_with_Red_Bow_PNG_Clipart.png"];
        params.linkDescription = @"Invitacion al intercambio";
        [FBDialogs presentShareDialogWithParams:params clientState:nil handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
            NSLog(@"Se compartio");
            
            
            
            
            
            
            NSString * urlString = [NSString stringWithFormat:@"https://secretinini.appspot.com/_ah/api/exchanges/v1/createexchange?exchange.ammount=%@&exchange.exchangeId=%@&exchange.name=%@&exchange.reason=%@&useremail=%@",montoAGuardar,exchangeId,nombreIntercambio,motivo,mail];
            
            
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
                     
                     
                     tableData = [[NSJSONSerialization JSONObjectWithData:data
                                                                  options:0
                                                                    error:NULL]objectForKey:@"exchanges"];
                     
                     
                     
                     //        NSLog(@"%@",[[NSJSONSerialization JSONObjectWithData:tableData[0] options:0
                     //  error:NULL]objectForKey:@"date"]);
                     
                     // NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:tableData[0] options:0
                     //    error:NULL];
                     
                     //  NSLog(@"%@",[dict objectForKey:@"date"]);
                     
                     //self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
                     //self.greetingContent.text = [greeting objectForKey:@"content"];
                 }
                 else{
                     NSLog(@"En la peticion");
                     UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Exito" message:@"El intercambio ha sido creado con exito, tus amigos de facebook comenzaran a unirse a el." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
                     [av show];
                     
                     
                     self.nombreIntercambioTF.text = @"";
                    self.motivoIntercambioTF.text = @"";
                    self.montoTF.text = @"";

                 }
                 
                 
                 
                 
             }];

            
            
            
            
        }
         ];
         
        
        
        
        
        

     
        
    }
    if([self.nombreIntercambioTF.text length] == 0){
        self.nombreIntercambioTF.backgroundColor=[UIColor orangeColor];
        
    }
    if([self.motivoIntercambioTF.text length] == 0){
        
        self.motivoIntercambioTF.backgroundColor=[UIColor orangeColor];
        
    }
    
    
    
    
    


    
}



@end
