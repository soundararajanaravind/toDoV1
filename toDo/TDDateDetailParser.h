//
//  TDDateDetailParser.h
//  toDo
//
//  Created by Aravind Soundararajan on 19/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDDateDetail.h"

@interface TDDateDetailParser : NSObject

+(NSMutableArray*)parseIncomingDateDetail:(NSDictionary *)dictionary;

@end
