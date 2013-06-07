//
//  ESSelectWatereAndTypeViewController.h
//  EggSinging
//
//  Created by Ciby  on 29/05/13.
//  Copyright (c) 2013 Bridge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESSelectWatereAndTypeViewController : UIViewController
- (IBAction)OnClickSmall:(id)sender;
- (IBAction)onClickMedium:(id)sender;
- (IBAction)onSelectWaterType:(id)sender;
- (IBAction)onClickHard:(id)sender;

- (IBAction)onClickNavigateToTimer:(id)sender;

@property (assign,nonatomic)int hardBoiledCount;
@property (assign,nonatomic)int mediumBoiledCount;
@property (assign,nonatomic)int softBoiledcount;
@end
