//
//  ESRecordViewControllerViewController.m
//  EggSinging
//
//  Created by Ciby  on 30/05/13.
//  Copyright (c) 2013 Bridge. All rights reserved.
//

#import "ESRecordViewControllerViewController.h"

@interface ESRecordViewControllerViewController ()
@property(nonatomic,weak)NSTimer *timer;
@end

@implementation ESRecordViewControllerViewController

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
     self.recordProgressView.progress= 0;
    [self SetInitailSetttingsForRecording];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark onClickRecordSound methods
- (IBAction)onClickStopRecording:(id)sender {
     [self stop];
}

- (IBAction)onclickPlaysound:(id)sender {
    
    [self playAudio];
}

-(IBAction)onClickRecordSound:(id)sender{
    if (!audioRecorder.recording)
    {
         startDate = [NSDate date];
        
        if(!running){
            running = YES;
            
            if (self.timer == nil) {
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/15
                                                              target:self
                                                            selector:@selector(updateProgress)
                                                            userInfo:nil
                                                             repeats:YES];            }
        }else{
            running = NO;
            
            [self.timer invalidate];
            self.timer = nil;
        }
        

        
        
      
        [audioRecorder record];
        
       
        
        //[self countDown];
    }
}


- (void)SetInitailSetttingsForRecording
{

    NSArray *dirPaths;
    NSString *docsDir;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir
                               stringByAppendingPathComponent:@"sound.caf"];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSDictionary *recordSettings = [NSDictionary
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16],
                                    AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2],
                                    AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0],
                                    AVSampleRateKey,
                                    nil];
    
    NSError *error = nil;
    
    audioRecorder = [[AVAudioRecorder alloc]
                     initWithURL:soundFileURL
                     settings:recordSettings
                     error:&error];
    
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
        
    } else {
        [audioRecorder prepareToRecord];
    }
    
    
    
}


-(void)stop
{

    [self.timer invalidate];
    self.timer = nil;
    running=NO;
    if (audioRecorder.recording)
    {
        
        
        [audioRecorder stop];
    } else if (audioPlayer.playing) {
        [audioPlayer stop];
    }
    
    
}

int k =0;
- (void)updateProgress
{
    
    if (running) {
   
    float timeLeft = audioRecorder.currentTime/15;
    
    k++;
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
     NSString *timeString=[dateFormatter stringFromDate:timerDate];
    if (1<=15) {
        [self.timerLabel setText:timeString];
    }
    
    else{
         [self.timerLabel setText:@"15"];
    }
    
    // upate the UIProgress
    
    self.recordProgressView.progress= timeLeft;
        
    }
}


-(void) playAudio
{

 NSError *error;
        audioPlayer = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:audioRecorder.url
                       error:&error];
    [audioPlayer play ];
    audioPlayer.delegate = self;
    if (error)
        NSLog(@"Error: %@",
                  [error localizedDescription]);
}


-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
   // recordButton.hidden = NO;
    
}
-(void)audioPlayerDecodeErrorDidOccur:
(AVAudioPlayer *)player
                                error:(NSError *)error
{
    NSLog(@"Decode Error occurred");
}
-(void)audioRecorderDidFinishRecording:
(AVAudioRecorder *)recorder
                          successfully:(BOOL)flag
{
    
}

-(void)audioRecorderEncodeErrorDidOccur:
(AVAudioRecorder *)recorder error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}


@end
