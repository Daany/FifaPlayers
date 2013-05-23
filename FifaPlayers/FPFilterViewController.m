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
#import "FPFilterPage2Controller.h"
#import "FPFilterPage3Controller.h"
#import "FPFilterPage4Controller.h"
#import "FPFilterPage5Controller.h"
#import "FPFilterPage6Controller.h"

@interface FPFilterViewController ()

@end

@implementation FPFilterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.viewControllers = [[NSMutableArray alloc] init];

    self.provider = [[FPDataProvider alloc]init];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(self.viewControllers.count == 0)
    {
        [self.viewControllers addObject:[[FPFilterPage1Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)]];
        [self.viewControllers addObject:[[FPFilterPage2Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)]];
        [self.viewControllers addObject:[[FPFilterPage3Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)]];
        [self.viewControllers addObject:[[FPFilterPage4Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)]];
        [self.viewControllers addObject:[[FPFilterPage5Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)]];
        [self.viewControllers addObject:[[FPFilterPage6Controller alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)]];
        
        self.numberOfPages = self.viewControllers.count;
        
        self.pageControl.currentPage = 0;
        self.pageControl.numberOfPages = self.numberOfPages;
        self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.numberOfPages, self.scrollView.frame.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
    UIBarButtonItem *reset = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonSystemItemCancel target:self action:@selector(resetFilter:)];
    [self.navigationItem setLeftBarButtonItem:reset];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search:)];
    [self.navigationItem setRightBarButtonItem:button animated:YES];
}

- (void)viewDidLayoutSubviews
{
    //needs to be here, or else the scroll view won't have the correct size on the first page load
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.numberOfPages, self.scrollView.frame.size.height);
}

-(IBAction)resetFilter:(id)sender
{
    for (int i = 0; i < self.viewControllers.count; i++) {
        [[self.viewControllers objectAtIndex:i] resetFilter];
    }
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= self.numberOfPages) return;

    FPBaseFilterController *controller = [self.viewControllers objectAtIndex:page];

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

- (IBAction)search:(id)sender {
    self.progressBar.hidden = NO;
    [self.progressBar startAnimating];
    UIViewController *activeController = [self.viewControllers objectAtIndex:self.pageControl.currentPage];
    
    UIActivityIndicatorView *progressBar = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    progressBar.center = CGPointMake(activeController.view.frame.size.width / 2, activeController.view.frame.size.height / 2);

    [activeController.view addSubview:progressBar];

    [progressBar startAnimating];
    
    @try {
    
    @try {
        for(UIView *subView in activeController.view.subviews) {
            if([subView conformsToProtocol:@protocol(UITextInputTraits)]) {
                UITextField *textField = (UITextField *)subView ;
                [textField resignFirstResponder];
            }
        }
    }
    @catch (NSException *exception) {
        // resignFirstResponder already called!
    }
    
    if(self.requestRunning) return;
    self.requestRunning = YES;

    __block NSString *fullSearchString = @"1 = 1";
    __block NSString *fullPositionString = @"";

    [self.viewControllers enumerateObjectsUsingBlock:^(FPBaseFilterController *obj, NSUInteger idx, BOOL *stop)
    {
        fullSearchString = [fullSearchString stringByAppendingString:[obj getSearchString]];
        fullPositionString = [fullPositionString stringByAppendingString:[obj getPositionString]];
    }];

    [self.provider FilterPlayers:fullSearchString andPositions:fullPositionString withResponseMethod:^(NSMutableArray *array)
    {
        self.requestRunning = false;
        self.foundPlayers = array;
        
        //FPSearchViewController *searchViewController = [[self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"] copy];
        //[self.navigationController pushViewController:searchViewController animated:YES];
        [self performSegueWithIdentifier:@"Result" sender:self];
        
        [progressBar removeFromSuperview];
    }];
    }
    @catch (NSException *exception) {
        [progressBar removeFromSuperview];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Result"])
    {
        FPSearchViewController *controller = segue.destinationViewController;
        [controller setPLayerList:self.foundPlayers];
        [controller disableUpdates];
    }
}


@end
