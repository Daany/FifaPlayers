//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import "FPBasePlayerController.h"
#import "FPPlayer.h"

@implementation FPBasePlayerController
{

}

- (id)initWithFrame:(CGRect)frame andPlayer:(FPPlayer *)player
{
    self = [super init];

    if(self)
    {
        self.view = [[UIView alloc] initWithFrame: frame];
        self.player = player;
    }

    return self;
}

- (UILabel *)createLabel:(CGRect)frame andName:(NSString *)name
{
    UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.text = name;
    [self.view addSubview:lbl];
    return lbl;
}


- (void)createStars:(CGRect)frame andInt:(int)stars
{
    for(int i = 0; i < stars; i++)
    {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x + (i * 30), frame.origin.y, 22, 22)];
        [image setImage:[UIImage imageNamed:@"Skill.png"]];

        [self.view addSubview:image];
    }
}


- (UILabel *)createLabel:(CGRect)frame andInt:(int)integer
{
    UILabel *label = [self createLabel:frame andName:[NSString stringWithFormat:@"%i", integer]];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = 8;

    if(integer < 40)
    {
        label.backgroundColor = [UIColor colorWithRed:153.0/255.0 green:51.0/255.0 blue:0 alpha:1];
        label.textColor = [UIColor whiteColor];
    }
    else if(integer < 50)
    {
        label.backgroundColor = [UIColor colorWithRed:187.0/255.0 green:102.0/255.0 blue:0 alpha:1];
        label.textColor = [UIColor whiteColor];
    }
    else if(integer < 60)
    {
        label.backgroundColor = [UIColor colorWithRed:238/255.0 green:153/255.0 blue:0 alpha:1];
    }
    else if(integer < 70)
    {
        label.backgroundColor = [UIColor colorWithRed:1 green:238.0/255.0 blue:0 alpha:1];
    }
    else if(integer < 80)
    {
        label.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:255.0/255.0 blue:68.0/255.0 alpha:1];
    }
    else if(integer < 90)
    {
        label.backgroundColor = [UIColor colorWithRed:36.0/255.0 green:199.0/255.0 blue:0 alpha:1];
    }
    else
    {
        label.backgroundColor = [UIColor colorWithRed:22.0/255.0 green:122.0/255.0 blue:0 alpha:1];
        label.textColor = [UIColor whiteColor];
    }

    return label;
}


@end