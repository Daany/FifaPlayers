//
//  FPPlayerViewController.m
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import "FPPlayerViewController.h"
#import "FPDataProvider.h"
#import "FPBasePlayerController.h"
#import "FPPlayerPage1Controller.h"
#import "FPPlayerPage6Controller.h"
#import "FPPlayerPage5Controller.h"
#import "FPPlayerPage4Controller.h"
#import "FPPlayerPage3Controller.h"
#import "FPPlayerPage2Controller.h"
#import "FPFavoriteProvider.h"

@interface FPPlayerViewController ()

@end

@implementation FPPlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = self.player.Fullname;

    FPDataProvider *provider = [[FPDataProvider alloc]init];
    self.viewControllers = [[NSMutableArray alloc] init];
    self.favoriteProvider = [FPFavoriteProvider getInstance];
    self.favoriteButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"FavoriteDisabled.png"] style:UIBarButtonItemStylePlain target:self action:@selector(favorite:)];


    [provider GetPlayerByPlayerbase:self.player withResponseMethod:^(FPPlayer *fullPlayer)
    {
        self.player = fullPlayer;

        [self.viewControllers addObject:[[FPPlayerPage1Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) andPlayer:fullPlayer]];
        [self.viewControllers addObject:[[FPPlayerPage2Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) andPlayer:fullPlayer]];
        [self.viewControllers addObject:[[FPPlayerPage3Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) andPlayer:fullPlayer]];
        [self.viewControllers addObject:[[FPPlayerPage4Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) andPlayer:fullPlayer]];
        [self.viewControllers addObject:[[FPPlayerPage5Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) andPlayer:fullPlayer]];
        [self.viewControllers addObject:[[FPPlayerPage6Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) andPlayer:fullPlayer]];

        self.numberOfPages = self.viewControllers.count;
        self.pageControl.currentPage = 0;
        self.pageControl.numberOfPages = self.numberOfPages;
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.numberOfPages, self.scrollView.frame.size.height);

        [self loadScrollViewWithPage:0];
        [self loadScrollViewWithPage:1];

        if([self.favoriteProvider playerIsFavorite:fullPlayer])
        {
            self.favoriteButton.image = [UIImage imageNamed:@"FavoriteEnabled.png"];
        }
    }];

    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];

    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;

    [self.navigationItem setRightBarButtonItem:self.favoriteButton animated:YES];
}

-(void)viewDidLayoutSubviews
{
         self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.numberOfPages, self.scrollView.frame.size.height);
}

- (void)favorite:(id)obj
{
    if([self.favoriteProvider playerIsFavorite:self.player])
    {
        [self.favoriteProvider removeFromFavorite:self.player];
        self.favoriteButton.image = [UIImage imageNamed:@"FavoriteDisabled.png"];
    }
    else
    {
        [self.favoriteProvider addToFavorite:self.player];
        self.favoriteButton.image = [UIImage imageNamed:@"FavoriteEnabled.png"];
        
    }
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= self.numberOfPages) return;

    FPBasePlayerController *controller = [self.viewControllers objectAtIndex:page];

    if (nil == controller.view.superview) {
        CGRect frame = self.scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [self.scrollView addSubview:controller.view];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(self.pageControlUsed) return;

    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;

    self.pageControl.currentPage = page;

    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControlUsed = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
