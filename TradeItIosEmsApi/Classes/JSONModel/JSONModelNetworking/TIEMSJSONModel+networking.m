//
//  JSONModel+networking.m
//
//  @version 1.0.2
//  @author Marin Todorov, http://www.touch-code-magazine.com
//

// Copyright (c) 2012-2014 Marin Todorov, Underplot ltd.
// This code is distributed under the terms and conditions of the MIT license.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// The MIT License in plain English: http://www.touch-code-magazine.com/JSONModel/MITLicense

#import "TIEMSJSONModel+networking.h"
#import "TIEMSJSONHTTPClient.h"

BOOL _isLoading;

@implementation TIEMSJSONModel(Networking)

@dynamic isLoading;

-(BOOL)isLoading
{
    return _isLoading;
}

-(void)setIsLoading:(BOOL)isLoading
{
    _isLoading = isLoading;
}

-(instancetype)initFromURLWithString:(NSString *)urlString completion:(JSONModelBlock)completeBlock
{
    id placeholder = [super init];
    __block id blockSelf = self;
    
    if (placeholder) {
        //initialization
        self.isLoading = YES;
        
        [TIEMSJSONHTTPClient getJSONFromURLWithString:urlString
                                      completion:^(NSDictionary *json, TIEMSJSONModelError* e) {
                                          
                                          TIEMSJSONModelError* initError = nil;
                                          blockSelf = [self initWithDictionary:json error:&initError];
                                          
                                          if (completeBlock) {
                                              dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
                                                  completeBlock(blockSelf, e?e:initError );
                                              });
                                          }
                                          
                                          self.isLoading = NO;
                                          
                                      }];
    }
    return placeholder;
}

+ (void)getModelFromURLWithString:(NSString*)urlString completion:(JSONModelBlock)completeBlock
{
	[TIEMSJSONHTTPClient getJSONFromURLWithString:urlString
								  completion:^(NSDictionary* jsonDict, TIEMSJSONModelError* err)
	{
		TIEMSJSONModel* model = nil;

		if(err == nil)
		{
			model = [[self alloc] initWithDictionary:jsonDict error:&err];
		}

		if(completeBlock != nil)
		{
			dispatch_async(dispatch_get_main_queue(), ^
			{
				completeBlock(model, err);
			});
		}
    }];
}

+ (void)postModel:(TIEMSJSONModel*)post toURLWithString:(NSString*)urlString completion:(JSONModelBlock)completeBlock
{
	[TIEMSJSONHTTPClient postJSONFromURLWithString:urlString
								   bodyString:[post toJSONString]
								   completion:^(NSDictionary* jsonDict, TIEMSJSONModelError* err)
	{
		TIEMSJSONModel* model = nil;

		if(err == nil)
		{
			model = [[self alloc] initWithDictionary:jsonDict error:&err];
		}

		if(completeBlock != nil)
		{
			dispatch_async(dispatch_get_main_queue(), ^
			{
				completeBlock(model, err);
			});
		}
	}];
}

@end
