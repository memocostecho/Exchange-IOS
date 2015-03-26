//
//  MisIntercambios.h
//  ExChange
//
//  Created by mac on 2/26/15.
//  Copyright (c) 2015 mx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MisIntercambios : UITableViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *miTablaDeIntercambios;
@property (strong,nonatomic) NSArray * tableData;
@end
