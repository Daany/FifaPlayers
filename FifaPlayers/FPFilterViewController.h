//
//  FPSecondViewController.h
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPFilterViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic) BOOL pageControlUsed;
@property(nonatomic) int numberOfPages;
@property(nonatomic, strong) NSMutableArray *viewControllers;
- (IBAction)search:(id)sender;
@end
