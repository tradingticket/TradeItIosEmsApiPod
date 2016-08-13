//
//  TradeItIosEmsApiLib.h
//  TradeItIosEmsApi
//
//  Created by Serge Kreiker on 7/8/15.
//  Copyright (c) 2015 TradeIt. All rights reserved.
//

#ifndef TradeItIosEmsApi_TradeItIosEmsApiLib_h
#define TradeItIosEmsApi_TradeItIosEmsApiLib_h

// Generic classes for the request/results sent the to EMS server
#import "TradeItRequest.h"
#import "TradeItResult.h"
#import "TradeItErrorResult.h"

// Start with the connector, you'll set your API key and the environment
// Then link a user to their brokerage(s) account(s)
#import "TradeItConnector.h"
#import "TradeItLinkedLogin.h"
#import "TradeItAuthenticationInfo.h"
#import "TradeItAuthenticationRequest.h"
#import "TradeItAuthenticationResult.h"
#import "TradeItAuthLinkRequest.h"
#import "TradeItAuthLinkResult.h"
#import "TradeItBroker.h"

// Once you have a link you'll establish a session using the linkedLogin
#import "TradeItSession.h"
#import "TradeItSecurityQuestionRequest.h"
#import "TradeItSecurityQuestionResult.h"

// Use the PublisherService to retrieve ad sources
#import "TradeItAdsRequest.h"
#import "TradeitAdsResult.h"

// Use the TradeService to preview and place trades
#import "TradeItTradeService.h"
#import "TradeItPreviewTradeRequest.h"
#import "TradeItPreviewTradeOrderDetails.h"
#import "TradeItPreviewTradeResult.h"
#import "TradeItPlaceTradeRequest.h"
#import "TradeItPlaceTradeResult.h"
#import "TradeItPlaceTradeOrderInfo.h"
#import "TradeItPlaceTradeOrderInfoPrice.h"

// Use the BalanceService to get account balance information
#import "TradeItBalanceService.h"
#import "TradeItAccountOverviewRequest.h"
#import "TradeItAccountOverviewResult.h"

// Use the PositionSerview to get account position information
#import "TradeItPositionService.h"
#import "TradeItGetPositionsRequest.h"
#import "TradeItGetPositionsResult.h"
#import "TradeItPosition.h"

// Use the PublisherService to get publisher specific configurations/data
#import "TradeItPublisherService.h"
#import "TradeItAdsRequest.h"
#import "TradeItAdsResult.h"

// EMS API Util classes
#import "TradeItTypeDefs.h"

#endif
