//
//  CustomObject.h
//  KeyboardSDK
//
//  Created by MCB-Air-036 on 14/10/20.
//  Copyright © 2020 Idmission. All rights reserved.
//

#ifndef CustomObject_h
#define CustomObject_h


#endif /* CustomObject_h */

#import <Foundation/Foundation.h>

@interface CustomObject : NSObject

void uncaughtExceptionhandler(NSException *exception);
-(void)uploadCrashLogIfAvailable;

@end
