//
// Created by Patrick Kaufmann on 5/17/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FPFilterPage1Controller : NSObject
@property(nonatomic, strong) UIView *view;
@property(nonatomic, strong) UITextField *minOverall;

@property(nonatomic, strong) UITextField *maxOverall;

@property(nonatomic, strong) UITextField *minPotential;

@property(nonatomic, strong) UITextField *minAge;

@property(nonatomic, strong) UITextField *maxAge;

- (id)initWithFrame:(CGRect)frame;
@end