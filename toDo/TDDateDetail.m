//
//  TDDateDetail.m
//  toDo
//
//  Created by Aravind Soundararajan on 14/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "TDDateDetail.h"

@implementation TDDateDetail


-(id)initWithDetail:(NSDictionary*)TDNoteDetail
{
    self = [super init];
    
    if(self)
    {
        
        //Extracting the date string from the dictionary
        NSString *dateStr = [TDNoteDetail objectForKey:@"date"];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        NSDate *date = [[NSDate alloc] init];
        date = [dateFormat dateFromString:dateStr];
    
        _noteDate = date;
        
        _noteDetails = [TDNoteDetail objectForKey:@"details"];
        
    }
    
    return self;
}

-(NSInteger)getWeekday
{
    NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:_noteDate];
    NSInteger weekday = [dateComponent day];
    
    return weekday;

}

-(NSString*)getMonth
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM"];
    NSString *monthFromDate = [dateFormatter stringFromDate:_noteDate];
    
    return monthFromDate;
}

-(NSString*)getDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dayString = [dateFormatter stringFromDate:_noteDate];
    
    return dayString;
    
}

-(NSInteger)getYear
{
    NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:_noteDate];
    NSInteger year = [dateComponent year];
    
    return year;
    
}

@end
