//
//  MessageCell.m
//  MessageFall
//
//  Created by Fu on 2017/7/25.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import "MessageCell.h"
#import "MessageModel.h"
#import "MessageFrameModel.h"

@interface MessageCell()

@property (nonatomic, weak) UIImageView *userImageView;
@property (nonatomic, weak) UIImageView *vipImageView;
@property (nonatomic, weak) UIImageView *pictureImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *contentLabel;

@end

@implementation MessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    // 设置头像
    UIImageView *userImageView = [[UIImageView alloc]init];
    self.userImageView = userImageView;
    [self.contentView addSubview:userImageView];
    
    // 设置用户名
    UILabel *nameLabel = [[UILabel alloc]init];
    self.nameLabel = nameLabel;
    [self.contentView addSubview:nameLabel];
    
    // 设置vip icon
    UIImageView *vipImageView = [[UIImageView alloc]init];
    self.vipImageView = vipImageView;
    [self.vipImageView setImage:[UIImage imageNamed:@"vip"]]; // vip 图片是固定的
    [self.contentView addSubview:vipImageView];
    
    // 设置文本内容
    UILabel *contentLabel = [[UILabel alloc] init];
    self.contentLabel = contentLabel;
    contentLabel.numberOfLines = 0; // 自动换行
    contentLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:contentLabel];
    
    // 设置配图
    UIImageView *pictureImageView = [[UIImageView alloc] init];
    self.pictureImageView = pictureImageView;
    [self.contentView addSubview:pictureImageView];
}

-(void)setFrameModel:(MessageFrameModel *)frameModel{
    _frameModel = frameModel;
    
    [self setupData];
    
    [self setupFrame];
}

-(void)setupData{
    MessageModel *model = _frameModel.messageModel;
    
    [_userImageView setImage:[UIImage imageNamed:model.icon]];
    
    _nameLabel.text = model.name;
    if ([model.vip intValue] == 1) {
        _nameLabel.textColor = [UIColor redColor];
    }else{
        _nameLabel.textColor = [UIColor blackColor];
    }

    _contentLabel.text = model.text;
    
    if (model.picture) {
        _pictureImageView.image = [UIImage imageNamed:model.picture];
    }
    
}

-(void)setupFrame{
    _userImageView.frame = _frameModel.userImageViewFrame;
    _nameLabel.frame = _frameModel.nameLabelFrame;
    _vipImageView.frame = _frameModel.vipImageViewFrame;
    _contentLabel.frame = _frameModel.contentLabelFrame;
    _pictureImageView.frame = _frameModel.pictureImageViewFrame;
}

@end
