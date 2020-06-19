//
//  ViewController.m
//  MVChallengeMobile
//
//  Created by shweta dodiya on 2020-06-17.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize refreshControl;
- (void)viewDidLoad {
   [super viewDidLoad];
    
   [self.tblView registerNib:[UINib nibWithNibName:@"ProductListCell"
                                                  bundle:[NSBundle mainBundle]]
            forCellReuseIdentifier:@"identifier"];
       
    
   self.requesthandlerObj = [[RequestHandler alloc] init];
   self.requesthandlerObj.delegate = self;
    
   refreshControl = [[UIRefreshControl alloc]init];
   [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
   if (@available(iOS 10.0, *)) {
          self.tblView.refreshControl = refreshControl;
   } else {
          [self.tblView addSubview:refreshControl];
   }
}

- (void)viewWillAppear:(BOOL)animated{
     [self fetchData];
}

// Pull-To-Refresh method
- (void)refreshTable {
    //TODO: refresh your data
    [self fetchData];
    [refreshControl endRefreshing];
    [self.tblView reloadData];
}

#pragma mark : Fetch Method

//Fetch Data from server
-(void)fetchData{
    [self.requesthandlerObj getRequestWithString:[NSString stringWithFormat:@"%@%@%@",BASEURL,BUSINESSID,PRODUCTS] methodType:GETMETHODTYPE];
}

-(void)fetchResponse:(NSMutableArray *)responseDic{
    self.productList = responseDic;
    [self.tblView reloadData];
}

-(void)fetchError{
    self.productList = nil;
    [self.tblView reloadData];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:INTERNETCONNECTION preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            //button click event
                        }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark : UITableview Delegate and Datasource Method

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.productList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.Celltbl = (ProductListCell*)[self.tblView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];

   
   if (self.Celltbl == nil) {
                  NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ProductListCell" owner:self options:nil];
                 self.Celltbl = [topLevelObjects objectAtIndex:0];
    }

    self.Celltbl.productNamelbl.text = [[self.productList objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    self.Celltbl.productPricelbl.text = [NSString stringWithFormat:@"Price: $ %.2f",[[[self.productList objectAtIndex:indexPath.row] objectForKey:@"price"] floatValue]];
    
    return self.Celltbl;
}


@end
