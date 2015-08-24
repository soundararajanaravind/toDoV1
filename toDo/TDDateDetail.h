//
//  TDDateDetail.h
//  toDo
//
//  Created by Aravind Soundararajan on 14/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDDateDetail : NSObject

@property (nonatomic,strong) NSDate *noteDate;
@property (nonatomic,strong) NSDictionary *noteDetails;

-(id)initWithDetail:(NSDictionary*)TDNoteDetail;

-(NSInteger)getWeekday;
-(NSString*)getMonth;
-(NSString*)getDay;
-(NSInteger)getYear;


@end
