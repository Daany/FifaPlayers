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
#import "FPPlayer.h"

@implementation FPDataProvider

NSMutableArray *_responseData;

-(void) SearchPlayer:(NSString *) searchString withResponseMethod:(void (^)(NSMutableArray *players)) responseMethod
{
    searchString = [searchString urlEncodeUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [[NSString alloc] initWithFormat:@"http://fifa.dzim.ch/api/players?q=%@", searchString];
    [self GetPlayersByUrl:url withResponseMethod:responseMethod];
    //return [[NSArray alloc] initWithObjects:@"Lionel Messi", @"Cristiano Ronaldo", @"Franck Ribéry", @"Marco Reus", nil];
}

-(void) FilterPlayers:(NSString *)filter andPositions:(NSString *)positions withResponseMethod:(void (^)(NSMutableArray *players)) responseMethod
{
    filter = [filter urlEncodeUsingEncoding:NSUTF8StringEncoding];
    positions = [positions urlEncodeUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [[NSString alloc] initWithFormat:@"http://fifa.dzim.ch/api/players?f=%@&p=%@", filter, positions];
    [self GetPlayersByUrl:url withResponseMethod:responseMethod];
}

-(void) GetPlayerByPlayerbase:(FPPlayerBase*)playerBase withResponseMethod:(void (^)(FPPlayer *player))responseMethod
{
    NSString *url = [[NSString alloc] initWithFormat:@"http://fifa.dzim.ch/api/players?id=%@", playerBase.PlayerId];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
    {
        FPPlayer *player = [[FPPlayer alloc] init];
        player.Fullname = [JSON objectForKey:@"Fullname"];
        player.PlayerId = [JSON objectForKey:@"PlayerId"];
        player.Club = [JSON objectForKey:@"Club"];
        player.Position = [JSON objectForKey:@"Position"];

        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
        NSDate *birthDate = [formatter dateFromString:[JSON objectForKey:@"BirthDate"]];
        NSDate *now = [NSDate date];
        NSTimeInterval difference = [now timeIntervalSinceDate:birthDate];
        int years = floor(difference / 86400 / 365);
        player.Age = years;
        player.Potential = [[JSON objectForKey:@"Potential"] intValue];
        player.TotalSkill = [[JSON objectForKey:@"TotalSkill"] intValue];
        player.BirthDate = [self convertToDate:[JSON objectForKey:@"BirthDate"]];
        
        player.Acceleration = [[JSON objectForKey:@"Acceleration"] intValue];
        player.Aggression = [[JSON objectForKey:@"Aggression"] intValue];
        player.Agility = [[JSON objectForKey:@"Agility"] intValue];
        player.AttackWorkrate = [JSON objectForKey:@"AttackWorkrate"];
        player.Balance = [[JSON objectForKey:@"Balance"]intValue];
        player.BallControl = [[JSON objectForKey:@"BallControl"] intValue];
        player.ContractExpireDate = [self convertToDate:[JSON objectForKey:@"ContractExpireDate"]];
        player.Crossing = [[JSON objectForKey:@"Crossing"] intValue];
        player.Curve = [[JSON objectForKey:@"Curve"] intValue];
        player.DefenseWorkrate = [JSON objectForKey:@"DefenseWorkrate"];
        player.Dribbling = [[JSON objectForKey:@"Dribbling"]intValue];
        player.Finishing = [[JSON objectForKey:@"Finishing"] intValue];
        player.FreeKicks = [[JSON objectForKey:@"FreeKicks"] intValue];
        player.GKDiving = [[JSON objectForKey:@"GKDiving"] intValue];
        player.GKHandling = [[JSON objectForKey:@"GKHandling"] intValue];
        player.GKKicking = [[JSON objectForKey:@"GKKicking"] intValue];
        player.GKPosition = [[JSON objectForKey:@"GKPosition"]intValue];
        player.GKReflexes = [[JSON objectForKey:@"GKReflexes"]intValue];
        player.GKSpeed = [[JSON objectForKey:@"GKSpeed"] intValue];
        player.Heading =[[JSON objectForKey:@"Heading"] intValue];
        player.Height = [JSON objectForKey:@"Height"];
        player.Interceptions = [[JSON objectForKey:@"Interceptions"] intValue];
        player.JoinedClub = [self convertToDate:[JSON objectForKey:@"JoinedClub"]];
        player.Jumping = [[JSON objectForKey:@"Jumping"] intValue];
        player.LongPassing = [[JSON objectForKey:@"LongPassing"] intValue];
        player.LongShots = [[JSON objectForKey:@"LongShots"] intValue];
        player.Marking = [[JSON objectForKey:@"Marking"] intValue];
        player.Penalties = [[JSON objectForKey:@"Penalties"] intValue];
        player.PositionString = [JSON objectForKey:@"Position"][0];
        player.Reactions = [[JSON objectForKey:@"Reactions"] intValue];
        player.ShortPassing = [[JSON objectForKey:@"ShortPassing"] intValue];
        player.ShotPower = [[JSON objectForKey:@"ShotPower"] intValue];
        player.SkillMoves = [[JSON objectForKey:@"SkillMoves"] intValue];
        player.SlidingTackle = [[JSON objectForKey:@"SlidingTackle"] intValue];
        player.SprintSpeed = [[JSON objectForKey:@"SprintSpeed"] intValue];
        player.Stamina = [[JSON objectForKey:@"Stamina"] intValue];
        player.StandingTackle = [[JSON objectForKey:@"StandingTackle"] intValue];
        player.Strength = [[JSON objectForKey:@"Strength"] intValue];
        player.TraitsString = [JSON objectForKey:@"TraitsString"];
        player.Vision = [[JSON objectForKey:@"Vision"] intValue];
        player.Volleys = [[JSON objectForKey:@"Volleys"] intValue];
        player.WeakFoot = [[JSON objectForKey:@"WeakFoot"] intValue];
        player.Weight = [JSON objectForKey:@"Weight"];
        player.Foot  = [JSON objectForKey:@"Foot"];
        player.Positioning = [[JSON objectForKey:@"Positioning"] intValue];

        responseMethod(player);
    }
                                         
    failure:^(NSURLRequest *request, NSHTTPURLResponse *response,
    NSError *error, id JSON) { NSLog(@"Request Failure Because %@",[error userInfo]); }];
    
    [operation start];
    
}
//
//-(FPPlayer *) JSONToPlayer:(id)JSON
//{
//    FPPlayer *player = [[FPPlayer alloc] init];
//    player.Fullname = [JSON objectForKey:@"Fullname"];
//    player.PlayerId = [JSON objectForKey:@"PlayerId"];
//    player.Club = [JSON objectForKey:@"Club"];
//    player.Position = [JSON objectForKey:@"Position"];
//    player.Potential = [[JSON objectForKey:@"Potential"] intValue];
//    player.TotalSkill = [[JSON objectForKey:@"TotalSkill"] intValue];
//    player.BirthDate = [self convertToDate:[JSON objectForKey:@"BirthDate"]];
//    
//    player.Acceleration = [[JSON objectForKey:@"Acceleration"] intValue];
//    player.Aggression = [[JSON objectForKey:@"Aggression"] intValue];
//    player.Agility = [[JSON objectForKey:@"Agility"] intValue];
//    player.AttackWorkrate = [JSON objectForKey:@"AttackWorkrate"];
//    player.Balance = [[JSON objectForKey:@"Balance"]intValue];
//    player.BallControl = [[JSON objectForKey:@"BallControl"] intValue];
//    player.ContractExpireDate = [self convertToDate:[JSON objectForKey:@"ContractExpireDate"]];
//    player.Crossing = [[JSON objectForKey:@"Crossing"] intValue];
//    player.Curve = [[JSON objectForKey:@"Curve"] intValue];
//    player.DefenseWorkrate = [JSON objectForKey:@"DefenseWorkrate"];
//    player.Dribbling = [[JSON objectForKey:@"Dribbling"]intValue];
//    player.Finishing = [[JSON objectForKey:@"Finishing"] intValue];
//    player.FreeKicks = [[JSON objectForKey:@"FreeKicks"] intValue];
//    player.GKDiving = [[JSON objectForKey:@"GKDiving"] intValue];
//    player.GKHandling = [[JSON objectForKey:@"GKHandling"] intValue];
//    player.GKKicking = [[JSON objectForKey:@"GKKicking"] intValue];
//    player.GKPosition = [[JSON objectForKey:@"GKPosition"]intValue];
//    player.GKReflexes = [[JSON objectForKey:@"GKReflexes"]intValue];
//    player.GKSpeed = [[JSON objectForKey:@"GKSpeed"] intValue];
//    player.Heading =[[JSON objectForKey:@"Heading"] intValue];
//    player.Height = [JSON objectForKey:@"Height"];
//    player.Interceptions = [[JSON objectForKey:@"Interceptions"] intValue];
//    player.JoinedClub = [self convertToDate:[JSON objectForKey:@"JoinedClub"]];
//    player.Jumping = [[JSON objectForKey:@"Jumping"] intValue];
//    player.LongPassing = [[JSON objectForKey:@"LongPassing"] intValue];
//    player.LongShots = [[JSON objectForKey:@"LongShots"] intValue];
//    player.Marking = [[JSON objectForKey:@"Marking"] intValue];
//    player.Penalties = [[JSON objectForKey:@"Penalties"] intValue];
//    player.PositionString = [JSON objectForKey:@"PositionString"];
//    player.Reactions = [[JSON objectForKey:@"Reaction"] intValue];
//    player.ShortPassing = [[JSON objectForKey:@"ShortPassing"] intValue];
//    player.ShotPower = [[JSON objectForKey:@"ShotPower"] intValue];
//    player.SkillMoves = [[JSON objectForKey:@"SkillMoves"] intValue];
//    player.SlidingTackle = [[JSON objectForKey:@"SlidingTackle"] intValue];
//    player.SprintSpeed = [[JSON objectForKey:@"SprintSpeed"] intValue];
//    player.Stamina = [[JSON objectForKey:@"Stamina"] intValue];
//    player.StandingTackle = [[JSON objectForKey:@"StandingTackle"] intValue];
//    player.Strength = [[JSON objectForKey:@"Strength"] intValue];
//    player.TraitsString = [JSON objectForKey:@"TraitsString"];
//    player.Vision = [[JSON objectForKey:@"Vision"] intValue];
//    player.Volleys = [[JSON objectForKey:@"Volleys"] intValue];
//    player.WeakFoot = [[JSON objectForKey:@"WeakFoot"] intValue];
//    player.Weight = [JSON objectForKey:@"Weight"];
//    
//    return player;
//}
//
//-(NSString *)PlayerToJSON:(FPPlayer*) player
//{
//    NSOutputStream *outputStream = [[NSOutputStream alloc]init];
//    NSError *error = nil;
//    [NSJSONSerialization writeJSONObject:player toStream:outputStream options:0 error:&error];
//    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:outputStream options:NSJSONWritingPrettyPrinted error:&error];
//    
//    
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    return jsonString;
//}
//
//-(NSMutableArray*)GetFavoritePlayers
//{
//    if (self.favoritePlayers == nil)
//    {
//        self.favoritePlayers = [[NSMutableArray alloc]init];
//        
//        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//        NSArray *playerJSONs = [prefs objectForKey:@"favorites"];
//        for (int i= 0; i < playerJSONs.count; i++) {
//            FPPlayer *player = [self JSONToPlayer:[playerJSONs objectAtIndex:i]];
//            [self.favoritePlayers addObject:player];
//        }
//    }
//    
//    return self.favoritePlayers;
//}
//
//-(void)AddToFavorite:(FPPlayer *) player
//{
//    NSMutableArray *favorites = [self GetFavoritePlayers];
//
//    if (player != nil)
//    {
//        [favorites addObject:[self PlayerToJSON:player]];
//    }
//    
//    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//    [prefs setObject:favorites forKey:@"favorites"];
//}
//
//-(void)RemoveFromFavorites:(NSString *)playerId
//{
//    NSMutableArray *favoritePlayers = [self GetFavoritePlayers];
//    
//    for (int i = 0; i < favoritePlayers.count; i++) {
//        if ([[favoritePlayers objectAtIndex:i] PlayerId] == playerId)
//        {
//            [favoritePlayers removeObjectAtIndex:i];
//            break;
//        }
//    }
//    
//    //store favorites locally
//    [self AddToFavorite:nil];
//}

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
