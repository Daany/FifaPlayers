//
// Created by Patrick Kaufmann on 5/17/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPBaseFilterController.h"


@implementation FPBaseFilterController
{

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

- (UITextField *)createTextField:(CGRect)frame
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.delegate = self;
    textField.clearButtonMode = UITextFieldViewModeNever;

    [self.view addSubview:textField];

    return textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}


- (UILabel *)createLabel:(CGRect)frame andName:(NSString *)name
{
    UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.text = name;
    [self.view addSubview:lbl];
    return lbl;
}

- (NSString *)createSearchString:(NSString *)searchString forName:(NSString *)name withValue:(NSString *)value andComparisation:(NSString *)comparer
{
    if(value != NULL && ![value isEqualToString:@""])
    {
        return [searchString stringByAppendingFormat:@" AND %@ %@ %@", name, comparer, value];
    }
    return searchString;
}

- (NSString *)createSearchString:(NSString *)searchString forName:(NSString *)name withAge:(NSString *)value andComparisation:(NSString *)comparer
{
    if(value != NULL && ![value isEqualToString:@""])
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM.dd.yyyy"];

        int minAge = -1 * [value intValue];
        NSDate *now = [NSDate date];
        NSDate *minDate = [now dateByAddingTimeInterval:(minAge * 365 * 24 * 60 * 60)];
        searchString = [self createSearchString:searchString forName:name withValue:[formatter stringFromDate:minDate] andComparisation:comparer];
    }

    return searchString;
}

- (NSString *)getSearchString
{
    return @"";
}


- (NSString *)getPositionString
{
    return @"";
}


@end