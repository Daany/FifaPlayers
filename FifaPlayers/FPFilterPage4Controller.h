//
// Created by Patrick Kaufmann on 5/18/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "BaseFilterController.h"


@interface FPFilterPage4Controller : BaseFilterController
@property(nonatomic, strong) UITextField *minStandingTackle;
@property(nonatomic, strong) UITextField *maxStandingTackle;
@property(nonatomic, strong) UITextField *minVolleys;
@property(nonatomic, strong) UITextField *maxVolleys;
@property(nonatomic, strong) UITextField *minAcceleration;
@property(nonatomic, strong) UITextField *maxAcceleration;
@property(nonatomic, strong) UITextField *minAgility;
@property(nonatomic, strong) UITextField *maxAgility;
@property(nonatomic, strong) UITextField *minBalance;
@property(nonatomic, strong) UITextField *maxBalance;
@property(nonatomic, strong) UITextField *minJumping;
@property(nonatomic, strong) UITextField *maxJumping;
@property(nonatomic, strong) UITextField *minReactions;
@property(nonatomic, strong) UITextField *maxReactions;
@property(nonatomic, strong) UITextField *minSprintSpeed;
@property(nonatomic, strong) UITextField *maxSprintSpeed;
@end