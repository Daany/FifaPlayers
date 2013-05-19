//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPPlayerPage1Controller.h"
#import "FPPlayer.h"


@implementation FPPlayerPage1Controller
{

}

- (id)initWithFrame:(CGRect)frame andPlayer:(FPPlayer *)player
{
    self = [super initWithFrame:frame andPlayer:player];
    if(self)
    {
        [self createLabel:CGRectMake(10, 10, 140, 30) andName:@"Fullname"];
        [self createLabel:CGRectMake(160, 10, 140, 30) andName:self.player.Fullname];

        [self createLabel:CGRectMake(10, 50, 140, 30) andName:@"Club"];
        [self createLabel:CGRectMake(160, 50, 140, 30) andName:self.player.Club];

        [self createLabel:CGRectMake(10, 90, 140, 30) andName:@"Positions"];
        [self createLabel:CGRectMake(160, 90, 140, 30) andName:self.player.PositionString];

        [self createLabel:CGRectMake(10, 130, 140, 30) andName:@"Age"];
        [self createLabel:CGRectMake(160, 130, 140, 30) andName:[NSString stringWithFormat:@"%i", self.player.Age]];

        [self createLabel:CGRectMake(10, 170, 140, 30) andName:@"Height"];
        [self createLabel:CGRectMake(160, 170, 140, 30) andName:self.player.Height];

        [self createLabel:CGRectMake(10, 210, 140, 30) andName:@"Foot"];
        [self createLabel:CGRectMake(160, 210, 140, 30) andName:self.player.Foot];


        [self createLabel:CGRectMake(10, 250, 140, 30) andName:@"Overall"];
        [self createLabel:CGRectMake(160, 250, 30, 30) andInt:self.player.TotalSkill];

        [self createLabel:CGRectMake(10, 290, 140, 30) andName:@"Potential"];
        [self createLabel:CGRectMake(160, 290, 30, 30) andInt:self.player.Potential];
    }

    return self;
}


@end