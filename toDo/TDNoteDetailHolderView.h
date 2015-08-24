//
//  TDNoteDetailHolderView.h
//  toDo
//
//  Created by Aravind Soundararajan on 20/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDDateDetail.h"
#import "TDNoteDetailTableViewCell.h"

@interface TDNoteDetailHolderView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UILabel *dateDayLabel;
@property (nonatomic,strong) UITableView  *noteDetailTableView;
@property (nonatomic,strong) TDDateDetail *dateDetail;

-(id)initWithFrame:(CGRect)frame andNoteDetail:(TDDateDetail*)dateDetail;
-(void)refreshData:(TDDateDetail*)newDateDetail;

@end
