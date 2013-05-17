//
//  FPFirstViewController.h
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPSearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *searchPlayerTableview;

@end
