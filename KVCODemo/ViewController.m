//
//  ViewController.m
//  KVCODemo
//
//  Created by jfl913 on 15/2/6.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"
#import "Children.h"

static void *child1Context = &child1Context;
static void *child2Context = &child2Context;

@interface ViewController ()

@property (nonatomic, strong) Children *child1;
@property (nonatomic, strong) Children *child2;
@property (nonatomic, strong) Children *child3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.child1 = [[Children alloc] init];
    [self.child1 setValue:@"jfl" forKey:@"name"];
    [self.child1 setValue:@30 forKey:@"age"];
    
    self.child2 = [[Children alloc] init];
    [self.child2 setValue:@"ypl" forKey:@"name"];
    [self.child2 setValue:@52 forKey:@"age"];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.child1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    [self.child1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    [self.child1 addObserver:self forKeyPath:@"cousins.array" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    
    self.child1.name = @"wl";
    self.child1.age = 30;
//    [self.child1 insertObject:@"a" inSiblingsAtIndex:0];
//    [self.child1 insertObject:@"b" inSiblingsAtIndex:1];
//    [self.child1 insertObject:@"c" inSiblingsAtIndex:2];
//    [self.child1 removeObjectFromSiblingsAtIndex:0];
    
    [self.child1.cousins insertObject:@"Antony" inArrayAtIndex:0];
    [self.child1.cousins insertObject:@"Julia" inArrayAtIndex:1];
    [self.child1.cousins replaceObjectInArrayAtIndex:0 withObject:@"Ben"];
    
    [self.child2 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child2Context];
    self.child2.age = 53;

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == child1Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"child1Context name change: %@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"child1Context age change: %@", change);
        }
        
        if ([keyPath isEqualToString:@"cousins.array"]) {
            NSLog(@"child1Context siblings change: %@", change);
        }
    }else if (context == child2Context){
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"child2Context name change: %@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"child2Context age change: %@", change);
        }

    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.child1 removeObserver:self forKeyPath:@"name"];
    [self.child1 removeObserver:self forKeyPath:@"age"];
    
    [self.child2 removeObserver:self forKeyPath:@"name"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
