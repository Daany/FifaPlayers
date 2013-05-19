//
//  FPFavoritesViewController.h
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FPFavoriteProvider;

@interface FPFavoritesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) FPFavoriteProvider *favoriteProvider;
@property(nonatomic, strong) id selectedPlayer;
@end
