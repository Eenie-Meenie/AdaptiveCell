//
//  AdaptiveTableViewCell.h
//  AdaptiveCell
//
//  Created by bnysc on 2016/12/5.
//  Copyright © 2016年 HB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AdaptiveModel;
// 自定义单元格
@interface AdaptiveTableViewCell : UITableViewCell

@property (nonatomic, strong) AdaptiveModel *model; // 模型

@end
