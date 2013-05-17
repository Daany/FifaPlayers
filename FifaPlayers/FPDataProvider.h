//
//  FPDataProvider.h
//  FifaPlayers
//
//  Created by Dany on 16.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FPDataProvider : NSObject <NSURLConnectionDelegate>

-(void) SearchPlayer:(NSString *) searchString withResponseMethod:(SEL*)responseMethod;
-(NSArray*) GetPlayersByUrl:(NSString*) url;

@property (nonatomic, strong) NSMutableData *responseData;

@end
