//
// Created by Patrick Kaufmann on 5/17/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPFilterPage1Controller.h"


@interface FPFilterPage1Controller ()
@end

@implementation FPFilterPage1Controller
{

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"Overall"];
        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"Potential"];
        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"Age"];
        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Position"];
        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"WeakFoot"];
        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"Foot"];
        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"Skill"];

        self.minOverall = [self createTextField:CGRectMake(190, 10, 50, 30)];
        self.maxOverall = [self createTextField:CGRectMake(260, 10, 50, 30)];
        self.minPotential = [self createTextField:CGRectMake(190, 50, 50, 30)];
        self.maxPotential = [self createTextField:CGRectMake(260, 50, 50, 30)];
        self.minAge = [self createTextField:CGRectMake(190, 90, 50, 30)];
        self.maxAge = [self createTextField:CGRectMake(260, 90, 50, 30)];

        self.position = [[UISegmentedControl alloc] initWithFrame:CGRectMake(110, 130, 200, 30)];
        [self.position insertSegmentWithTitle:@"GK" atIndex:0 animated:NO];
        [self.position insertSegmentWithTitle:@"DEF" atIndex:1 animated:NO];
        [self.position insertSegmentWithTitle:@"MID" atIndex:2 animated:NO];
        [self.position insertSegmentWithTitle:@"ATT" atIndex:3 animated:NO];
        [self.view addSubview:self.position];

        self.minWeakFoot = [self createTextField:CGRectMake(190, 170, 50, 30)];
        self.maxWeakFoot = [self createTextField:CGRectMake(260, 170, 50, 30)];

        self.foot = [[UISegmentedControl alloc] initWithFrame:CGRectMake(160, 210, 150, 30)];
        [self.foot insertSegmentWithTitle:@"Left" atIndex:0 animated:NO];
        [self.foot insertSegmentWithTitle:@"Right" atIndex:1 animated:NO];
        [self.view addSubview:self.foot];
        
        self.minSkill = [self createTextField:CGRectMake(190, 250, 50, 30)];
        self.maxSkill = [self createTextField:CGRectMake(260, 250, 50, 30)];
    }

    return self;
}

- (NSString *)getSearchString
{
    NSString *searchString = @"";

    searchString = [self createSearchString:searchString forName:@"TotalSkill" withValue:self.minOverall.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"TotalSkill" withValue:self.maxOverall.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Potential" withValue:self.minPotential.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Potential" withValue:self.maxPotential.text andComparisation:@"<="];

    searchString = [self createSearchString:searchString forName:@"WeakFoot" withValue:self.minWeakFoot.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"WeakFoot" withValue:self.maxWeakFoot.text andComparisation:@"<="];

    searchString = [self createSearchString:searchString forName:@"BirthDate" withAge:self.minAge.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"BirthDate" withAge:self.maxAge.text andComparisation:@">="];

    searchString = [self createSearchString:searchString forName:@"MinSkill" withValue:self.minSkill.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"MaxSkill" withValue:self.maxSkill.text andComparisation:@"<="];

    if(self.foot.selectedSegmentIndex != -1)
    {
        if(self.foot.selectedSegmentIndex == 0)
        {
            searchString = [self createSearchString:searchString forName:@"Foot" withValue:@"'Left'" andComparisation:@"="];
        }
        else
        {
            searchString = [self createSearchString:searchString forName:@"Foot" withValue:@"'Right'" andComparisation:@"="];
        }
    }

    return searchString;
}

- (NSString *)getPositionString
{
    NSString *positionString = @"";
    switch(self.position.selectedSegmentIndex)
    {
        case 0:
            positionString = @"GK";
            break;
        case 1:
            positionString = @"LWB;LB;CB;RB;RWB";
            break;
        case 2:
            positionString = @"CDM;CM;RM;LM;CAM";
            break;
        case 3:
            positionString = @"ST;RW;LW;CF";
        default: break;
    }

    return positionString;
}


@end