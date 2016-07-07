//
//  TableViewController.m
//  PracticeApp
//
//  Created by Alex Tsyganov on 15/06/2016.
//  Copyright © 2016 Alex Tsyganov. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController
{
    NSMutableArray *mTableData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mTableData = [NSMutableArray new];
    for (int i=0; i<100; i++) {
        [mTableData addObject:[NSString stringWithFormat:@"test %d",i]];
    }
    [self.tableView reloadData];
}

-(UIView*) viewTest:(float) height withColor:(UIColor*) color
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), height)];
    [view setBackgroundColor:color];
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mTableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.textLabel.text = mTableData[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self viewTest:60 withColor:[UIColor yellowColor]];
}

@end
