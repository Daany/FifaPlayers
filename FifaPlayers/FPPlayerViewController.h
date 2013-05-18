//
//  FPPlayerViewController.h
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPPlayerBase.h"
#import "FPPlayer.h"

@interface FPPlayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblClub;

-(id)initWithPlayer:(FPPlayerBase*)player NibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil;

@end
