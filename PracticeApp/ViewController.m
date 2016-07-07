//
//  ViewController.m
//  PracticeApp
//
//  Created by Alex Tsyganov on 15/06/2016.
//  Copyright © 2016 Alex Tsyganov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController
{
    __weak IBOutlet UITableView *mTableView;
    NSMutableArray *mTableData;
    UIRefreshControl *mRefreshControl;
    __weak IBOutlet NSLayoutConstraint *mLcTopHeaderView;
    __weak IBOutlet UIView *mTableViewHeader;
    float mOffset;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    mTableData = [NSMutableArray new];
    for (int i=0; i<5; i++) {
        [mTableData addObject:[NSString stringWithFormat:@"test %d",i]];
    }
    [mTableView reloadData];
    
    mRefreshControl = [[UIRefreshControl alloc]init];
    [mTableView addSubview:mRefreshControl];
    [mRefreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
}

- (void)refreshTable
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mRefreshControl endRefreshing];
    });
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
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
 */

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    
    [coder encodeInt:1 forKey:@"qwe"];
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offSet = mTableView.contentOffset.y;

    float x1 = CGRectGetHeight(mTableViewHeader.frame)-60;
    
    if (mLcTopHeaderView.constant <=0 && mLcTopHeaderView.constant>=-x1)
    {
        mLcTopHeaderView.constant= - offSet;
        if (mLcTopHeaderView.constant > 0)
            mLcTopHeaderView.constant = 0;
        else if (mLcTopHeaderView.constant < -x1)
            mLcTopHeaderView.constant = -x1;

    }
    
    mOffset = offSet;
    NSLog(@"x = %f", offSet);
    NSLog(@"q = %f", offSet / scrollView.contentSize.height);
}

@end
