//
//  FPSettingsViewController.m
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import "FPSettingsViewController.h"
#import "FPFavoriteProvider.h"
#import "MBProgressHUD.h"

@interface FPSettingsViewController ()

@end

@implementation FPSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (IBAction)removeFavorites:(id)sender
{
    FPFavoriteProvider *provider = [FPFavoriteProvider getInstance];
    provider.favorites = [[NSMutableArray alloc] init];
    [provider saveToFile];

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Deleted all favorites";
    hud.mode = MBProgressHUDModeText;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}
@end
