//
// Created by Patrick Kaufmann on 5/19/13.
// Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class FPPlayerBase;


@interface FPFavoriteProvider : NSObject


@property(nonatomic, strong) NSMutableArray *favorites;

+ (FPFavoriteProvider *)getInstance;

- (void)addToFavorite:(FPPlayerBase *)player;

- (void)removeFromFavorite:(FPPlayerBase *)player;

- (bool)playerIsFavorite:(FPPlayerBase *)player;
@end