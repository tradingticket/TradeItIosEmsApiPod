//
//  TradeItMarketDataService.h
//  TradeItIosEmsApi
//
//  Created by Antonio Reyes on 2/12/16.
//  Copyright © 2016 TradeIt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TradeItSession.h"
#import "TradeItQuotesRequest.h"
#import "TradeItSymbolLookupRequest.h"

@interface TradeItMarketDataService : NSObject

/**
 *  The session will need to be set for the request to be made
 */
@property TradeItSession * session;

/**
 *  As the session needs to be set, this is the preferred init method
 */
-(id) initWithSession:(TradeItSession *) session;

/**
 *  This method requires a TradeItQuoteRequest
 *
 *  @return successful response is a TradeItQuoteResult
 *  - TradeItErrorResult also possible please see https://www.trade.it/api#ErrorHandling for descriptions of error codes
 *
 */
- (void) getQuoteData:(TradeItQuotesRequest *) request withCompletionBlock:(void (^)(TradeItResult *)) completionBlock;

/**
 *  This method requires a TradeItSymbolLookupRequest
 *
 *  @return successful response is a TradeItSymbolLookupResult
 *  - TradeItErrorResult also possible please see https://www.trade.it/api#ErrorHandling for descriptions of error codes
 *
 */
- (void) symbolLookup:(TradeItSymbolLookupRequest *) request withCompletionBlock:(void (^)(TradeItResult *)) completionBlock;


@end
