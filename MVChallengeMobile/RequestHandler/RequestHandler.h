//
//  RequestHandler.h
//  MVChallengeMobile
//
//  Created by shweta dodiya on 2020-06-18.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RequestHandlerServiceDelegate <NSObject>

@required
-(void)fetchResponse:(NSMutableArray *)responseDic;
-(void)fetchError;

@end

@interface RequestHandler : NSObject<NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>
@property (unsafe_unretained) id <RequestHandlerServiceDelegate> delegate;

-(void)getRequestWithString:(NSString *)urlString methodType:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
