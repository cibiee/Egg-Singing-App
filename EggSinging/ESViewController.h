//
//  ESViewController.h
//  EggSinging
//
//  Created by Ciby  on 23/05/13.
//  Copyright (c) 2013 Bridge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESViewController : UIViewController
- (IBAction)removeSoftBoilEgg:(id)sender;
- (IBAction)removeMediumBoiledEgg:(id)sender;
- (IBAction)removeHardBoiledEgg:(id)sender;
- (IBAction)addSoftBoildeEgg:(id)sender;
- (IBAction)addMediumBoiledEgg:(id)sender;
- (IBAction)addHardBoiled:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *hardBoiledEgg;
@property (weak, nonatomic) IBOutlet UILabel *mediumBoiledEgg;
@property (weak, nonatomic) IBOutlet UILabel *softBoiledEgg;

@end
