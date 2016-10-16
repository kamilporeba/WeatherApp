//
//  ConcurentOperation.m
//  WheaterApp
//
//  Created by Kamil Poręba on 11.10.2016.
//  Copyright © 2016 Kamil Poręba. All rights reserved.
//

#import "ConcurentOperation.h"

@implementation ConcurentOperation

@synthesize ready = _ready;
@synthesize executing = _executing;
@synthesize finished = _finished;

#pragma mark - Init
-(instancetype)init {
    self = [super init];
    
    if (self) {
        _ready = YES;
    }
    
    return self;
}

#pragma mark - State
- (void)setReady:(BOOL)ready
{
    if (_ready != ready)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isReady))];
        _ready = ready;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isReady))];
    }
}

- (BOOL)isReady
{
    return _ready;
}

- (void)setExecuting:(BOOL)executing
{
    if (_executing != executing)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
        _executing = executing;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
    }
}

- (BOOL)isExecuting
{
    return _executing;
}

- (void)setFinished:(BOOL)finished
{
    if (_finished != finished)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
        _finished = finished;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
    }
}

- (BOOL)isFinished
{
    return _finished;
}

-(BOOL)isAsynchronous {
    return YES;
}
#pragma mark - Control

- (void)start
{
    if (!self.isExecuting)
    {
        self.ready = NO;
        self.executing = YES;
        self.finished = NO;
    }
}

- (void)finish
{
    if (self.executing)
    {
        
        self.executing = NO;
        self.finished = YES;
    }
}

@end
