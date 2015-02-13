//
//  Children.h
//  KVCODemo
//
//  Created by jfl913 on 15/2/6.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVCMutableArray.h"

@interface Children : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSUInteger age;
@property (nonatomic, strong) Children *child;
@property (nonatomic, strong) NSMutableArray *siblings;
@property (nonatomic, strong) KVCMutableArray *cousins;

- (NSUInteger)countOfSiblings;
- (id)objectInSiblingsAtIndex:(NSUInteger)index;
- (void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index;
- (void)removeObjectFromSiblingsAtIndex:(NSUInteger)index;

@end
