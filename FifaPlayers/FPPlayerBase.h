//
//  FPPlayerBase.h
//  FifaPlayers
//
//  Created by Dany on 16.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FPPlayerBase : NSObject<NSCoding>

@property (nonatomic) NSString *PlayerId;
@property (nonatomic) NSString *Fullname;
@property (nonatomic) NSString *Club;

@property (nonatomic) NSArray *Position;
@property (nonatomic) int TotalSkill;
@property (nonatomic) NSDate *BirthDate;
@property (nonatomic) int Potential;

@end
