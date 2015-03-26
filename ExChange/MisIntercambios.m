//
//  MisIntercambios.m
//  ExChange
//
//  Created by mac on 2/26/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import "MisIntercambios.h"
#import "DetalleExchangeViewController.h"

@interface MisIntercambios ()

@end

@implementation MisIntercambios



- (void)viewDidLoad {
    
    NSUserDefaults* preferences = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *userAndMail = [preferences objectForKey:@"userAndMail"];
    
    NSString *mail = [userAndMail objectForKey:@"email"];
    
    NSString * urlString = [NSString stringWithFormat:@"https://secretinini.appspot.com/_ah/api/exchanges/v1/getuserexchanges?useremail=%@",mail];
    
    
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
             
             
             self.tableData = [[NSJSONSerialization JSONObjectWithData:data
                                                                       options:0
                                                                         error:NULL]objectForKey:@"userExchanges"];
             
             NSLog(@"En la peticion");
            [self.miTablaDeIntercambios reloadData];
            

             
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
    
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
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
    
    
    cell.textLabel.text = [[self.tableData objectAtIndex:indexPath.row]objectForKey:@"name"];
    
    cell.textLabel.textColor = [UIColor redColor];

    
    
        return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    

    DetalleExchangeViewController *vc;
    
    if ([[segue identifier] isEqualToString:@"detalleExchange"])
    {
        // Get reference to the destination view controller
        vc = [segue destinationViewController ];

        // Pass any objects to the view controller here, like...
        [vc setMyObjectHere:[sender text]];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
