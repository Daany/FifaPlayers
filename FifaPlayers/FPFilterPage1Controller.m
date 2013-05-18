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
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"Min-Overall"];
        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"Max-Overall"];
        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"Min-Potential"];
        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Max-Potential"];
        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Min Age"];
        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"Max Age"];
        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"Position"];

        self.minOverall = [self createTextField:CGRectMake(200, 10, 100, 30)];
        self.maxOverall = [self createTextField:CGRectMake(200, 50, 100, 30)];
        self.minPotential = [self createTextField:CGRectMake(200, 90, 100, 30)];
        self.maxPotential = [self createTextField:CGRectMake(200, 130, 100, 30)];
        self.minAge = [self createTextField:CGRectMake(200, 170, 100, 30)];
        self.maxAge = [self createTextField:CGRectMake(200, 210, 100, 30)];

        self.position = [[UISegmentedControl alloc] initWithFrame:CGRectMake(110, 250, 200, 30)];
        [self.position insertSegmentWithTitle:@"GK" atIndex:0 animated:NO];
        [self.position insertSegmentWithTitle:@"DEF" atIndex:1 animated:NO];
        [self.position insertSegmentWithTitle:@"MID" atIndex:2 animated:NO];
        [self.position insertSegmentWithTitle:@"ATT" atIndex:3 animated:NO];

        [self.view addSubview:self.position];
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

    searchString = [self createSearchString:searchString forName:@"BirthDate" withAge:self.minAge.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"BirthDate" withAge:self.maxAge.text andComparisation:@">="];

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