//
//  TDNoteDetailTableViewCell.m
//  toDo
//
//  Created by Aravind Soundararajan on 24/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "TDNoteDetailTableViewCell.h"

@implementation TDNoteDetailTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        
        _noteDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, frame.size.width - 20, self.frame.size.height - 20)];
        _noteDescriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f];
        [self.contentView addSubview:_noteDescriptionLabel];
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
