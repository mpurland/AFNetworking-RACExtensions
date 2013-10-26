#import "AFNetworkReachabilityManager+RACSupport.h"

@implementation AFNetworkReachabilityManager (RACSupport)

#ifdef _SYSTEMCONFIGURATION_H
- (RACSignal *)networkReachabilityStatusSignal {
    return RACObserve(self, networkReachabilityStatus);
}
#endif

@end

