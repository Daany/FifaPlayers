//
// Created by Patrick Kaufmann on 5/17/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FPBaseFilterController.h"

@interface FPFilterPage1Controller : FPBaseFilterController

@property(nonatomic, strong) UITextField *minOverall;
@property(nonatomic, strong) UITextField *maxOverall;
@property(nonatomic, strong) UITextField *minPotential;
@property(nonatomic, strong) UITextField *minAge;
@property(nonatomic, strong) UITextField *maxAge;

@property(nonatomic, strong) UISegmentedControl *position;
@property(nonatomic, strong) UITextField *maxPotential;
@property(nonatomic, strong) UITextField *minWeakFoot;
@property(nonatomic, strong) UITextField *maxWeakFoot;
@property(nonatomic, strong) UISegmentedControl *foot;
@property(nonatomic, strong) UITextField *minSkill;
@property(nonatomic, strong) UITextField *maxSkill;
@end