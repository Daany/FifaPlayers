//
//  FPDataProvider.m
//  FifaPlayers
//
//  Created by Dany on 16.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import "FPDataProvider.h"
#import "FPPlayer.h"
#import "objc/runtime.h"
#import "AFNetworking.h"
#import "NSString+URLEncode.h"

@implementation FPDataProvider

NSMutableArray *_responseData;

-(void) SearchPlayer:(NSString *) searchString withResponseMethod:(void (^)(NSMutableArray *players)) responseMethod
{
    searchString = [searchString urlEncodeUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [[NSString alloc] initWithFormat:@"http://fifa.dzim.ch/api/players?q=%@", searchString];
    [self GetPlayersByUrl:url withResponseMethod:responseMethod];
    //return [[NSArray alloc] initWithObjects:@"Lionel Messi", @"Cristiano Ronaldo", @"Franck Ribéry", @"Marco Reus", nil];
}

-(void) FilterPlayers:(NSString *)filter withResponseMethod:(void (^)(NSMutableArray *players)) responseMethod
{
    filter = [filter urlEncodeUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [[NSString alloc] initWithFormat:@"http://fifa.dzim.ch/api/players?f=%@", filter];
    [self GetPlayersByUrl:url withResponseMethod:responseMethod];
}


-(void) GetPlayersByUrl:(NSString*) strUrl withResponseMethod:(void (^)(NSMutableArray *players))responseMethod
{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:strUrl]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
    {
        NSMutableArray *players = [[NSMutableArray alloc]init];
        
        for(int i = 0; i < [JSON count]; i++)
        {
            FPPlayerBase *player = [[FPPlayerBase alloc] init];
            
            id playerJson = [JSON objectAtIndex:i];
            player.Fullname = [playerJson objectForKey:@"Fullname"];
            player.PlayerId = [playerJson objectForKey:@"PlayerId"];
            player.Club = [playerJson objectForKey:@"Club"];
            player.Position = [playerJson objectForKey:@"Position"];
            player.Potential = [[playerJson objectForKey:@"Potential"] intValue];
            player.TotalSkill = [[playerJson objectForKey:@"TotalSkill"] intValue];
            player.BirthDate = [self convertToDate:[playerJson objectForKey:@"BirthDate"]];
            
            [players addObject:player];
        }
        
        responseMethod(players);
        //for (NSString *key in jsonDict) {
            
        //    id obj = [jsonDict objectForKey:key];
            
            //id value = [jsonDict objectForKey:key];
            // do stuff
        //}
    }
                                         
    failure:^(NSURLRequest *request, NSHTTPURLResponse *response,
    NSError *error, id JSON) { NSLog(@"Request Failure Because %@",[error userInfo]); }];
    
    [operation start];
        
}

-(NSDate * )convertToDate:(NSString *) str
{
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
    
    NSDate *date = [dateFormat dateFromString:str];
        
    return date;
}

@end
