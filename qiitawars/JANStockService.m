//
//  JANStockService.m
//  qiitawars
//
//  Created by bob on 2014/12/13.
//  Copyright (c) 2014年 janehouse. All rights reserved.
//

#import "JANStockService.h"
#import "JANStock.h"
#import "JSONKit.h"

#define STOCKS @"stocks"

@implementation JANStockService
-(void)saveParsedString:(NSString*)parsedString
{
    NSMutableArray *stocks = [NSMutableArray arrayWithArray:[self loadStacks]];
    [stocks addObject:parsedString];
}

-(NSUInteger)stockCount
{
    NSArray *stocks = [self loadStacks];
    NSString *lastParsedString = [stocks lastObject];
    NSArray *stock = [lastParsedString objectFromJSONString];
    return [stock count];
}



-(void)saveStock:(JANStock *)stock
{
    NSMutableArray *stocks = [NSMutableArray arrayWithArray:[self loadStacks]];
    [stocks addObject:stocks];
    [self saveStacks:stocks];
}

-(NSArray *)loadStacks
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults arrayForKey:STOCKS];
    if (array) {
        return [userDefaults arrayForKey:STOCKS];
    }
    return [NSArray array];
}

-(void)saveStacks:(NSArray *)stocks
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:stocks forKey:STOCKS];
    [userDefaults synchronize];
}
@end
