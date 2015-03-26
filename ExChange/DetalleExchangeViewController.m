//
//  DetalleExchangeViewController.m
//  ExChange
//
//  Created by mac on 2/27/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import "DetalleExchangeViewController.h"

@interface DetalleExchangeViewController ()

@end

@implementation DetalleExchangeViewController


NSString *mail ;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.TablaUnidos.delegate = self;
    self.TablaUnidos.dataSource = self;
    
    self.labelExchangeId.text = self.exchangeId;
    
    
    
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *userAndMail = [preferences objectForKey:@"userAndMail"];
    
    mail = [userAndMail objectForKey:@"email"];
    
    NSString * urlString = [NSString stringWithFormat:@"https://secretinini.appspot.com/_ah/api/exchanges/v1/getexchangesuser?exchangeId=%@&username=%@",self.labelExchangeId.text,mail];
    
    
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
             
             
             self.integrantesData = [[NSJSONSerialization JSONObjectWithData:data
                                                          options:0
                                                            error:NULL]objectForKey:@"exchanges"];
             
             NSLog(@"En la peticion %i",[self.integrantesData count]);
             
             [self.TablaUnidos reloadData];
             
             
             
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
    
    

    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setMyObjectHere:(NSString * )cadena{
    self.exchangeId = cadena;

}

- (IBAction)lanzarIntercambio:(id)sender {
    
    NSString * urlString = [NSString stringWithFormat:@"https://secretinini.appspot.com/_ah/api/exchanges/v1/triggerrapple?exchangeId=%@&username=%@",self.labelExchangeId.text,mail];
    
    
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
             
             
             NSLog(@"dedpues");
             
             UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Se ha generado el intecambio y le llegara notificacion a todos los involucrados" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
             [av show];
             
             
             
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




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
           //      NSLog(@"regresando %i",[self.integrantesData count]);
    return [self.integrantesData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //NSLog(@"%u",indexPath.row);
    
    // cell.textLabel.text = [[NSJSONSerialization JSONObjectWithData:[[tableData objectForKey:@"devices" ]objectAtIndex:indexPath.row]
    //                                                     options:0
    //                                                     error:NULL] objectForKey:@"date"];
    
    /*if([[self.tableData objectAtIndex:indexPath.row]objectForKey:@"user"]!=mail)
        cell.textLabel.text = [[self.tableData objectAtIndex:indexPath.row]objectForKey:@"user"];
    else
        if([[[self.tableData objectAtIndex:indexPath.row]objectForKey:@"administrator"] isEqualToString:@"NO"]){
            self.botonLanzar.hidden = YES;
        }*/
    
    cell.textLabel.text = [[self.integrantesData objectAtIndex:indexPath.row]objectForKey:@"user"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor redColor];
    
    //cell.textLabel.text = @"hola";//[[self.integrantesData objectAtIndex:indexPath.row]objectForKey:@"user"];
    
    
    return cell;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
