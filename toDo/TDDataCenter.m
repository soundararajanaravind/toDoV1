//
//  TDDataCenter.m
//  toDo
//
//  Created by Aravind Soundararajan on 10/08/15.
//  Copyright (c) 2015 Aravind Soundararajan. All rights reserved.
//

#import "TDDataCenter.h"
#import "AFNetworking.h"

@implementation TDDataCenter

-(id)getActivitesForDatesFromURL:(NSString*)URL{

    NSDictionary *responseObjectDictionary;
    
    //Checking for reachability of Internet
    if (!([AFNetworkReachabilityManager sharedManager].reachable)) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh-Oh!" message:@"Looks like there might be a network drop. Please come back again to check." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    NSString *URLString = [NSString stringWithFormat:@"%@",URL];
    NSURL *url = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    

    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        

        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Date Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    
    [operation start];
    [operation waitUntilFinished];
    
    responseObjectDictionary = (NSDictionary*)operation.responseObject;
    return responseObjectDictionary;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self failedTransaction];
}

-(void)failedTransaction
{
    if([self delegate] && [[self delegate] respondsToSelector:@selector(failedTransaction)])
    {
        [[self delegate] failedTransaction];
    }
}

@end
