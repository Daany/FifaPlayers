//
//  FPDataProvider.h
//  FifaPlayers
//
//  Created by Dany on 16.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FPDataProvider : NSObject <NSURLConnectionDelegate>

-(void) SearchPlayer:(NSString *) searchString withResponseMethod:(void (^)(NSMutableArray *players)) responseMethod;

- (void)FilterPlayers:(NSString *)filter andPositions:(NSString *)positions withResponseMethod:(void (^)(NSMutableArray *))responseMethod;

-(NSArray*) GetPlayersByUrl:(NSString*) url;

@property (nonatomic, strong) NSMutableData *responseData;

@end
