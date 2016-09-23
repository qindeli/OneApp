//
//  ViewController.m
//  OneApp
//
//  Created by vera on 16/9/18.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

/**
 *  打开第2个app
 *
 *  @param sender <#sender description#>
 */
- (IBAction)openTwoApp:(id)sender
{
    
    NSString *username = @"xiaoming";
    NSString *password = @"pwd123456";
    
    //如果打开其他的app，需要在要打开的app里面添加url scheme,然后调用openUrl打开。
    
    //openURL:打开第3方应用.
    //urlType: url schemes + "://" + Identifier
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"TwoApp://com.qianfeng?username=%@&password=%@",username,password]]];
    
    NSLog(@"xxx");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //判断应用有没有安装到手机上：canOpenURL:
    /*
     注意：在使用canOpenURL:方法的时候，把需要的scheme添加info.plist的白名单。
     格式：
     <key>LSApplicationQueriesSchemes</key>
     <array>
        <string>scheme1</string>
        <string>scheme2</string>
        <string>scheme3</string>
        ......
     </array>
     */
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"TwoApp://com.qianfeng"]])
    {
        NSLog(@"已经安装了");
        
        self.button.hidden = NO;
    }
    else
    {
        NSLog(@"没有安装");
        
        self.button.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
