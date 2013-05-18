//
// Created by Patrick Kaufmann on 5/17/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BaseFilterController.h"


@implementation BaseFilterController
{

}

- (NSString *)createSearchString:(NSString *)searchString forName:(NSString *)name withValue:(NSString *)value andComparisation:(NSString *)comparer
{
    if(![value isEqualToString:@""])
    {
        return [searchString stringByAppendingFormat:@" AND %@ %@ %@", name, comparer, value];
    }
    return searchString;
}

- (NSString *)createSearchString:(NSString *)searchString forName:(NSString *)name withAge:(NSString *)value andComparisation:(NSString *)comparer
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM.dd.yyyy"];

    if(![value isEqualToString:@""])
    {
        int minAge = -1 * [value intValue];
        NSDate *now = [NSDate date];
        NSDate *minDate = [now dateByAddingTimeInterval:(minAge * 365 * 24 * 60 * 60)];
        searchString = [self createSearchString:searchString forName:name withValue:[formatter stringFromDate:minDate] andComparisation:comparer];
    }

    return searchString;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super init];

    if(self)
    {
        self.view = [[UIView alloc] initWithFrame: frame];
    }

    return self;
}

@end