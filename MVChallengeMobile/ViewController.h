//
//  ViewController.h
//  MVChallengeMobile
//
//  Created by shweta dodiya on 2020-06-17.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestHandler.h"
#import "ProductListCell.h"

#import "Constant.h"

@interface ViewController : UIViewController<RequestHandlerServiceDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tblView;
@property (nonatomic, strong) IBOutlet ProductListCell *Celltbl;
@property (nonatomic, strong) NSMutableArray *productList;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) RequestHandler *requesthandlerObj;

@end

