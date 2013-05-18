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
        UILabel *lblMinOverall= [self createLabel:CGRectMake(10, 10, 100, 30) andName:@"Min-Overall"];
        UILabel *lblMaxOverall = [self createLabel:CGRectMake(10, 50, 100, 30) andName:@"Max-Overall"];
        UILabel *lblMinPotential = [self createLabel:CGRectMake(10, 90, 100, 30) andName:@"Max-Overall"];
        UILabel *lblMinAge = [self createLabel:CGRectMake(10, 130, 100, 30) andName:@"Min Age"];
        UILabel *lblMaxAge = [self createLabel:CGRectMake(10, 170, 100, 30) andName:@"Max Age"];

        self.minOverall = [self createTextField:CGRectMake(200, 10, 100, 30)];
        self.maxOverall = [self createTextField:CGRectMake(200, 50, 100, 30)];
        self.minPotential = [self createTextField:CGRectMake(200, 90, 100, 30)];
        self.minAge = [self createTextField:CGRectMake(200, 130, 100, 30)];
        self.maxAge = [self createTextField:CGRectMake(200, 170, 100, 30)];
    }

    return self;
}

- (NSString *)getSearchString
{
    NSString *searchString = @"";

    searchString = [self createSearchString:searchString forName:@"TotalSkill" withValue:self.minOverall.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"TotalSkill" withValue:self.maxOverall.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Potential" withValue:self.minPotential.text andComparisation:@">="];

    searchString = [self createSearchString:searchString forName:@"BirthDate" withAge:self.minAge.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"BirthDate" withAge:self.maxAge.text andComparisation:@">="];

    return searchString;
}


@end