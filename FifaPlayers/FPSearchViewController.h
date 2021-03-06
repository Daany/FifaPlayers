//
//  FPFirstViewController.h
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPSearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressBar;

@property (weak, nonatomic) IBOutlet UITableView *searchPlayerTableview;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property(nonatomic, strong) id selectedPlayer;

@property(nonatomic, strong) NSMutableArray *filteredList;

@property(nonatomic) bool isSearching;

@property(nonatomic) bool makeUpdates;

@property(nonatomic) bool isLocalFilter;

@property(nonatomic) bool onWebRequest;

- (void)setPLayerList:(NSMutableArray *)list;

- (void)disableUpdates;

- (void)doneButtonClicked;
@end
