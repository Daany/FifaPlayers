//
// Created by Patrick Kaufmann on 5/18/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BaseFilterController.h"


@interface FPFilterPage2Controller : BaseFilterController
@property(nonatomic, strong) UISegmentedControl *attackWorkRate;
@property(nonatomic, strong) UISegmentedControl *defenseWorkRate;
@property(nonatomic, strong) UITextField *minBallcontrol;
@property(nonatomic, strong) UITextField *maxBallcontrol;
@property(nonatomic, strong) UITextField *minCrossing;
@property(nonatomic, strong) UITextField *maxCrossing;
@property(nonatomic, strong) UITextField *minCurve;
@property(nonatomic, strong) UITextField *maxCurve;
@property(nonatomic, strong) UITextField *minDribbling;
@property(nonatomic, strong) UITextField *maxDribbling;
@property(nonatomic, strong) UITextField *minFinishing;
@property(nonatomic, strong) UITextField *maxFinishing;
@property(nonatomic, strong) UITextField *minFreeKicks;
@property(nonatomic, strong) UITextField *maxFreeKicks;
@end