//
//  JDBankCardCell.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDBankCardCell.h"

@implementation JDBankCardCell

- (void)awakeFromNib {
    // Initialization code
    
    self.addBankCardButton.layer.cornerRadius = 5.0;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
