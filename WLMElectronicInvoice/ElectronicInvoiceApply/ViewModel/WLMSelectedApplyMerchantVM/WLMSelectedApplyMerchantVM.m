//
//  WLMSelectedApplyMerchantVM.m
//  WLMElectronicInvoice
//
//  Created by 刘光强 on 2018/5/16.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "WLMSelectedApplyMerchantVM.h"
#import "WLMSelectedApplyMerchantModel.h"

@interface WLMSelectedApplyMerchantVM()

@property (nonatomic, strong, readwrite) RACCommand *merchantListCmd;
@property (nonatomic, strong, readwrite) WLMEInvoiceIntroduceVM *introduceViewModel;
@end

@implementation WLMSelectedApplyMerchantVM

- (instancetype)initWithService:(id<WLBViewModelServiceImpProtocol>)service params:(NSDictionary *)params {
    self = [super initWithService:service params:params];
    if (self) {
    }
    return self;
}

- (void)initialize {
    [super initialize];
    
    self.introduceViewModel = [[WLMEInvoiceIntroduceVM alloc] initWithService:self.service params:nil];
        
    _merchantListCmd = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 网络数据请求成功之后的回调(完全可以用block而不必使用RAC)
            WLMSelectedApplyMerchantModel *model = [[WLMSelectedApplyMerchantModel alloc] init];
            model.merchantNo = @"123456789🍎";
            model.merchantName = @"merchantName🍐";
            model.provinceName = @"provinceName🍉";
            model.cityName = @"cityName🍌";
            model.areaName = @"areaName🍑";
            model.invoiceBusinessDesc = @"invoiceBusinessDesc🍇";
            model.invoiceBusinessStatus = @"invoiceBusinessStatus🍊";
            model.merchantState = 0;
            NSArray *dataArray = @[model];
            [subscriber sendNext:dataArray];
            [subscriber sendCompleted];
            
//            [[[__NETWL configPostPathKey:@"net_ei_merchant_list" postParams:@{}] setLoadMode:RequestLoadShowErrorTips] requestCallBack:^(LRResponseModel *responseModel) {
//                if (responseModel.success) {
//                    NSArray *dataArray = [WLMSelectedApplyMerchantModel mj_objectArrayWithKeyValuesArray:responseModel];
//                    [subscriber sendNext:dataArray];
//                    [subscriber sendCompleted];
//                } else {
//                    [subscriber sendCompleted];
//                }
//            }];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
}

@end
