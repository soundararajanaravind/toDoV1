//
//  TDNoteDetailHolderView.m
//  toDo
//
//  Created by Aravind Soundararajan on 20/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "TDNoteDetailHolderView.h"

@implementation TDNoteDetailHolderView

NSMutableArray *detailTableViewDatasourceArray;

-(id)initWithFrame:(CGRect)frame andNoteDetail:(TDDateDetail *)dateDetail
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        _dateDetail = dateDetail;
        
        [self dateDayLabel];
        
        _dateDayLabel = [self dateDayLabel];
        
        _noteDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x
                                                                            , self.bounds.origin.y+60, self.bounds.size.width, self.bounds.size.height - 60)];
        
        [_noteDetailTableView registerClass:[TDNoteDetailTableViewCell class] forCellReuseIdentifier:@"noteDetailTableViewCell"];
        _noteDetailTableView.dataSource = self;
        _noteDetailTableView.delegate = self;
        _noteDetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:_dateDayLabel];
        [self addSubview:_noteDetailTableView];
        
        
    }
    
    return self;
}

-(UILabel*)dateDayLabel
{
    if(!_dateDayLabel)
    {
        _dateDayLabel = [[UILabel alloc] init];
        
    }
    _dateDayLabel.numberOfLines = 2;
    _dateDayLabel.textAlignment = NSTextAlignmentCenter;
    _dateDayLabel.frame = CGRectMake(0, 10,self.frame.size.width, 50);
    _dateDayLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    
    if (!([_dateDetail getWeekday] == 1 || [_dateDetail getWeekday] == 21 || [_dateDetail getWeekday] == 31) && !([_dateDetail getWeekday] == 3 || [_dateDetail getWeekday] == 23) ) {
        
        _dateDayLabel.text = [NSString stringWithFormat:@"%ldth %@, %ld \n %@", [_dateDetail getWeekday],[_dateDetail getMonth],[_dateDetail getYear],[_dateDetail getDay]];
        
    }
    else if ([_dateDetail getWeekday] == 1 || [_dateDetail getWeekday] == 21 || [_dateDetail getWeekday] == 31)
    {
        _dateDayLabel.text = [NSString stringWithFormat:@"%ldst %@, %ld \n %@", [_dateDetail getWeekday],[_dateDetail getMonth],[_dateDetail getYear],[_dateDetail getDay]];
        
    }
    else if(([_dateDetail getWeekday] == 3 || [_dateDetail getWeekday] == 23))
    {
         _dateDayLabel.text = [NSString stringWithFormat:@"%ldrd %@, %ld \n %@", [_dateDetail getWeekday],[_dateDetail getMonth],[_dateDetail getYear],[_dateDetail getDay]];
    }

    
    return _dateDayLabel;
}

-(void)refreshData:(TDDateDetail*)newDateDetail
{
    _dateDetail = newDateDetail;
    [self dateDayLabel];
    [_noteDetailTableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *noteDescriptionArray = [[NSArray alloc] init];
    noteDescriptionArray = [_dateDetail.noteDetails objectForKey:@"description"];
    return [noteDescriptionArray count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDNoteDetailTableViewCell *cell = (TDNoteDetailTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"noteDetailTableViewCell"];
    
    NSArray *noteDescriptionArray = [[NSArray alloc] init];
    noteDescriptionArray = [_dateDetail.noteDetails objectForKey:@"description"];

    
    if(cell)
    {
        cell.noteDescriptionLabel.text = [noteDescriptionArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
