//
//  RCTAppNative.m
//  ISEAS
//
//  Created by Chakshu on 31/03/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RCTAppNative.h"
#import <VizuryEventLogger/VizuryEventLogger.h>
#import <React/RCTLog.h>

@implementation RCTAppNative
RCT_EXPORT_MODULE(AppNative);
RCT_EXPORT_METHOD(logVE360:(NSDictionary *)param param2:(NSString *)param2) {
  //RCTLogInfo(@"Welcome, %@", param);
  [VizuryEventLogger logEvent:param2 WithAttributes:param];
}

RCT_EXPORT_METHOD(passFCMToken:(NSString *)recieveFCMTOken)
{
  NSData *data = [recieveFCMTOken dataUsingEncoding:NSUTF8StringEncoding];
  [VizuryEventLogger registerForPushWithToken:data];
  RCTLogInfo(@"Pretending to create an event %@",recieveFCMTOken);
  recivedFCMTOKEN = recieveFCMTOken;
}

RCT_EXPORT_METHOD(rejectionHandle:(NSString *)rejectRecieve)
{
  [VizuryEventLogger didFailToRegisterForPush];
  RCTLogInfo(@"Pretending to create an event %@",rejectRecieve);
}
@end


