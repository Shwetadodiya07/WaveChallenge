//
//  RequestHandler.m
//  MVChallengeMobile
//
//  Created by shweta dodiya on 2020-06-18.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import "RequestHandler.h"

@implementation RequestHandler

-(void)getRequestWithString:(NSString *)urlString methodType:(NSString *)type
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];

    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
   

    [urlRequest setValue:ACCESSTOKEN forHTTPHeaderField:@"Authorization"];
    [urlRequest setHTTPMethod:type];

    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:urlRequest];
    [dataTask resume];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}
 
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data
{
    NSError* error;
    NSMutableArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
    [self.delegate fetchResponse:jsonArray];
}
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error
{
    if(error == nil)
    {
    }
    else
    {
        NSLog(@"Error %@",[error userInfo]);
        if(error.code == -1009){
            [self.delegate fetchError];

        }
    }
}
@end
