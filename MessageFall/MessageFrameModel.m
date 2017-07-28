//
//  MessageFrameModel.m
//  MessageFall
//
//  Created by Fu on 2017/7/27.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import "MessageFrameModel.h"
#import "MessageModel.h"

@implementation MessageFrameModel

-(void)setMessageModel:(MessageModel *)messageModel{
    _messageModel = messageModel;
    
    // 计算每一个控件的 frame
    // 头像
    CGFloat margin = 10;
    CGFloat userImageWidth = 50;
    
    _userImageViewFrame = CGRectMake(margin, margin, userImageWidth, userImageWidth);
    
    // 名字
    CGSize nameLabelMaxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    
    CGSize nameLabelRealSize = [messageModel.name boundingRectWithSize:nameLabelMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    
    CGFloat nameLabelX = CGRectGetMaxX(_userImageViewFrame) + margin;
    CGFloat nameLabelY = (userImageWidth - nameLabelRealSize.height) /2 + margin;
    
    _nameLabelFrame = CGRectMake(nameLabelX, nameLabelY, nameLabelRealSize.width, nameLabelRealSize.height);
    
    // vip 图标
    CGFloat vipWidth = 20;
    CGFloat vipX = CGRectGetMaxX(_nameLabelFrame) + margin;
    CGFloat vipY = nameLabelY;
    
    if ([messageModel.vip intValue] == 1) {
        _vipImageViewFrame = CGRectMake(vipX, vipY, vipWidth, vipWidth);
    }else{
        _vipImageViewFrame = CGRectZero;
    }
    
    // 正文
    CGFloat contentLabelWidth = [UIScreen mainScreen].bounds.size.width - 2 * margin;
    CGSize contentMaxSize = CGSizeMake(contentLabelWidth, MAXFLOAT);
    CGSize contentRealSize = [messageModel.text boundingRectWithSize:contentMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    CGFloat contentLabelX = margin;
    CGFloat contentLabelY = CGRectGetMaxX(_userImageViewFrame) + margin;
    
    _contentLabelFrame = CGRectMake(contentLabelX, contentLabelY, contentRealSize.width, contentRealSize.height);
    
    // 配图
    CGFloat pictureWidth = 2 * userImageWidth;
    CGFloat pictureX = margin;
    CGFloat pictureY = CGRectGetMaxY(_contentLabelFrame) + margin;
    
    if (messageModel.picture) {
        _pictureImageViewFrame = CGRectMake(pictureX, pictureY, pictureWidth, pictureWidth);
        
        // 计算整体高度
        _cellHeight = CGRectGetMaxY(_pictureImageViewFrame) + margin;
    }else{
        _pictureImageViewFrame = CGRectZero;
        
        // 计算整体高度
        _cellHeight = CGRectGetMaxY(_contentLabelFrame) + margin;
    }
    
}

@end
