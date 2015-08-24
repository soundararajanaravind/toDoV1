//
//  TDMainViewController.m
//  toDo
//
//  Created by Aravind Soundararajan on 10/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "TDMainViewController.h"

#define collectionViewHeight 50
#define interItemSpacing 0.0f
#define minimumLineSpacing 0.0f
#define NOTES_DETAIL_URL @"https://gist.githubusercontent.com/soundararajanaravind/c5a9fd5d0585c0d895a3/raw/d88516209f502fd5f992cde0298cf79667214006/dates.json"

@interface TDMainViewController ()

@end

@implementation TDMainViewController
AppDelegate *appDelegate;
NSMutableArray *parsedDatesDetailArray;
float contentInsetValue;
TDNoteDetailHolderView *noteDetailHolderView;


- (void)viewDidLoad {
    

    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = [self getTitle];
    
    contentInsetValue = ((self.view.frame.size.width - 2*minimumLineSpacing)/2) + (self.view.frame.size.width/2.5);
    
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    //Prevents view from tucking below the Navigationbar
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Do any additional setup after loading the view.
    
    [self fetchData];   
    [self setupSubviews];
    [self loadDetailView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}


-(NSString*)getTitle
{
    return @"ToDo Notes App";
}

-(void)setupSubviews
{
    [self loadCollectionView];
    [self loadViewElements];
    
}

-(void)fetchData
{
    NSDictionary *datesData;
    
    datesData = [appDelegate.dataHandler getActivitesForDatesFromURL:NOTES_DETAIL_URL];
    
    parsedDatesDetailArray = [TDDateDetailParser parseIncomingDateDetail:datesData];
    
}


-(void)loadViewElements
{
    
    //Configuring the marker View which denotes the current date being pointed to.
    TDDateMarkerView *indicatorView = [[TDDateMarkerView alloc] initWithFrame:
                                       CGRectMake((_collectionView.frame.origin.x + self.view.frame.size.width/20) ,
                                                  _collectionView.center.y + (collectionViewHeight/2-5),
                                                    self.view.frame.size.width/10,
                                                                                5)];
    [indicatorView setBackgroundColor:[UIColor darkGrayColor]];
    [self.view addSubview:indicatorView];
    
    //Setting the View that displays details of Notes
    
    
    
}

-(void)loadCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [layout setMinimumInteritemSpacing:interItemSpacing];
    [layout setMinimumLineSpacing:minimumLineSpacing];
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(minimumLineSpacing, 0,self.view.frame.size.width - 2*minimumLineSpacing, collectionViewHeight) collectionViewLayout:layout];
    [_collectionView setShowsHorizontalScrollIndicator:NO];
    [_collectionView setShowsVerticalScrollIndicator:NO];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
   _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, contentInsetValue);
    
    [_collectionView registerClass:[TDMenuCellCollectionViewCell class] forCellWithReuseIdentifier:[TDMenuCellCollectionViewCell reuseIdentifier]];
    [_collectionView setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
    
    [self.view addSubview:_collectionView];

}

-(void)loadDetailView
{
     noteDetailHolderView = [[TDNoteDetailHolderView alloc] initWithFrame:CGRectMake(0, collectionViewHeight, self.view.frame.size.width, self.view.frame.size.height - collectionViewHeight) andNoteDetail:[parsedDatesDetailArray objectAtIndex:0]];
    
    [self.view addSubview:noteDetailHolderView];
    
}

//Method to find a nearest Index Path to the centrally scrolling
-(void)findNearestIndexAndCenterDatePicker
{
    
   
    NSIndexPath *indexPath = [_collectionView indexPathForItemAtPoint:CGPointMake(_collectionView.contentOffset.x,_collectionView.contentOffset.y)];
    
    [_collectionView scrollToItemAtIndexPath:indexPath
                            atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    [noteDetailHolderView refreshData:((TDDateDetail*)[parsedDatesDetailArray objectAtIndex:indexPath.row])];

}

#pragma mark ScrollViewDelegate Methods

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(!decelerate){

        [self findNearestIndexAndCenterDatePicker];

    }
    
}

//When ever a scrollView Decelerates and comes to an end, this method will be called.
//Else this method is not used
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self findNearestIndexAndCenterDatePicker];
}

#pragma mark collectionViewDelegate Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}

#pragma mark UICollectionView Delegate Methods

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Defining Custom cell
    TDMenuCellCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:[TDMenuCellCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    
    TDDateDetail *dateDetailForCell = [parsedDatesDetailArray objectAtIndex:indexPath.row];

    //Configuring Cell Values
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",[dateDetailForCell getWeekday]];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width/5) - minimumLineSpacing, collectionViewHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    [noteDetailHolderView refreshData:((TDDateDetail*)[parsedDatesDetailArray objectAtIndex:indexPath.row])];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
