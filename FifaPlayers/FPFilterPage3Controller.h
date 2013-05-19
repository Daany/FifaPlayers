//
// Created by Patrick Kaufmann on 5/18/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "FPBaseFilterController.h"


@interface FPFilterPage3Controller : FPBaseFilterController
@property(nonatomic, strong) UITextField *minHeading;
@property(nonatomic, strong) UITextField *maxHeading;
@property(nonatomic, strong) UITextField *minLongPassing;
@property(nonatomic, strong) UITextField *maxLongPassing;
@property(nonatomic, strong) UITextField *minLongShots;
@property(nonatomic, strong) UITextField *maxLongShots;
@property(nonatomic, strong) UITextField *minMarking;
@property(nonatomic, strong) UITextField *maxMarking;
@property(nonatomic, strong) UITextField *minPenalties;
@property(nonatomic, strong) UITextField *maxPenalties;
@property(nonatomic, strong) UITextField *minShortPassing;
@property(nonatomic, strong) UITextField *maxShortPassing;
@property(nonatomic, strong) UITextField *minShotPower;
@property(nonatomic, strong) UITextField *maxShotPower;
@property(nonatomic, strong) UITextField *minSlidingTackle;
@property(nonatomic, strong) UITextField *maxSlidingTackle;
@end