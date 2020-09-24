//
//  RCTAppNative.h
//  ISEAS
//
//  Created by Chakshu on 31/03/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTAppNative : NSObject<RCTBridgeModule>{
  NSString *recivedFCMTOKEN;
}
@end

NS_ASSUME_NONNULL_END
