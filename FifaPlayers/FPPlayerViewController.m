//
//  FPPlayerViewController.m
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import "FPPlayerViewController.h"
#import "FPDataProvider.h"

@interface FPPlayerViewController ()

@end

@implementation FPPlayerViewController

FPPlayer *currentPlayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithPlayer:(FPPlayerBase*)player NibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        
        self.navigationItem.title = player.Fullname;
        FPDataProvider *provider = [[FPDataProvider alloc]init];
        [provider GetPlayerByPlayerbase:player withResponseMethod:^(FPPlayer *fullPlayer)
        {
            currentPlayer = fullPlayer;
            self.lblClub.text = fullPlayer.Club;
        }];
        
        // Load full Player
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
