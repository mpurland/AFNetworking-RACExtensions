#import "AFHTTPSessionManager+RACSupport.h"

NSString * const RAFNetworkingOperationErrorKey = @"AFHTTPRequestOperation";

@implementation AFHTTPClient (RACSupport)

- (RACSignal *)rac_GET:(NSString *)URLString parameters:(NSDictionary *)parameters {
    RACReplaySubject *subject = [RACReplaySubject replaySubjectWithCapacity:1];
    
    RACSignal *signal = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self GET:URLString
                                     parameters:parameters
                                        success:^(NSURLSessionDataTask *task, id response) {
            [subscriber sendNext:RACTuplePack(task, response)];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task , NSError *error) {
            [subscriber sendError:error];
        }];
        
        [task start];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
    
    return [signal replayLazily];
}

- (RACSignal *)rac_HEAD:(NSString *)URLString parameters:(NSDictionary *)parameters {
    RACReplaySubject *subject = [RACReplaySubject replaySubjectWithCapacity:1];
    
    RACSignal *signal = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self HEAD:URLString
                                     parameters:parameters
                                        success:^(NSURLSessionDataTask *task) {
            [subscriber sendNext:task];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task , NSError *error) {
            [subscriber sendError:error];
        }];
        
        [task start];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
    
    return [signal replayLazily];
}

- (RACSignal *)rac_PATCH:(NSString *)URLString parameters:(NSDictionary *)parameters {
    RACReplaySubject *subject = [RACReplaySubject replaySubjectWithCapacity:1];
    
    RACSignal *signal = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self PATCH:URLString
                                     parameters:parameters
                                        success:^(NSURLSessionDataTask *task, id response) {
            [subscriber sendNext:RACTuplePack(task, response)];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task , NSError *error) {
            [subscriber sendError:error];
        }];
        
        [task start];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
    
    return [signal replayLazily];
}

- (RACSignal *)rac_POST:(NSString *)URLString parameters:(NSDictionary *)parameters constructingBodyWithBlock:(void ( ^ ) ( id<AFMultipartFormData> formData ))block {
    RACReplaySubject *subject = [RACReplaySubject replaySubjectWithCapacity:1];
    
    RACSignal *signal = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self POST:URLString
                                     parameters:parameters
                      constructingBodyWithBlock:block
                                        success:^(NSURLSessionDataTask *task, id response) {
            [subscriber sendNext:RACTuplePack(task, response)];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task , NSError *error) {
            [subscriber sendError:error];
        }];
        
        [task start];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
    
    return [signal replayLazily];
}

- (RACSignal *)rac_POST:(NSString *)URLString parameters:(NSDictionary *)parameters {
    RACReplaySubject *subject = [RACReplaySubject replaySubjectWithCapacity:1];
    
    RACSignal *signal = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self POST:URLString
                                     parameters:parameters
                                        success:^(NSURLSessionDataTask *task, id response) {
            [subscriber sendNext:RACTuplePack(task, response)];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task , NSError *error) {
            [subscriber sendError:error];
        }];
        
        [task start];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
    
    return [signal replayLazily];
}

- (RACSignal *)rac_PUT:(NSString *)URLString parameters:(NSDictionary *)parameters {
    RACReplaySubject *subject = [RACReplaySubject replaySubjectWithCapacity:1];
    
    RACSignal *signal = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self PUT:URLString
                                     parameters:parameters
                                        success:^(NSURLSessionDataTask *task, id response) {
            [subscriber sendNext:RACTuplePack(task, response)];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task , NSError *error) {
            [subscriber sendError:error];
        }];
        
        [task start];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
    
    return [signal replayLazily];
}

@end

