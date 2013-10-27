#import "AFNetworkReachabilityManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface AFNetworkReachabilityManager (RACSupport)

#ifdef _SYSTEMCONFIGURATION_H

/*!
 * A convenient getter for the Network Reachability Status getter in AFNetworking.  No need to 
 * subscribe to anymore notifications, just -subscribeNext: and let the network changes flow in!
 * As with the primitive reachability property, you must be linked against, and importing, 
 * SystemConfiguration.framework.
 *
 * Sample Usage:
 *
 * [self.httpClient.networkReachabilityStatusSignal subscribeNext:^(NSNumber *status) {
 *     AFNetworkReachabilityStatus networkStatus = [status intValue];
 *     switch (networkStatus) {
 *          case AFNetworkReachabilityStatusUnknown:
 *          case AFNetworkReachabilityStatusNotReachable:
 *               [self cancelTheShow];
 *               break;
 *          case AFNetworkReachabilityStatusReachableViaWWAN:
 *          case AFNetworkReachabilityStatusReachableViaWiFi:
 *              if (self.theShowMustGoOn)
 *                  [self letTheShowGoOn];
 *               break;
 *      }
 * }];
 */
- (RACSignal *)networkReachabilityStatusSignal;

- (RACSignal *)reachableSignal;
#endif

@end

