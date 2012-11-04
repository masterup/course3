//
//  ViewController.m
//  LazyImages
//
//  Created by Igor Tomych on 11/3/12.
//  Copyright (c) 2012 MasterUp. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

#import "DetailViewController.h"

#define JSON_API @"http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=75/json"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@", JSON_API);
    
    
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:JSON_API]];
    [client setParameterEncoding:AFJSONParameterEncoding];
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    [client getPath:JSON_API parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error = nil;
        id jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        NSLog(@"%@", jsonData);
        
        appRecords = [[jsonData objectForKey:@"feed"] objectForKey:@"entry"];
        
        [self.tableView reloadData];
        //
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
        NSLog(@"error %@", error);
    }];
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appRecords count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AppRecord"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AppRecord"];
    }
    
    NSDictionary* entry = [appRecords objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [[entry objectForKey:@"im:name"] objectForKey:@"label"];
    
    cell.detailTextLabel.text = @"dummy text";
    [cell.imageView setImageWithURL:[NSURL URLWithString:[[[entry objectForKey:@"im:image"] objectAtIndex:2] objectForKey:@"label"]] placeholderImage:[UIImage imageNamed:@"Placeholder.png"]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController* controller = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    [self.navigationController pushViewController:controller animated:YES];
}
@end
