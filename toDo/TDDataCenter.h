//
//  TDDataCenter.h
//  toDo
//
//  Created by Aravind Soundararajan on 10/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TDDataCenterDelegate <NSObject>

@required

-(void)failedTransaction;

@end

@interface TDDataCenter : NSObject

@property __weak id<TDDataCenterDelegate> delegate;

-(id)getActivitesForDatesFromURL:(NSString*)URL;


@end
