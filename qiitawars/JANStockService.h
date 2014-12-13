//
//  JANStockService.h
//  qiitawars
//
//  Created by bob on 2014/12/13.
//  Copyright (c) 2014年 janehouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JANStock;

@interface JANStockService : NSObject
- (void)saveParsedString:(NSString*) parsedString;
- (NSUInteger)stockCount;


- (void)saveStock:(JANStock*) stock;
- (NSArray *)loadStacks;
- (void)saveStacks:(NSArray*)stocks;
@end
