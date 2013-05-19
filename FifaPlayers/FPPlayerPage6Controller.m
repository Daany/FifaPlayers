//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPPlayerPage6Controller.h"
#import "FPPlayer.h"


@implementation FPPlayerPage6Controller
{

}


- (id)initWithFrame:(CGRect)frame andPlayer:(FPPlayer *)player
{
    self = [super initWithFrame:frame andPlayer:player];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"GKKicking"];
        [self createLabel:CGRectMake(160, 10, 30, 30) andInt:self.player.GKKicking];

        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"GKReflexes"];
        [self createLabel:CGRectMake(160, 50, 30, 30) andInt:self.player.GKReflexes];

        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"GPPosition"];
        [self createLabel:CGRectMake(160, 90, 30, 30) andInt:self.player.GKPosition];

        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"AttackWorkRate"];
        [self createLabel:CGRectMake(160, 130, 140, 30) andName:self.player.AttackWorkrate];

        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"DefenseWorkRate"];
        [self createLabel:CGRectMake(160, 170, 140, 30) andName:self.player.DefenseWorkrate];
    }

    return self;
}

@end