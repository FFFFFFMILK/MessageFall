//
//  MessageModel.m
//  MessageFall
//
//  Created by Fu on 2017/7/25.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)messageModelWithDictionary:(NSDictionary *)dict{
    return [[MessageModel alloc]initWithDictionary:dict];
}


@end
