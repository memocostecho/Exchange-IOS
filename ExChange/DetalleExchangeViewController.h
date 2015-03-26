//
//  DetalleExchangeViewController.h
//  ExChange
//
//  Created by mac on 2/27/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleExchangeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) NSString * exchangeId;
@property (weak, nonatomic) IBOutlet UILabel *labelExchangeId;
@property (weak, nonatomic) IBOutlet UITableView *TablaUnidos;
@property (weak, nonatomic) IBOutlet UIButton *botonLanzar;
@property (nonatomic,strong) NSArray * integrantesData;

-(void) setMyObjectHere:(NSString * )cadena;
- (IBAction)lanzarIntercambio:(id)sender;
@end
