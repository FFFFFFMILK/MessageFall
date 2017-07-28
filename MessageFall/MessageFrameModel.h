//
//  MessageFrameModel.h
//  MessageFall
//
//  Created by Fu on 2017/7/27.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MessageModel;

@interface MessageFrameModel : NSObject

@property (assign, nonatomic, readonly) CGRect userImageViewFrame;

@property (assign, nonatomic, readonly) CGRect vipImageViewFrame;

@property (assign, nonatomic, readonly) CGRect pictureImageViewFrame;

@property (assign, nonatomic, readonly) CGRect nameLabelFrame;

@property (assign, nonatomic, readonly) CGRect contentLabelFrame;

@property (assign, nonatomic, readonly) CGFloat cellHeight;

@property (strong, nonatomic) MessageModel *messageModel; // 拿到数据后，对frame进行计算

@end
