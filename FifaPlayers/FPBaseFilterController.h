//
// Created by Patrick Kaufmann on 5/17/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface FPBaseFilterController : NSObject<UITextFieldDelegate>

@property(nonatomic, strong) UIView *view;

@property(nonatomic, strong) UIButton *doneButton;

- (UITextField *)createTextField:(CGRect)frame;

- (UILabel *)createLabel:(CGRect)frame andName:(NSString *)name;

- (NSString *)createSearchString:(NSString *)searchString forName:(NSString *)name withValue:(NSString *)value andComparisation:(NSString *)comparer;

- (NSString *)createSearchString:(NSString *)searchString forName:(NSString *)name withAge:(NSString *)value andComparisation:(NSString *)comparer;

- (id)initWithFrame:(CGRect)frame;

- (NSString *)getSearchString;

- (NSString *)getPositionString;

@end