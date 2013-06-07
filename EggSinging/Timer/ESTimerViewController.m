//
//  ESTimerViewController.m
//  EggSinging
//
//  Created by Ciby  on 24/05/13.
//  Copyright (c) 2013 Bridge. All rights reserved.
//

#import "ESTimerViewController.h"

@interface ESTimerViewController ()
@property(assign,nonatomic)NSTimeInterval timeInterval;
@end

@implementation ESTimerViewController

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
     NSDate *currentDate = [NSDate date];
    
    [self.softboiltimer setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:50]];
    [self.mediumboiltimer setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:50]];
    [self.hardboiltimer setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:50]];
    
    if (self.softBoiledcount==0) {
        [self.softboiltimer setHidden:YES];
    }
    
    if (self.mediumBoiledCount==0) {
        [self.mediumboiltimer setHidden:YES];
    }
    
    if (self.hardBoiledCount==0) {
        [self.hardboiltimer setHidden:YES];
    }
    
    running = FALSE;
    startDate = [NSDate date];
    [self startPressed:nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(IBAction)startPressed:(id)sender{
    if(!running){
        running = TRUE;
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        if (stopTimer == nil) {
            stopTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0
                                                         target:self
                                                       selector:@selector(updateTimer)
                                                       userInfo:nil
                                                        repeats:YES];
        }
    }else{
        running = FALSE;
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        [stopTimer invalidate];
        stopTimer = nil;
    }
    
}

-(void)updateTimer{
    
    i++; 
    NSDate *currentDate = [NSDate date];
   self.timeInterval = [currentDate timeIntervalSinceDate:startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:self.timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timeString=[dateFormatter stringFromDate:timerDate];
    UIApplication *app =[UIApplication sharedApplication];
    
  
    if ((int)self.timeInterval==120) {
        
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.fireDate = [NSDate date];
        NSTimeZone* timezone = [NSTimeZone defaultTimeZone];
        notification.timeZone = timezone;
        notification.alertBody = @"Remove the soft boiled Egg";
        notification.alertAction = @"Show";
        app.applicationIconBadgeNumber=1;
        notification.soundName = UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
        [self.softboiltimer setHidden:YES];
        [self.softBoiledMessageLabel setText:@"Je zacht gekookte eieren zijn klaar!"];
    }
    else if ((int)self.timeInterval<=120)
    {
        [self.softboiltimer setText:timeString];

    }
    
    if ((int)self.timeInterval==1200) {
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.fireDate = [NSDate date];
        NSTimeZone* timezone = [NSTimeZone defaultTimeZone];
        notification.timeZone = timezone;
        notification.alertBody = @"Remove the Medium boiled Egg";
        notification.alertAction = @"Show";
        app.applicationIconBadgeNumber=1;
        notification.soundName = UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
        [self.mediumboiltimer setHidden:YES];
        [self.mediumBoiledMessageLabel setText:@"Je zacht gekookte eieren zijn klaar!"];

    }
    
    else  if ((int)self.timeInterval<=1200)
    {
        [self.mediumboiltimer setText:timeString];
        
    }

    if ((int)self.timeInterval==1800) {
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.fireDate = [NSDate date];
        NSTimeZone* timezone = [NSTimeZone defaultTimeZone];
        notification.timeZone = timezone;
        notification.alertBody = @"Remove the hard boiled Egg";
        notification.alertAction = @"Show";
        app.applicationIconBadgeNumber=1;
        notification.soundName = UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
        
        [self.hardboiltimer setHidden:YES];
        [self.hardBoiledMessageLabel setText:@"Je zacht gekookte eieren zijn klaar!"];

        
        [stopTimer invalidate];
        stopTimer = nil;
        running = FALSE;
        
    }
    
    else if ((int)self.timeInterval<=1800)
    {
        [self.hardboiltimer setText:timeString];
        
    }
}

-(IBAction)resetPressed:(id)sender{
    [stopTimer invalidate];
    stopTimer = nil;
    startDate = [NSDate date];
    self.softboiltimer.text = @"00.00:00";
    self.hardboiltimer.text = @"00.00:00";
    self.mediumboiltimer.text = @"00.00:00";
    running = FALSE;
}


@end
