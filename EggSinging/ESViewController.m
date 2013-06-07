//
//  ESViewController.m
//  EggSinging
//
//  Created by Ciby  on 23/05/13.
//  Copyright (c) 2013 Bridge. All rights reserved.
//

#import "ESViewController.h"

@interface ESViewController ()
@property(nonatomic,assign)int softBoilCount;
@property(nonatomic,assign)int hardBoilCount;
@property(nonatomic,assign)int mediumBoilCount;
@end

@implementation ESViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.softBoiledEgg setText:@"0"];
    [self.mediumBoiledEgg setText:@"0"];
    [self.hardBoiledEgg setText:@"0"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)removeSoftBoilEgg:(id)sender {
    if (self.softBoilCount>0) {
        self.softBoilCount --;
        [self updateCount:self.softBoilCount ofLabel:self.softBoiledEgg];
    }
   
}

- (IBAction)removeMediumBoiledEgg:(id)sender {
    if (self.mediumBoilCount>0){
    self.mediumBoilCount --;
     [self updateCount:self.mediumBoilCount ofLabel:self.mediumBoiledEgg];
    }
}

- (IBAction)removeHardBoiledEgg:(id)sender {
     if (self.hardBoilCount>0){
     self.hardBoilCount --;
    [self updateCount:self.hardBoilCount ofLabel:self.hardBoiledEgg];
     }
}

- (IBAction)addSoftBoildeEgg:(id)sender {
     self.softBoilCount ++;
    [self updateCount:self.softBoilCount ofLabel:self.softBoiledEgg];
}

- (IBAction)addMediumBoiledEgg:(id)sender {
    self.mediumBoilCount ++;
   [self updateCount:self.mediumBoilCount ofLabel:self.mediumBoiledEgg];
}

- (IBAction)addHardBoiled:(id)sender {
    self.hardBoilCount ++;
    [self updateCount:self.hardBoilCount ofLabel:self.hardBoiledEgg];
   
}

-(void)updateCount:(int)count ofLabel:(UILabel*)label{
    [label setText:[NSString stringWithFormat:@"%i", count]];
}
@end
