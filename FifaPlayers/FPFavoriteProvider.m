//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FPFavoriteProvider.h"
#import "FPPlayerBase.h"


@implementation FPFavoriteProvider
{

}

static FPFavoriteProvider *sharedSingleton;

- (id)init
{
    self = [super init];
    if(self)
    {
        self.favorites = [[NSMutableArray alloc] init];
    }

    return self;
}

- (void)addToFavorite:(FPPlayerBase *)player
{
    if(![self playerIsFavorite:player])
    {
        [self.favorites addObject:player];
    }
}

- (void)removeFromFavorite:(FPPlayerBase *)player
{
    if([self playerIsFavorite:player])
    {
        __block int index;

        [self.favorites enumerateObjectsUsingBlock:^(FPPlayerBase *obj, NSUInteger idx, BOOL *stop)
        {
            if([obj.PlayerId isEqualToString:player.PlayerId])
            {
                index = idx;
                *stop = YES;
            }
        }];

        [self.favorites removeObjectAtIndex:index];
    }
}

- (bool)playerIsFavorite:(FPPlayerBase *)player
{
    __block bool found = NO;

    [self.favorites enumerateObjectsUsingBlock:^(FPPlayerBase *obj, NSUInteger idx, BOOL *stop)
    {
        if([obj.PlayerId isEqualToString:player.PlayerId])
        {
            found = YES;
            *stop = YES;
        }
    }];

    return found;
}

+ (FPFavoriteProvider *)getInstance
{
    @synchronized(self)
    {
        if (!sharedSingleton) sharedSingleton = [[FPFavoriteProvider alloc] init];
        return sharedSingleton;
    }
}


@end