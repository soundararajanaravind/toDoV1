//
//  TDDateDetailParser.m
//  toDo
//
//  Created by Aravind Soundararajan on 19/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "TDDateDetailParser.h"

@implementation TDDateDetailParser

+(NSMutableArray*)parseIncomingDateDetail:(NSDictionary *)dictionary
{
    NSMutableArray *dateDetailArray = [[NSMutableArray alloc] init];
    
    NSArray *dates = [dictionary objectForKey:@"dates"];
    
    for(NSDictionary *dateDetailDictionary in dates)
    {
        TDDateDetail *dateDetail = [[TDDateDetail alloc] initWithDetail:dateDetailDictionary];
        
        [dateDetailArray addObject:dateDetail];
    }

    return dateDetailArray;
}




@end
