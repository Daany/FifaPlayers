//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPPlayerPage3Controller.h"
#import "FPPlayer.h"


@implementation FPPlayerPage3Controller
{

}


- (id)initWithFrame:(CGRect)frame andPlayer:(FPPlayer *)player
{
    self = [super initWithFrame:frame andPlayer:player];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"Heading"];
        [self createLabel:CGRectMake(160, 10, 30, 30) andInt:self.player.Heading];

        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"LongPassing"];
        [self createLabel:CGRectMake(160, 50, 30, 30) andInt:self.player.LongPassing];

        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"LongShots"];
        [self createLabel:CGRectMake(160, 90, 30, 30) andInt:self.player.LongShots];

        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Marking"];
        [self createLabel:CGRectMake(160, 130, 30, 30) andInt:self.player.Marking];

        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Penalties"];
        [self createLabel:CGRectMake(160, 170, 30, 30) andInt:self.player.Penalties];

        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"ShortPassing"];
        [self createLabel:CGRectMake(160, 210, 30, 30) andInt:self.player.ShortPassing];

        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"ShotPower"];
        [self createLabel:CGRectMake(160, 250, 30, 30) andInt:self.player.ShotPower];

        [self createLabel:CGRectMake(10, 290, 140, 30) andName:@"SlidingTackle"];
        [self createLabel:CGRectMake(160, 290, 30, 30) andInt:self.player.SlidingTackle];
    }

    return self;
}

@end