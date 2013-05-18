//
//  FPSecondViewController.m
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "FPFilterViewController.h"
#import "FPFilterPage1Controller.h"
#import "FPDataProvider.h"
#import "FPSearchViewController.h"

@interface FPFilterViewController ()

@end

@implementation FPFilterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.provider = [[FPDataProvider alloc]init];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];


    self.viewControllers = [[NSMutableArray alloc] init];
    [self.viewControllers addObject:[[FPFilterPage1Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)]];
    [self.viewControllers addObject:[[FPFilterPage1Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)]];
    self.numberOfPages = self.viewControllers.count;

    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = self.numberOfPages;
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];

    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.numberOfPages, self.scrollView.frame.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;

    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= self.numberOfPages) return;

    FPFilterPage1Controller *controller = [self.viewControllers objectAtIndex:page];

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
}

- (IBAction)search:(id)sender
{
    __block NSString *fullSearchString = @"1 = 1";

    [self.viewControllers enumerateObjectsUsingBlock:^(BaseFilterController *obj, NSUInteger idx, BOOL *stop)
    {
        NSString *partSearchString = [obj getSearchString];
        fullSearchString = [fullSearchString stringByAppendingString:partSearchString];
    }];

    [self.provider FilterPlayers:fullSearchString withResponseMethod:^(NSMutableArray *array)
    {
        FPSearchViewController *controller = [[FPSearchViewController alloc] init];
        [self.navigationController pushViewController:controller animated:true];
    }];
}
@end
