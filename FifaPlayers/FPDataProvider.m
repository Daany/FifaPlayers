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

@implementation FPDataProvider

NSMutableArray *_responseData;
SEL *_responseMethod;

-(void) SearchPlayer:(NSString *) searchString withResponseMethod:(SEL*)responseMethod
{
    [self GetPlayersByUrl:@"http://fifa.dzim.ch/api/players?f=1=1" withResponseMethod:responseMethod];
    
    
    //return [[NSArray alloc] initWithObjects:@"Lionel Messi", @"Cristiano Ronaldo", @"Franck Ribéry", @"Marco Reus", nil];
}


-(void) GetPlayersByUrl:(NSString*) url withResponseMethod:(SEL*)responseMethod
{
    responseMethod = responseMethod;
    self.responseData = [NSMutableData data];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    NSLog([NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %d bytes of data",[self.responseData length]);
    
    // convert to JSON
    NSError *myError = nil;
    
    if (self.responseData == nil)
    {
        NSLog(@"ResponseData is null!");
    }
    else
    {
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSon error:&myError];
        
        //self performSelector:_responseMethod];
        //[self performSelector:_responseMethod:withArray[[NSArray alloc]initWithObjects:@"Test", @"Test2", nil]];
        
        // show all values
        for(id key in res) {            
            
            //ToDo: Parse JSON to object
            NSLog([[NSString alloc]initWithFormat:@"%@", key]);
            
        }
        
        // extract specific value...
        NSArray *results = [res objectForKey:@"results"];
        
        for (NSDictionary *result in results) {
            NSString *icon = [result objectForKey:@"icon"];
            NSLog(@"icon: %@", icon);
        }
        
        [self performSelector:@selector(_responseMethod:) withObject:[[NSArray alloc]initWithObjects:@"Test", @"Test2", nil]];
    }
}

-(FPPlayerBase *)mapObjectsForClass1From:(NSDictionary *)dict {
    FPPlayerBase *object1 = [[FPPlayerBase alloc] init];
    
    object1.Fullname = [[dict valueForKey:@"Fullname"] stringValue];
    object1.BirthDate = [[dict valueForKey:@"Birthdate"] date];
    object1.Club = [[dict valueForKey:@"Club"] stringValue];
    
    return object1;
}

@end
