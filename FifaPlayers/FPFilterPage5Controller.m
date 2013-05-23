//
// Created by Patrick Kaufmann on 5/18/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPFilterPage5Controller.h"


@implementation FPFilterPage5Controller
{

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"Stamina"];
        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"Strength"];
        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"Aggression"];
        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Positioning"];
        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Interceptions"];
        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"Vision"];
        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"GKDiving"];
        [self createLabel:CGRectMake(10, 290, 140, 30) andName:@"GKHandling"];

        self.minStamina = [self createTextField:CGRectMake(190, 10, 50, 30)];
        self.maxStamina = [self createTextField:CGRectMake(260, 10, 50, 30)];
        self.minStrength = [self createTextField:CGRectMake(190, 50, 50, 30)];
        self.maxStrength = [self createTextField:CGRectMake(260, 50, 50, 30)];
        self.minAggression = [self createTextField:CGRectMake(190, 90, 50, 30)];
        self.maxAggression = [self createTextField:CGRectMake(260, 90, 50, 30)];
        self.minPositioning = [self createTextField:CGRectMake(190, 130, 50, 30)];
        self.maxPositioning = [self createTextField:CGRectMake(260, 130, 50, 30)];
        self.minInterceptions = [self createTextField:CGRectMake(190, 170, 50, 30)];
        self.maxInterceptions = [self createTextField:CGRectMake(260, 170, 50, 30)];
        self.minVision = [self createTextField:CGRectMake(190, 210, 50, 30)];
        self.maxVision = [self createTextField:CGRectMake(260, 210, 50, 30)];
        self.minGKDiving = [self createTextField:CGRectMake(190, 250, 50, 30)];
        self.maxGKDiving = [self createTextField:CGRectMake(260, 250, 50, 30)];
        self.minGKHandling = [self createTextField:CGRectMake(190, 290, 50, 30)];
        self.maxGKHandling = [self createTextField:CGRectMake(260, 290, 50, 30)];
    }

    return self;
}

-(void)resetFilter
{
    self.minStamina.text = @"";
    self.maxStamina.text = @"";
    self.minStrength.text = @"";
    self.maxStrength.text = @"";
    self.minAggression.text = @"";
    self.maxAggression.text = @"";
    self.minPositioning.text = @"";
    self.maxPositioning.text = @"";
    self.minInterceptions.text = @"";
    self.maxInterceptions.text = @"";
    self.minVision.text = @"";
    self.maxVision.text = @"";
    self.minGKDiving.text = @"";
    self.maxGKDiving.text = @"";
    self.minGKHandling.text = @"";
    self.maxGKHandling.text = @"";
}

- (NSString *)getSearchString
{
    NSString *searchString = @"";

    searchString = [self createSearchString:searchString forName:@"Stamina" withValue:self.minStamina.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Stamina" withValue:self.maxStamina.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Strength" withValue:self.minStrength.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Strength" withValue:self.maxStrength.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Aggression" withValue:self.minAggression.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Aggression" withValue:self.maxAggression.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Positioning" withValue:self.minPositioning.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Positioning" withValue:self.maxPositioning.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Interceptions" withValue:self.minInterceptions.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Interceptions" withValue:self.maxInterceptions.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Vision" withValue:self.minVision.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Vision" withValue:self.maxVision.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"GKDiving" withValue:self.minGKDiving.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"GKDiving" withValue:self.maxGKDiving.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"GKHandling" withValue:self.minGKHandling.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"GKHandling" withValue:self.maxGKHandling.text andComparisation:@"<="];

    return searchString;
}

@end