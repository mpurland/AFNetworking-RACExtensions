#import "AFNetworkReachabilityManager+RACSupport.h"

@implementation AFNetworkReachabilityManager (RACSupport)

#ifdef _SYSTEMCONFIGURATION_H
- (RACSignal *)networkReachabilityStatusSignal {
    return RACObserve(self, networkReachabilityStatus);
}

- (RACSignal *)reachableSignal {
    return RACObserve(self, reachable);
}
#endif

@end

