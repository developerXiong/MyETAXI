//
//  JDOrderListCell.h
//  eTaxi-iOS
//
//  Created by jeader on 16/4/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDOrderListImageView,JDOrderListBottomView;
@class JDCallCarListViewModel;
@interface JDOrderListCell : UITableViewCell

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) JDCallCarListViewModel *viewModel;

@property (nonatomic, strong) JDOrderListImageView *orderImageView;

@property (nonatomic, strong) JDOrderListBottomView *orderBottomView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;

@end
