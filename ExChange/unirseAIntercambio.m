//
//  unirseAIntercambio.m
//  ExChange
//
//  Created by mac on 2/28/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import "unirseAIntercambio.h"

@interface unirseAIntercambio ()

@end

@implementation unirseAIntercambio

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    

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

- (IBAction)unirseAIntercambio:(id)sender {
    
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *userAndMail = [preferences objectForKey:@"userAndMail"];
    
    NSString * mail = [userAndMail objectForKey:@"email"];
    
    NSString * exchangeIdCaptured = self.exchangeId.text;
    
    

    
    NSString * urlString = [NSString stringWithFormat:@"https://secretinini.appspot.com/_ah/api/exchanges/v1/joinExchange?exchangeId=%@&useremail=%@",exchangeIdCaptured,mail];
    
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"%@",urlString);
    NSLog(@"codificada%@",url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         
         
         
         UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Exito" message:@"Te has unido al intercambio exitosamente." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
         [av show];
         
         if (data.length > 0 && connectionError == nil)
         {
             
             
             
             
             
             
             
             
             
             //        NSLog(@"%@",[[NSJSONSerialization JSONObjectWithData:tableData[0] options:0
             //  error:NULL]objectForKey:@"date"]);
             
             // NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:tableData[0] options:0
             //    error:NULL];
             
             //  NSLog(@"%@",[dict objectForKey:@"date"]);
             
             //self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
             //self.greetingContent.text = [greeting objectForKey:@"content"];
         }
         else{
             
         }
     }];

}
@end
