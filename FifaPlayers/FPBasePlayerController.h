//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class FPPlayer;


@interface FPBasePlayerController : NSObject
@property(nonatomic, strong) UIView *view;

@property(nonatomic, strong) FPPlayer *player;

- (id)initWithFrame:(CGRect)frame andPlayer:(FPPlayer *)player;

- (UILabel *)createLabel:(CGRect)frame andName:(NSString *)name;

- (void)createStars:(CGRect)frame andInt:(int)stars;

- (UILabel *)createLabel:(CGRect)frame andInt:(int)integer;
@end