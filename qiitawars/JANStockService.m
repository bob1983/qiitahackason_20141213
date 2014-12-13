//
//  JANStockService.m
//  qiitawars
//
//  Created by bob on 2014/12/13.
//  Copyright (c) 2014年 janehouse. All rights reserved.
//

#import "JANStockService.h"
#import <JSONKit/JSONKit.h>
#import "JANStock.h"

@implementation JANStockService
- (void)retrieveStocksWithUserId:(NSString *)userId
                  successHandler:(StockServiceRetrieveSuccessHandler)successHandler
                   failedHandler:(StockServiceFailedHandler)failedHandler

{
    
    NSString *baseUrl     = @"https://qiita.com/api/v2/users/";
    NSString *urlStr      = [NSString stringWithFormat:@"%@%@%@", baseUrl, userId, @"/stocks?page=1&per_page=100"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data,
                                               NSError *connectionError) {
                               if (connectionError) {
                                   return;
                               }
                               NSArray *stocks = [self stocksFromRetrievedData:data];
                               if (successHandler){
                                   successHandler(stocks);
                               }
                           }];
}

- (NSArray *)stocksFromRetrievedData:(NSData *)data
{
    NSArray *arr = [data objectFromJSONData];
    NSMutableArray *stocks = [NSMutableArray array];
    
    for (id stock in arr) {
        [stocks addObject:stock];
    }
    
    return stocks;
}
@end
