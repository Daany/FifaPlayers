//
// Created by Patrick Kaufmann on 5/18/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPFilterPage6Controller.h"


@implementation FPFilterPage6Controller
{

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"GKKicking"];
        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"GKReflexes"];
        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"GKPosition"];

        self.minGKKicking = [self createTextField:CGRectMake(190, 10, 50, 30)];
        self.maxGKKicking = [self createTextField:CGRectMake(260, 10, 50, 30)];
        self.minGKReflexes = [self createTextField:CGRectMake(190, 50, 50, 30)];
        self.maxGKReflexes = [self createTextField:CGRectMake(260, 50, 50, 30)];
        self.minGKPosition = [self createTextField:CGRectMake(190, 90, 50, 30)];
        self.maxGKPosition = [self createTextField:CGRectMake(260, 90, 50, 30)];
    }

    return self;
}

-(void)resetFilter
{
    self.minGKKicking.text = @"";
    self.maxGKKicking.text = @"";
    self.minGKReflexes.text = @"";
    self.maxGKReflexes.text = @"";
    self.minGKPosition.text = @"";
    self.maxGKPosition.text = @"";
}

- (NSString *)getSearchString
{
    NSString *searchString = @"";

    searchString = [self createSearchString:searchString forName:@"GKKicking" withValue:self.minGKKicking.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"GKKicking" withValue:self.maxGKKicking.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"GKReflexes" withValue:self.minGKReflexes.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"GKReflexes" withValue:self.maxGKReflexes.text andComparisation:@"<="];
    searchString = [self createSearchString:searchString forName:@"GKPosition" withValue:self.minGKPosition.text andComparisation:@">="];
    searchString = [self createSearchString:searchString forName:@"GKPosition" withValue:self.maxGKPosition.text andComparisation:@"<="];

    return searchString;
}

@end