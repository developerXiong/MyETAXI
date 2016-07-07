//
//  JDOutputCell.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/23.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDOutputCell.h"

@implementation JDOutputCell

- (void)awakeFromNib {
    // Initialization code
    
    self.sureButton.layer.cornerRadius = 3.0;
    self.sureButton.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
