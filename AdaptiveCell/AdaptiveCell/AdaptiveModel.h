//
//  AdaptiveModel.h
//  AdaptiveCell
//
//  Created by bnysc on 2016/12/5.
//  Copyright © 2016年 HB. All rights reserved.
//

#import <UIKit/UIKit.h>
// 模型
@interface AdaptiveModel : NSObject

@property (nonatomic, copy) NSString *name;         // 昵称
@property (nonatomic, copy) NSString *text;         // 正文
@property (nonatomic, copy) NSString *picture;      // 图片

@property (nonatomic, assign) CGRect nameFrame;     // 昵称的frame
@property (nonatomic, assign) CGRect textFrame;     // 正文的frame
@property (nonatomic, assign) CGRect pictureFrame;  // 图片的frame

@property (nonatomic, assign) CGFloat cellHeight;    // 单元格高度

@end
