//
//  MessageModel.h
//  MessageFall
//
//  Created by Fu on 2017/7/25.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (copy, nonatomic) NSString *text;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *picture;
@property (copy, nonatomic) NSString *vip;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

+(instancetype)messageModelWithDictionary:(NSDictionary *)dict;

@end
