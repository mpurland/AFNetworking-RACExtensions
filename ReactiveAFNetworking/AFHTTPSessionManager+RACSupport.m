#import "AFHTTPSessionManager+RACSupport.h"

NSString * const RAFNetworkingOperationErrorKey = @"AFHTTPRequestOperation";

@implementation AFHTTPClient (RACSupport)

/*
- (RACSignal *)rac_enqueueHTTPRequestOperation:(AFHTTPRequestOperation *)requestOperation
{
    [self enqueueHTTPRequestOperation:requestOperation];
    return [requestOperation rac_overrideHTTPCompletionBlock];
}

- (RACSignal *)rac_getPath:(NSString *)path parameters:(NSDictionary *)parameters {
    return [[self
        rac_requestPath:path parameters:parameters method:@"GET"]
        setNameWithFormat:@"<%@: %p> -rac_getPath: %@, parameters: %@", self.class, self, path, parameters];
}

- (RACSignal *)rac_requestPath:(NSString *)path parameters:(NSDictionary *)parameters method:(NSString *)method {
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLRequest *request = [self requestWithMethod:method path:path parameters:parameters];
        AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:^(id operation, id result) {
            [subscriber sendNext:RACTuplePack(operation, result)];
            [subscriber sendCompleted];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSMutableDictionary *userInfo = [error.userInfo mutableCopy] ?: [NSMutableDictionary dictionary];
            userInfo[RAFNetworkingOperationErrorKey] = operation;
            [subscriber sendError:[NSError errorWithDomain:error.domain code:error.code userInfo:userInfo]];
        }];

        [self enqueueHTTPRequestOperation:operation];

        return [RACDisposable disposableWithBlock:^{
            [operation cancel];
        }];
    }];
}
*/

- (RACSignal *)rac_GET:(NSString *)URLString parameters:(NSDictionary *)parameters {
    RACReplaySubject *subject = [RACReplaySubject replaySubjectWithCapacity:1];
    
    RACSignal *signal = [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self GET:URLString
                                     parameters:parameters
                                        success:^(NSURLSessionDataTask *task, id response) {
            [subscriber sendNext:RACTuplePack(task, response)];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask *task , NSError *error) {
            [subscriber sendError:RACTuplePack(task, error)];
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
            [subscriber sendError:RACTuplePack(task, error)];
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
            [subscriber sendError:RACTuplePack(task, error)];
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
            [subscriber sendError:RACTuplePack(task, error)];
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
            [subscriber sendError:RACTuplePack(task, error)];
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
            [subscriber sendError:RACTuplePack(task, error)];
        }];
        
        [task start];

        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
    
    return [signal replayLazily];
}

@end

