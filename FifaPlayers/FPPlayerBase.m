//
//  FPPlayerBase.m
//  FifaPlayers
//
//  Created by Dany on 16.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import "FPPlayerBase.h"

@implementation FPPlayerBase

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.Fullname forKey:@"Fullname"];
    [coder encodeObject:self.PlayerId forKey:@"PlayerID"];
    [coder encodeInt:self.Potential forKey:@"Potential"];
    [coder encodeObject:self.BirthDate forKey:@"BirthDate"];
    [coder encodeInt:self.TotalSkill forKey:@"TotalSkill"];
    [coder encodeObject:self.Club forKey:@"Club"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    if(self = [super init])
    {
        self.Fullname = [coder decodeObjectForKey:@"Fullname"];
        self.PlayerId = [coder decodeObjectForKey:@"PlayerID"];
        self.Potential = [coder decodeIntForKey:@"Potential"];
        self.BirthDate = [coder decodeObjectForKey:@"BirthDate"];
        self.TotalSkill = [coder decodeIntForKey:@"TotalSkill"];
        self.Club = [coder decodeObjectForKey:@"Club"];
    }

    return self;
}

@end
