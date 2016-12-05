//
//  BaseViewController.m
//  AdaptiveCell
//
//  Created by bnysc on 2016/12/5.
//  Copyright © 2016年 HB. All rights reserved.
//

#import "BaseViewController.h"
#import <MJExtension.h>
#import "AdaptiveModel.h"
#import "AdaptiveTableViewCell.h"

#define Space 10          // 间距

static NSString *identifier = @"AdaptiveTableViewCell";

@interface BaseViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation BaseViewController

#pragma mark - 懒加载
- (NSArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [AdaptiveModel mj_objectArrayWithFilename:@"ModelList.plist"];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[AdaptiveTableViewCell class] forCellReuseIdentifier:identifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 设置单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    AdaptiveModel *model = self.dataSource[indexPath.row];
  
    return model.cellHeight;
}

// 设置单元格行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

// 设置单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AdaptiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    // 传递数组模型
    cell.model = self.dataSource[indexPath.row];
    return cell;
}


#pragma mark - table view delegate

#pragma mark - accessory method
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
