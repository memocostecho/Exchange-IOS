//
//  CrearIntercambio.h
//  ExChange
//
//  Created by mac on 2/24/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrearIntercambio : UIViewController

- (IBAction)crearIntercambio:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *nombreIntercambioTF;


@property (weak, nonatomic) IBOutlet UITextField *motivoIntercambioTF;

@property (weak, nonatomic) IBOutlet UITextField *montoTF;


@end
