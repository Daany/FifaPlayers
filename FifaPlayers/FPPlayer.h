//
//  FPPlayer.h
//  FifaPlayers
//
//  Created by Dany on 16.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fpplayerbase.h"

@interface FPPlayer : FPPlayerBase


@property (nonatomic) int PlayerNr;

@property (nonatomic) NSString *Firstname;
@property (nonatomic) NSString *Name;

@property (nonatomic) NSString *League;
@property (nonatomic) NSString *Nation;
@property (nonatomic) NSString *PositionString;
@property (nonatomic) int Age;
@property (nonatomic) NSString *Height;
@property (nonatomic) NSString *Foot;
@property (nonatomic) NSString *AttackWorkrate;
@property (nonatomic) NSString *DefenseWorkrate;
@property (nonatomic) int WeakFoot;
@property (nonatomic) int SkillMoves;
@property (nonatomic) NSString *TraitsString;
@property (nonatomic) NSArray *Traits;

@property (nonatomic) int BallControl;
@property (nonatomic) int Crossing;
@property (nonatomic) int Curve;
@property (nonatomic) int Dribbling;
@property (nonatomic) int Finishing;
@property (nonatomic) int FreeKicks;
@property (nonatomic) int Heading;
@property (nonatomic) int LongPassing;
@property (nonatomic) int LongShots;
@property (nonatomic) int Marking;
@property (nonatomic) int Penalties;
@property (nonatomic) int ShortPassing;
@property (nonatomic) int ShotPower;
@property (nonatomic) int SlidingTackle;
@property (nonatomic) int StandingTackle;
@property (nonatomic) int Volleys;
@property (nonatomic) int Acceleration;
@property (nonatomic) int Agility;
@property (nonatomic) int Balance;
@property (nonatomic) int Jumping;
@property (nonatomic) int Reactions;
@property (nonatomic) int SprintSpeed;
@property (nonatomic) int Stamina;
@property (nonatomic) int Strength;
@property (nonatomic) int Aggression;
@property (nonatomic) int Positioning;
@property (nonatomic) int Interceptions;
@property (nonatomic) int Vision;
@property (nonatomic) int GKDiving;
@property (nonatomic) int GKHandling;
@property (nonatomic) int GKKicking;
@property (nonatomic) int GKReflexes;
@property (nonatomic) int GKSpeed;
@property (nonatomic) int GKPosition;
@property (nonatomic) bool IsGoalKeeper;
@property (nonatomic) NSString *TradingValue;

@property (nonatomic) NSString *Weight;
@property (nonatomic) NSDate *JoinedClub;
@property (nonatomic) NSDate *ContractExpireDate;

@property (nonatomic) int SoFifaId;

@end
