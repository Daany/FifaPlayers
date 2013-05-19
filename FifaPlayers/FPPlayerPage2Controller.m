//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPPlayerPage2Controller.h"
#import "FPPlayer.h"


@implementation FPPlayerPage2Controller
{

}


- (id)initWithFrame:(CGRect)frame andPlayer:(FPPlayer *)player
{
    self = [super initWithFrame:frame andPlayer:player];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"WeakFoot"];
        [self createStars:CGRectMake(160, 10, 140, 30) andInt:self.player.WeakFoot];

        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"SkillMoves"];
        [self createStars:CGRectMake(160, 50, 140, 30) andInt:self.player.SkillMoves];

        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"BallControl"];
        [self createLabel:CGRectMake(160, 90, 30, 30) andInt:self.player.BallControl];

        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Crossing"];
        [self createLabel:CGRectMake(160, 130, 30, 30) andInt:self.player.Crossing];

        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Curve"];
        [self createLabel:CGRectMake(160, 170, 30, 30) andInt:self.player.Curve];

        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"Finishing"];
        [self createLabel:CGRectMake(160, 210, 30, 30) andInt:self.player.Finishing];

        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"FreeKicks"];
        [self createLabel:CGRectMake(160, 250, 30, 30) andInt:self.player.FreeKicks];

        [self createLabel:CGRectMake(10, 290, 140, 30) andName:@"Dribbling"];
        [self createLabel:CGRectMake(160, 290, 30, 30) andInt:self.player.Dribbling];
    }

    return self;
}

@end