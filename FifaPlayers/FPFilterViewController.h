//
//  FPSecondViewController.h
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FPDataProvider;

@interface FPFilterViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic) BOOL pageControlUsed;
@property(nonatomic) int numberOfPages;
@property(nonatomic, strong) NSMutableArray *viewControllers;
@property(nonatomic, strong) FPDataProvider *provider;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressBar;

@property(nonatomic, strong) NSMutableArray *foundPlayers;

@property(nonatomic) BOOL requestRunning;

- (IBAction)search:(id)sender;
@end
