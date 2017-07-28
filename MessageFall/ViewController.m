//
//  ViewController.m
//  MessageFall
//
//  Created by Fu on 2017/7/25.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import "ViewController.h"
#import "MessageCell.h"
#import "MessageModel.h"
#import "MessageFrameModel.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray * dataArray;

@end

@implementation ViewController

-(NSArray *)dataArray{
    if (!_dataArray) {
        // 取出数据
        NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil]];
        
        // 字典转数组
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            MessageModel *model = [MessageModel messageModelWithDictionary:dic];
            
            MessageFrameModel *frameModel = [[MessageFrameModel alloc]init];
            frameModel.messageModel = model;
            
            [arr addObject:frameModel];
        }
        _dataArray = [NSArray arrayWithArray:arr];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"messagecell";
    MessageCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.frameModel = self.dataArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageFrameModel *frameModel = self.dataArray[indexPath.row];
    return frameModel.cellHeight;
}


@end
