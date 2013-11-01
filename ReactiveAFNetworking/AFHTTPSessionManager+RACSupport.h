#import "AFHTTPSessionManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

/*!
 * User info key for accessing the AFHTTPRequestOperation on which the error occured.
 */
extern NSString * const RAFNetworkingOperationErrorKey;

@interface AFHTTPSessionManager (RACSupport)


- (RACSignal *)rac_getPath:(NSString *)path parameters:(NSDictionary *)parameters;

@end

