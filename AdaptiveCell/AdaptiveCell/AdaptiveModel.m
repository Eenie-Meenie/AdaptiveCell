//
//  AdaptiveModel.m
//  AdaptiveCell
//
//  Created by bnysc on 2016/12/5.
//  Copyright © 2016年 HB. All rights reserved.
//

#import "AdaptiveModel.h"
#define Space 10          // 间距
@implementation AdaptiveModel

// 懒加载
- (CGFloat)cellHeight {
    if (_cellHeight == 0) {
        CGFloat nameX = Space;
        CGFloat namey = Space;
        
        // 获取文字宽度
        //    CGSize nameSzie = [self getLabalSizeWithLabel:self.nameLabel];
        
        NSDictionary *attribute = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        CGSize nameSize = [self.name sizeWithAttributes:attribute];
        
        self.nameFrame = CGRectMake(nameX, namey, nameSize.width, nameSize.height);
        
        // 正文
        CGFloat textW = [UIScreen mainScreen].bounds.size.width - Space * 2;
        
        NSDictionary *attribute1 = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
        CGSize textsize =  [self.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute1 context:nil].size;
        
        //    CGFloat textH = [self getLabelSizeWithLabel:self.text_Label width:textW];
        self.textFrame = CGRectMake(Space, CGRectGetMaxY(self.nameFrame) + Space, textW, textsize.height);
        
        // 图片
        if (self.picture) {
            self.pictureFrame = CGRectMake(Space, CGRectGetMaxY(self.textFrame) + Space, 100, 100);
            _cellHeight = CGRectGetMaxY(self.pictureFrame) + Space;
        } else {
            _cellHeight = CGRectGetMaxY(self.textFrame) + Space;
        }
    }
    return _cellHeight;
}

@end
