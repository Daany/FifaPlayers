//
// Created by Patrick Kaufmann on 5/18/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPFilterPage2Controller.h"


@implementation FPFilterPage2Controller
{

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"AttackWorkRate"];
        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"DefenseWorkRate"];
        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"Ballcontrol"];
        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Crossing"];
        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Curve"];
        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"Dribbling"];
        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"Finishing"];
        [self createLabel:CGRectMake(10, 290, 140, 30) andName:@"FreeKicks"];

        self.attackWorkRate = [[UISegmentedControl alloc] initWithFrame:CGRectMake(150, 10, 165, 30)];
        [self.attackWorkRate insertSegmentWithTitle:@"Low" atIndex:0 animated:NO];
        [self.attackWorkRate insertSegmentWithTitle:@"Medium" atIndex:1 animated:NO];
        [self.attackWorkRate insertSegmentWithTitle:@"High" atIndex:2 animated:NO];
        [self.attackWorkRate setWidth:45 forSegmentAtIndex:0];
        [self.attackWorkRate setWidth:75 forSegmentAtIndex:1];
        [self.attackWorkRate setWidth:45 forSegmentAtIndex:2];
        [self.view addSubview:self.attackWorkRate];

        self.defenseWorkRate = [[UISegmentedControl alloc] initWithFrame:CGRectMake(150, 50, 165, 30)];
        [self.defenseWorkRate insertSegmentWithTitle:@"Low" atIndex:0 animated:NO];
        [self.defenseWorkRate insertSegmentWithTitle:@"Medium" atIndex:1 animated:NO];
        [self.defenseWorkRate insertSegmentWithTitle:@"High" atIndex:2 animated:NO];
        [self.defenseWorkRate setWidth:45 forSegmentAtIndex:0];
        [self.defenseWorkRate setWidth:75 forSegmentAtIndex:1];
        [self.defenseWorkRate setWidth:45 forSegmentAtIndex:2];
        [self.view addSubview:self.defenseWorkRate];

        self.minBallcontrol = [self createTextField:CGRectMake(190, 90, 50, 30)];
        self.maxBallcontrol = [self createTextField:CGRectMake(260, 90, 50, 30)];
        self.minCrossing = [self createTextField:CGRectMake(190, 130, 50, 30)];
        self.maxCrossing = [self createTextField:CGRectMake(260, 130, 50, 30)];
        self.minCurve = [self createTextField:CGRectMake(190, 170, 50, 30)];
        self.maxCurve = [self createTextField:CGRectMake(260, 170, 50, 30)];
        self.minDribbling = [self createTextField:CGRectMake(190, 210, 50, 30)];
        self.maxDribbling = [self createTextField:CGRectMake(260, 210, 50, 30)];
        self.minFinishing = [self createTextField:CGRectMake(190, 250, 50, 30)];
        self.maxFinishing = [self createTextField:CGRectMake(260, 250, 50, 30)];
        self.minFreeKicks = [self createTextField:CGRectMake(190, 290, 50, 30)];
        self.maxFreeKicks = [self createTextField:CGRectMake(260, 290, 50, 30)];
    }

    return self;
}

-(void)resetFilter
{
    self.attackWorkRate.selectedSegmentIndex = -1;
    self.defenseWorkRate.selectedSegmentIndex = -1;
    self.minBallcontrol.text = @"";
    self.maxBallcontrol.text = @"";
    self.minCrossing.text = @"";
    self.maxCrossing.text = @"";
    self.minCurve.text = @"";
    self.maxCurve.text = @"";
    self.minDribbling.text = @"";
    self.maxDribbling.text = @"";
    self.minFinishing.text = @"";
    self.maxFinishing.text = @"";
    self.minFreeKicks.text = @"";
    self.maxFreeKicks.text = @"";
}

- (NSString *)getSearchString
{
    NSString *searchString = @"";

    searchString = [self createSearchString:searchString forName:@"Ballcontrol" withValue:self.minBallcontrol.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Ballcontrol" withValue:self.maxBallcontrol.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Crossing" withValue:self.minCrossing.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Crossing" withValue:self.maxCrossing.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Curve" withValue:self.minCurve.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Curve" withValue:self.maxCurve.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Dribbling" withValue:self.minDribbling.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Dribbling" withValue:self.maxDribbling.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Finishing" withValue:self.minFinishing.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Finishing" withValue:self.maxFinishing.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"FreeKicks" withValue:self.minFreeKicks.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"FreeKicks" withValue:self.maxFreeKicks.text andComparisation:@"<="];

    if(self.attackWorkRate.selectedSegmentIndex != -1)
    {
        NSString *attackWorkRate = @"";
        switch(self.attackWorkRate.selectedSegmentIndex)
        {
            case 0:
                attackWorkRate = @"'Low'";
                break;
            case 1:
                attackWorkRate = @"'Medium'";
                break;
            case 2:
                attackWorkRate = @"'High'";
                break;
        }
        searchString = [self createSearchString:searchString forName:@"AttackWorkrate" withValue:attackWorkRate andComparisation:@"="];
    }

    if(self.defenseWorkRate.selectedSegmentIndex != -1)
    {
        NSString *defenseWorkRate = @"";
        switch(self.defenseWorkRate.selectedSegmentIndex)
        {
            case 0:
                defenseWorkRate = @"'Low'";
                break;
            case 1:
                defenseWorkRate = @"'Medium'";
                break;
            case 2:
                defenseWorkRate = @"'High'";
                break;
        }
        searchString = [self createSearchString:searchString forName:@"DefenseWorkrate" withValue:defenseWorkRate andComparisation:@"="];
    }

    return searchString;
}



@end