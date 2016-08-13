//
//  TradeItQuotesRequest.m
//  TradeItIosEmsApi
//
//  Created by Antonio Reyes on 2/12/16.
//  Copyright © 2016 TradeIt. All rights reserved.
//

#import "TradeItQuotesRequest.h"

@implementation TradeItQuotesRequest

-(id) initWithSymbol:(NSString *) symbol {
    self = [super init];
    if(self) {
        self.symbol = symbol;
    }
    
    if([symbol containsString:@".SI"]) {
        self.symbol = [symbol substringToIndex:[symbol rangeOfString:@".SI"].location];
        self.suffixMarket = @"SI";
    }
    
    return self;
}

-(id) initWithSymbols:(NSArray *) symbols {
    self = [super init];
    if(self) {
        self.symbols = [symbols componentsJoinedByString:@","];
    }
    return self;
}

-(id) initWithSymbol:(NSString *) symbol andMarketSuffix: (NSString *) suffix {
    self = [super init];
    if(self) {
        self.symbol = symbol;
        self.suffixMarket = suffix;
    }
    return self;
}

@end
