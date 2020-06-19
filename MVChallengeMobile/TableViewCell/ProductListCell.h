//
//  ProductListCell.h
//  MVChallengeMobile
//
//  Created by shweta dodiya on 2020-06-18.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductListCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *productNamelbl;
@property (nonatomic, strong) IBOutlet UILabel *productPricelbl;

@end

NS_ASSUME_NONNULL_END
