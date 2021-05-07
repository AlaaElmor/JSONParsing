//
//  MoviesTableViewController.m
//  JSONParsing
//
//  Created by MORIO on 9/6/20.
//  Copyright © 2020 MORIO. All rights reserved.
//

#import "MoviesTableViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface MoviesTableViewController ()

@end

@implementation MoviesTableViewController{
    NSMutableArray *json;
    UILabel *titleVal;
    UILabel *rateVal;
    UILabel *dateVal;
    UILabel *genreVal;
    UIImageView *image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"https://api.androidhive.info/json/movies.json"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"json: %@", json);
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [json count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    titleVal = [cell viewWithTag:5];
    rateVal = [cell viewWithTag:1];
    dateVal = [cell viewWithTag:2];
    genreVal = [cell viewWithTag:3];
    image = [cell viewWithTag:4];
    
    [titleVal setText: [json[indexPath.row] valueForKey:@"title"]];
    [rateVal setText: [NSString stringWithFormat:@"%@",[json[indexPath.row] valueForKey:@"rating"]]];
    [dateVal setText: [NSString stringWithFormat:@"%@",[json[indexPath.row] valueForKey:@"releaseYear"]]];
    
    NSMutableArray *genre = [json[indexPath.row] valueForKey:@"genre"];
    NSLog(@"genre: %@", genre);
    
    for (int i = 0; i <= [genre count]-1; i++ ) {
        if (i==0) {
            [genreVal setText:genre[i]];
        }else{
            genreVal.text =[genreVal.text stringByAppendingString :@" , "];
            genreVal.text =[genreVal.text stringByAppendingString :genre[i]];
        }
    }
    
    [image sd_setImageWithURL:[json[indexPath.row] valueForKey:@"image"]];
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 380;
}

@end
