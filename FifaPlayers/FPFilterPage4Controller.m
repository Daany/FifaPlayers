//
// Created by Patrick Kaufmann on 5/18/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPFilterPage4Controller.h"


@implementation FPFilterPage4Controller
{

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"StandingTackle"];
        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"Volleys"];
        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"Acceleration"];
        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Agility"];
        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Balance"];
        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"Jumping"];
        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"Reactions"];
        [self createLabel:CGRectMake(10, 290, 140, 30) andName:@"SprintSpeed"];

        self.minStandingTackle = [self createTextField:CGRectMake(190, 10, 50, 30)];
        self.maxStandingTackle = [self createTextField:CGRectMake(260, 10, 50, 30)];
        self.minVolleys  = [self createTextField:CGRectMake(190, 50, 50, 30)];
        self.maxVolleys = [self createTextField:CGRectMake(260, 50, 50, 30)];
        self.minAcceleration = [self createTextField:CGRectMake(190, 90, 50, 30)];
        self.maxAcceleration = [self createTextField:CGRectMake(260, 90, 50, 30)];
        self.minAgility = [self createTextField:CGRectMake(190, 130, 50, 30)];
        self.maxAgility = [self createTextField:CGRectMake(260, 130, 50, 30)];
        self.minBalance = [self createTextField:CGRectMake(190, 170, 50, 30)];
        self.maxBalance = [self createTextField:CGRectMake(260, 170, 50, 30)];
        self.minJumping = [self createTextField:CGRectMake(190, 210, 50, 30)];
        self.maxJumping = [self createTextField:CGRectMake(260, 210, 50, 30)];
        self.minReactions = [self createTextField:CGRectMake(190, 250, 50, 30)];
        self.maxReactions = [self createTextField:CGRectMake(260, 250, 50, 30)];
        self.minSprintSpeed = [self createTextField:CGRectMake(190, 290, 50, 30)];
        self.maxSprintSpeed = [self createTextField:CGRectMake(260, 290, 50, 30)];
    }

    return self;
}

- (NSString *)getSearchString
{
    NSString *searchString = @"";

    searchString = [self createSearchString:searchString forName:@"StandingTackle" withValue:self.minStandingTackle.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"StandingTackle" withValue:self.maxStandingTackle.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Volleys" withValue:self.minVolleys.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Volleys" withValue:self.maxVolleys.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Acceleration" withValue:self.minAcceleration.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Acceleration" withValue:self.maxAcceleration.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Agility" withValue:self.minAgility.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Agility" withValue:self.maxAgility.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Balance" withValue:self.minBalance.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Balance" withValue:self.maxBalance.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Jumping" withValue:self.minJumping.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Jumping" withValue:self.maxJumping.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Reactions" withValue:self.minReactions.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Reactions" withValue:self.maxReactions.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"SprintSpeed" withValue:self.minSprintSpeed.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"SprintSpeed" withValue:self.maxSprintSpeed.text andComparisation:@"<="];

    return searchString;
}


@end