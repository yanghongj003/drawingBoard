//
//  ViewController.m
//  画板
//
//  Created by hsbc on 15/5/5.
//  Copyright (c) 2015年 hsbc. All rights reserved.
//

#import "ViewController.h"
#import "drawBoardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet drawBoardView *boardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (IBAction)clearScreen:(id)sender {
    
    [self.boardView clear];
    
}

- (IBAction)backScreen:(id)sender {
    
    [self.boardView back];
}

- (IBAction)saveScreen:(id)sender {
    
    [self.boardView save];
    
}

- (IBAction)blueBtnClick:(id)sender {
    [self.boardView setBlue];
}

- (IBAction)redBtnClick:(id)sender {
    
    [self.boardView setRed];
}

@end
