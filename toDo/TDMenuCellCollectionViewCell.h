//
//  TDMenuCellCollectionViewCell.h
//  toDo
//
//  Created by Aravind Soundararajan on 10/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDMenuCellCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *textLabel;

+(NSString*)reuseIdentifier;

@end
