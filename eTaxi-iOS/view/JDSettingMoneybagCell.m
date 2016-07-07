//
//  JDSettingMoneybag.m
//  eTaxi-iOS
//
//  Created by jeader on 16/6/28.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "JDSettingMoneybagCell.h"

@implementation JDSettingMoneybagCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withKey:(NSString *)key
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier withKey:key]) {
        // 移除switch
        [[self.detailView.subviews lastObject] removeFromSuperview];
        
    }
    return self;
}

@end
