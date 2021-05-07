//
//  ViewController.m
//  JSONParsing
//
//  Created by MORIO on 9/6/20.
//  Copyright © 2020 MORIO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"https://api.androidhive.info/json/movies.json"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"json: %@", json);
}
	

@end
