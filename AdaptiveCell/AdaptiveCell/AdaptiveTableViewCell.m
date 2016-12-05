//
//  AdaptiveTableViewCell.m
//  AdaptiveCell
//
//  Created by bnysc on 2016/12/5.
//  Copyright © 2016年 HB. All rights reserved.
//

#import "AdaptiveTableViewCell.h"
#import "AdaptiveModel.h"

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
    self.nameLabel = nameLabel;
    
    UILabel *textLabel = [[UILabel alloc] init];
    [self.contentView addSubview:textLabel];
    self.text_Label = textLabel;
    
    UIImageView *pictureView = [[UIImageView alloc] init];
    [self.contentView addSubview:pictureView];
    self.picthreView = pictureView;
}

// 代码布局
- (void)layoutSubviews {
    [super layoutSubviews];
}

// 重写属性的setter方法
- (void)setModel:(AdaptiveModel *)model {
    if (_model != model) {
        _model = model;
    }
    
    self.nameLabel.text = model.name;
    self.text_Label.text = model.text;
    self.picthreView.image = [UIImage imageNamed:model.picture];
}



@end
