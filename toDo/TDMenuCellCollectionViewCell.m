//
//  TDMenuCellCollectionViewCell.m
//  toDo
//
//  Created by Aravind Soundararajan on 10/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "TDMenuCellCollectionViewCell.h"

@implementation TDMenuCellCollectionViewCell



-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];

    }
    return self;
}


-(void)createSubViews
{
    [self textLabel];
    
    [self addSubview:_textLabel];
    
}

-(UILabel*)textLabel
{
    CGFloat upperMargin, sideMargin;
    upperMargin = CGRectGetHeight(self.frame)/3;
    sideMargin = CGRectGetWidth(self.frame)/3;
    
    if(!_textLabel){
        
        _textLabel = [[UILabel alloc] init];
        _textLabel.numberOfLines = 0;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.frame = CGRectMake(sideMargin, upperMargin, CGRectGetWidth(self.bounds)/3, CGRectGetHeight(self.bounds)/3);
        [_textLabel setTextColor:[UIColor blackColor]];
        
    }
    
    return _textLabel;

}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
}
+(NSString*)reuseIdentifier
{
    return @"TDMenuCellCollectionViewCellIdentifier";
}

@end
