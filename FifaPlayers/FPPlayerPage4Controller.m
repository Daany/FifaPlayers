//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPPlayerPage4Controller.h"
#import "FPPlayer.h"


@implementation FPPlayerPage4Controller
{

}


- (id)initWithFrame:(CGRect)frame andPlayer:(FPPlayer *)player
{
    self = [super initWithFrame:frame andPlayer:player];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"StandingTackle"];
        [self createLabel:CGRectMake(160, 10, 30, 30) andInt:self.player.StandingTackle];

        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"Volleys"];
        [self createLabel:CGRectMake(160, 50, 30, 30) andInt:self.player.Volleys];

        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"Acceleration"];
        [self createLabel:CGRectMake(160, 90, 30, 30) andInt:self.player.Acceleration];

        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Agility"];
        [self createLabel:CGRectMake(160, 130, 30, 30) andInt:self.player.Agility];

        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Balance"];
        [self createLabel:CGRectMake(160, 170, 30, 30) andInt:self.player.Balance];

        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"Jumping"];
        [self createLabel:CGRectMake(160, 210, 30, 30) andInt:self.player.Jumping];

        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"Reactions"];
        [self createLabel:CGRectMake(160, 250, 30, 30) andInt:self.player.Reactions];

        [self createLabel:CGRectMake(10, 290, 140, 30) andName:@"SprintSpeed"];
        [self createLabel:CGRectMake(160, 290, 30, 30) andInt:self.player.SprintSpeed];
    }

    return self;
}

@end