//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPPlayerPage5Controller.h"
#import "FPPlayer.h"


@implementation FPPlayerPage5Controller
{

}


- (id)initWithFrame:(CGRect)frame andPlayer:(FPPlayer *)player
{
    self = [super initWithFrame:frame andPlayer:player];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"Stamina"];
        [self createLabel:CGRectMake(160, 10, 30, 30) andInt:self.player.Stamina];

        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"Strength"];
        [self createLabel:CGRectMake(160, 50, 30, 30) andInt:self.player.Strength];

        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"Aggression"];
        [self createLabel:CGRectMake(160, 90, 30, 30) andInt:self.player.Aggression];

        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Positioning"];
        [self createLabel:CGRectMake(160, 130, 30, 30) andInt:self.player.Positioning];

        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Interceptions"];
        [self createLabel:CGRectMake(160, 170, 30, 30) andInt:self.player.Interceptions];

        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"Vision"];
        [self createLabel:CGRectMake(160, 210, 30, 30) andInt:self.player.Vision];

        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"GKDiving"];
        [self createLabel:CGRectMake(160, 250, 30, 30) andInt:self.player.GKDiving];

        [self createLabel:CGRectMake(10, 290, 140, 30) andName:@"GKHandling"];
        [self createLabel:CGRectMake(160, 290, 30, 30) andInt:self.player.GKHandling];
    }

    return self;
}

@end