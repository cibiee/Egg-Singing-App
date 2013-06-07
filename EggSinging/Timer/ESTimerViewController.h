//
//  ESTimerViewController.h
//  EggSinging
//
//  Created by Ciby  on 24/05/13.
//  Copyright (c) 2013 Bridge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESTimerViewController : UIViewController{
NSTimer *stopTimer;
NSDate *startDate;
    //BOOL softBoilrunning;
   // BOOL MediumBoilrunning;
    BOOL running;
}



-(IBAction)startPressed:(id)sender;
-(IBAction)resetPressed:(id)sender;

-(void)updateTimer;



@property (assign,nonatomic)int hardBoiledCount;
@property (assign,nonatomic)int mediumBoiledCount;
@property (assign,nonatomic)int softBoiledcount;

@property (weak, nonatomic) IBOutlet UILabel *hardBoiledMessageLabel;
@property (weak, nonatomic) IBOutlet UILabel *mediumBoiledMessageLabel;
@property (weak, nonatomic) IBOutlet UILabel *softBoiledMessageLabel;

@property (weak, nonatomic) IBOutlet UILabel *softboiltimer;
@property (weak, nonatomic) IBOutlet UILabel *mediumboiltimer;
@property (weak, nonatomic) IBOutlet UILabel *hardboiltimer;

@end
int i;