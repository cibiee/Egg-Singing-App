//
//  ESSelectWatereAndTypeViewController.m
//  EggSinging
//
//  Created by Ciby  on 29/05/13.
//  Copyright (c) 2013 Bridge. All rights reserved.
//

#import "ESSelectWatereAndTypeViewController.h"
#import "ESTimerViewController.h"

@interface ESSelectWatereAndTypeViewController ()
@property (assign,nonatomic)int smallHardBoiledEggTime;
@property (assign,nonatomic)int smallMediumBoiledEggTime;
@property (assign,nonatomic)int smallSoftBoiledEggTime;

@property (assign,nonatomic)int mediumSizedHardBoiledEggTime;
@property (assign,nonatomic)int mediumSizedMediumBoiledEggTime;
@property (assign,nonatomic)int mediumSizedSoftBoiledEggTime;

@property (assign,nonatomic)int largeHardBoiledEggTime;
@property (assign,nonatomic)int largeMediumBoiledEggTime;
@property (assign,nonatomic)int largeSoftBoiledEggTime;

@property(weak,nonatomic)NSString* eggSizeSmall;
@property(weak,nonatomic)NSString* eggSizeMedium;
@property(weak,nonatomic)NSString* eggSizeLarge;
@end

@implementation ESSelectWatereAndTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.softBoiledcount =2;
    self.hardBoiledCount=3;
    self.mediumBoiledCount=5;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnClickSmall:(id)sender {
   self.eggSizeSmall =@"YES";
}

- (IBAction)onClickMedium:(id)sender {
    self.eggSizeMedium =@"YES";
}

- (IBAction)onSelectWaterType:(id)sender {
   
    
}

- (IBAction)onClickHard:(id)sender {
     self.eggSizeLarge =@"YES";
}

- (IBAction)onClickNavigateToTimer:(id)sender {
    
    ESTimerViewController *ViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"Timer"];
    [ViewController setHardBoiledCount:self.hardBoiledCount];
    [ViewController setMediumBoiledCount:self.mediumBoiledCount];
    [ViewController setSoftBoiledcount:self.softBoiledcount];
    [self.navigationController pushViewController:ViewController animated:YES];
    
    
}

-(void)CalculateTime{
    
    if (self.softBoiledcount>0) {
        if ([self.eggSizeSmall isEqualToString:@"YES"]) {
            self.smallSoftBoiledEggTime =4;
        }
        
        if ([self.eggSizeMedium isEqualToString:@"YES"]) {
            self.largeSoftBoiledEggTime =5.3;
        }
        
        if ([self.eggSizeLarge isEqualToString:@"YES"]) {
            self.largeSoftBoiledEggTime =4;
        }
    }
    
    if (self.mediumBoiledCount>0) {
        if ([self.eggSizeSmall isEqualToString:@"YES"]) {
            self.smallSoftBoiledEggTime =6;
        }
        
        if ([self.eggSizeMedium isEqualToString:@"YES"]) {
            self.largeSoftBoiledEggTime =7;
        }
        
        if ([self.eggSizeLarge isEqualToString:@"YES"]) {
            self.largeSoftBoiledEggTime =8;
        }
    }
    
    if (self.hardBoiledCount>0) {
        if ([self.eggSizeSmall isEqualToString:@"YES"]) {
            self.smallSoftBoiledEggTime =11;
        }
        
        if ([self.eggSizeMedium isEqualToString:@"YES"]) {
            self.largeSoftBoiledEggTime =13;
        }
        
        if ([self.eggSizeLarge isEqualToString:@"YES"]) {
            self.largeSoftBoiledEggTime =15;
        }
    }
    
}
@end
