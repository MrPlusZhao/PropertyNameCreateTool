//
//  ViewController.m
//  PropertyNameCreateTool
//
//  Created by ztp on 2018/2/8.
//  Copyright © 2018年 Mr.Plus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //随便写的plist文件,求大神别喷...
    
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"pppList.plist" ofType:nil];
    NSDictionary *dict  = [NSDictionary dictionaryWithContentsOfFile:filePath];

    [TP_PropertyCreateTool PropertyNameCreateFromDict:dict];

    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
