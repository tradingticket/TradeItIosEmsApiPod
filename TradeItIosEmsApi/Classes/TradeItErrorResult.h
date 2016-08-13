//
//  TradeItErrorResult.h
//  TradeItIosEmsApi
//
//  Created by Serge Kreiker on 6/26/15.
//  Copyright (c) 2015 TradeIt. All rights reserved.
//

#import "TradeItResult.h"


/**
 *  Returned if an error occured interacting with the Execution Management System (EMS) server
 * @see TradeItResult for the shortMessage and long Messages fields as those are mainly relevant to the TradeItErrorResult class
 */
@interface TradeItErrorResult : TradeItResult

/**
 *  Contains more information on the error to be used for debugging purpose only
 */
@property (copy) NSString<Optional> * systemMessage;

/**
 *  An array with the request parameters that should be fixed before resending a new request. Fields could be authenticationInfo or orderInfo or both
 */
@property (copy) NSArray<Optional> * errorFields;

/**
 *  An error code indicating the type of error, please refer to https://www.trade.it/api#ErrorHandling for a full list of error codes.
 */
@property (copy) NSNumber<Optional> * code;


+(TradeItErrorResult*) tradeErrorWithSystemMessage:(NSString*) systemMessage;

@end
