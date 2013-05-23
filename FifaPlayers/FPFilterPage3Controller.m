//
// Created by Patrick Kaufmann on 5/18/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPFilterPage3Controller.h"


@implementation FPFilterPage3Controller
{

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"Heading"];
        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"LongPassing"];
        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"LongShots"];
        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Marking"];
        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Penalties"];
        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"ShortPassing"];
        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"ShotPower"];
        [self createLabel:CGRectMake(10, 290, 140, 30) andName:@"SlidingTackle"];

        self.minHeading = [self createTextField:CGRectMake(190, 10, 50, 30)];
        self.maxHeading = [self createTextField:CGRectMake(260, 10, 50, 30)];
        self.minLongPassing = [self createTextField:CGRectMake(190, 50, 50, 30)];
        self.maxLongPassing = [self createTextField:CGRectMake(260, 50, 50, 30)];
        self.minLongShots = [self createTextField:CGRectMake(190, 90, 50, 30)];
        self.maxLongShots = [self createTextField:CGRectMake(260, 90, 50, 30)];
        self.minMarking = [self createTextField:CGRectMake(190, 130, 50, 30)];
        self.maxMarking = [self createTextField:CGRectMake(260, 130, 50, 30)];
        self.minPenalties = [self createTextField:CGRectMake(190, 170, 50, 30)];
        self.maxPenalties = [self createTextField:CGRectMake(260, 170, 50, 30)];
        self.minShortPassing = [self createTextField:CGRectMake(190, 210, 50, 30)];
        self.maxShortPassing = [self createTextField:CGRectMake(260, 210, 50, 30)];
        self.minShotPower = [self createTextField:CGRectMake(190, 250, 50, 30)];
        self.maxShotPower = [self createTextField:CGRectMake(260, 250, 50, 30)];
        self.minSlidingTackle = [self createTextField:CGRectMake(190, 290, 50, 30)];
        self.maxSlidingTackle = [self createTextField:CGRectMake(260, 290, 50, 30)];
    }

    return self;
}

-(void)resetFilter
{
    self.minHeading.text = @"";
    self.maxHeading.text = @"";
    self.minLongPassing.text = @"";
    self.maxLongPassing.text = @"";
    self.minLongShots.text = @"";
    self.maxLongShots.text = @"";
    self.minMarking.text = @"";
    self.maxMarking.text = @"";
    self.minPenalties.text = @"";
    self.maxPenalties.text = @"";
    self.minShortPassing.text = @"";
    self.maxShortPassing.text = @"";
    self.minShotPower.text = @"";
    self.maxShotPower.text = @"";
    self.minSlidingTackle.text = @"";
    self.maxSlidingTackle.text = @"";
}

- (NSString *)getSearchString
{
    NSString *searchString = @"";

    searchString = [self createSearchString:searchString forName:@"Heading" withValue:self.minHeading.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Heading" withValue:self.maxHeading.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"LongPassing" withValue:self.minLongPassing.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"LongPassing" withValue:self.maxLongPassing.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"LongShots" withValue:self.minLongShots.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"LongShots" withValue:self.maxLongShots.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Marking" withValue:self.minMarking.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Marking" withValue:self.maxMarking.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"Penalties" withValue:self.minPenalties.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"Penalties" withValue:self.maxPenalties.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"ShortPassing" withValue:self.minShortPassing.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"ShortPassing" withValue:self.maxShortPassing.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"ShotPower" withValue:self.minShotPower.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"ShotPower" withValue:self.maxShotPower.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"SlidingTackle" withValue:self.minSlidingTackle.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"SlidingTackle" withValue:self.maxSlidingTackle.text andComparisation:@"<="];

    return searchString;
}


@end