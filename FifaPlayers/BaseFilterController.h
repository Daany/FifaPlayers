//
// Created by Patrick Kaufmann on 5/17/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface BaseFilterController : NSObject

@property(nonatomic, strong) UIView *view;

- (NSString *)createSearchString:(NSString *)searchString forName:(NSString *)name withValue:(NSString *)value andComparisation:(NSString *)comparer;

- (NSString *)createSearchString:(NSString *)searchString forName:(NSString *)name withAge:(NSString *)value andComparisation:(NSString *)comparer;

- (id)initWithFrame:(CGRect)frame;

- (NSString *)getSearchString;

@end