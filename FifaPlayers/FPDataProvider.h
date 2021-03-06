//
//  FPDataProvider.h
//  FifaPlayers
//
//  Created by Dany on 16.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FPPlayer.h"

@interface FPDataProvider : NSObject <NSURLConnectionDelegate>

- (void) SearchPlayer:(NSString *) searchString withResponseMethod:(void (^)(NSMutableArray *players)) responseMethod;

- (void)FilterPlayers:(NSString *)filter andPositions:(NSString *)positions withResponseMethod:(void (^)(NSMutableArray *))responseMethod;

- (void) GetPlayerByPlayerbase:(FPPlayerBase*)playerBase withResponseMethod:(void (^)(FPPlayer *player))responseMethod;

-(NSMutableArray*)GetFavoritePlayers;

- (NSArray*) GetPlayersByUrl:(NSString*) url;
-(void)AddToFavorite:(FPPlayer *) player;
-(void)RemoveFromFavorites:(NSString *)playerId;

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSMutableArray *favoritePlayers;

@end
