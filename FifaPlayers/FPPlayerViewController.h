//
//  FPPlayerViewController.h
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPPlayerBase.h"
#import "FPPlayer.h"

@class FPFavoriteProvider;

@interface FPPlayerViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property(nonatomic, strong) FPPlayer *player;

@property(nonatomic) int numberOfPages;

@property(nonatomic, strong) NSMutableArray *viewControllers;

@property(nonatomic) BOOL pageControlUsed;

@property(nonatomic, strong) FPFavoriteProvider *favoriteProvider;

@property(nonatomic, strong) UIBarButtonItem *favoriteButton;

- (void)favorite:(id)obj;
@end
