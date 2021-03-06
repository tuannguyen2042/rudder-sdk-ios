//
//  RSNetwork.m
//  RSSDKCore
//
//  Created by Arnab Pal on 17/10/19.
//  Copyright © 2019 RSlabs. All rights reserved.
//

#import "RSNetwork.h"
#import <CoreTelephony/CTCarrier.h>

@implementation RSNetwork

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *carrierName = [[[CTCarrier alloc] init] carrierName];
        if (carrierName == nil) {
            carrierName = @"unavailable";
        }
        _carrier = carrierName;
        _wifi = YES;
        _bluetooth = NO;
        _cellular = NO;
    }
    return self;
}

- (NSDictionary<NSString *,NSObject *> *)dict {
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
    
    [tempDict setValue:_carrier forKey:@"carrier"];
    [tempDict setValue:[NSNumber numberWithBool:_wifi] forKey:@"wifi"];
    [tempDict setValue:[NSNumber numberWithBool:_bluetooth] forKey:@"bluetooth"];
    [tempDict setValue:[NSNumber numberWithBool:_cellular] forKey:@"cellular"];
    
    return [tempDict copy];
}

@end
