//
//  ProductListCell.m
//  MVChallengeMobile
//
//  Created by shweta dodiya on 2020-06-18.
//  Copyright © 2020 shweta dodiya. All rights reserved.
//

#import "ProductListCell.h"

@implementation ProductListCell
@synthesize productNamelbl,productPricelbl;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
