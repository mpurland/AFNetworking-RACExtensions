#import "AFHTTPSessionManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

/*!
 * User info key for accessing the AFHTTPRequestOperation on which the error occured.
 */
extern NSString * const RAFNetworkingOperationErrorKey;

@interface AFHTTPSessionManager (RACSupport)

- (RACSignal *)rac_GET:(NSString *)path parameters:(NSDictionary *)parameters;
- (RACSignal *)rac_HEAD:(NSString *)path parameters:(NSDictionary *)parameters;
- (RACSignal *)rac_PATCH:(NSString *)path parameters:(NSDictionary *)parameters;
- (RACSignal *)rac_POST:(NSString *)path parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block;
- (RACSignal *)rac_POST:(NSString *)path parameters:(NSDictionary *)parameters;
- (RACSignal *)rac_PUT:(NSString *)path parameters:(NSDictionary *)parameters;
- (RACSignal *)rac_DELETE:(NSString *)path parameters:(NSDictionary *)parameters;

@end

