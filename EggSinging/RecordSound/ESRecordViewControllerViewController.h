//
//  ESRecordViewControllerViewController.h
//  EggSinging
//
//  Created by Ciby  on 30/05/13.
//  Copyright (c) 2013 Bridge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<AVFoundation/AVAudioPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ESRecordViewControllerViewController : UIViewController<AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
AVAudioRecorder *audioRecorder;
NSDate *startDate;
AVAudioPlayer *audioPlayer;
    BOOL running;
}
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *recordProgressView;
- (IBAction)onClickStopRecording:(id)sender;
- (IBAction)onclickPlaysound:(id)sender;
-(IBAction)onClickRecordSound:(id)sender;
@end
