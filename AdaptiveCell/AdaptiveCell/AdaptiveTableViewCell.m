//
//  AdaptiveTableViewCell.m
//  AdaptiveCell
//
//  Created by bnysc on 2016/12/5.
//  Copyright © 2016年 HB. All rights reserved.
//

#import "AdaptiveTableViewCell.h"
#import "AdaptiveModel.h"

#define Space 10          // 间距

@interface AdaptiveTableViewCell ()

@property (nonatomic, weak) UILabel *nameLabel;   // 昵称
@property (nonatomic, weak) UILabel *text_Label;  // 正文
@property (nonatomic, weak) UIImageView *picthreView; // 图片

@end

@implementation AdaptiveTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 重写初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

// 添加子控件
- (void)setupView {
    UILabel *nameLabel = [UILabel new];
    [self.contentView addSubview:nameLabel];
    nameLabel.textColor = [UIColor orangeColor];
    nameLabel.font = [UIFont systemFontOfSize:17];
    self.nameLabel = nameLabel;
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:textLabel];
    self.text_Label = textLabel;
    
    UIImageView *pictureView = [[UIImageView alloc] init];
    [self.contentView addSubview:pictureView];
    self.picthreView = pictureView;
}

// 代码布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.nameLabel.frame = self.model.nameFrame;
    self.text_Label.frame = self.model.textFrame;
    self.picthreView.frame = self.model.pictureFrame;
    
//    CGFloat nameX = Space;
//    CGFloat namey = Space;
//    
//    // 获取文字宽度
//    CGSize nameSzie = [self getLabalSizeWithLabel:self.nameLabel];
//    self.nameLabel.frame = CGRectMake(nameX, namey, nameSzie.width, nameSzie.height);
//    
//    // 正文
//    CGFloat textW = self.contentView.bounds.size.width - Space * 2;
//    CGFloat textH = [self getLabelSizeWithLabel:self.text_Label width:textW];
//    self.text_Label.frame = CGRectMake(Space, CGRectGetMaxY(self.nameLabel.frame) + Space, textW, textH);
//    
//    // 图片
//    if (self.model.picture) {
//        self.picthreView.frame = CGRectMake(Space, CGRectGetMaxY(self.text_Label.frame) + Space, 100, 100);
//    }
}

// 重写属性的setter方法
- (void)setModel:(AdaptiveModel *)model {
    if (_model != model) {
        _model = model;
    }
    
    self.nameLabel.text = model.name;
    self.text_Label.text = model.text;
    
    if (self.picthreView) {
        self.picthreView.hidden = NO;
        self.picthreView.image = [UIImage imageNamed:model.picture];
    } else {
        self.picthreView.hidden = YES;
    }
}


// 获取Label文字尺寸
- (CGSize)getLabalSizeWithLabel:(UILabel *)label {
    NSDictionary *attribute = @{NSFontAttributeName : label.font};
    CGSize size = [label.text sizeWithAttributes:attribute];
    return size;
}

// 获取label高度
- (CGFloat)getLabelSizeWithLabel:(UILabel *)label width:(CGFloat)width{
    NSDictionary *attribute = @{NSFontAttributeName: label.font};
    CGSize size =  [label.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    return size.height;
}




@end
