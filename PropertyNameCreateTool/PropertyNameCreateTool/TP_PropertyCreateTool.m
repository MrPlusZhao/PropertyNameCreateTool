//
//  TP_PropertyCreateTool.m
//  PropertyNameCreateTool
//
//  Created by ztp on 2018/2/8.
//  Copyright © 2018年 Mr.Plus. All rights reserved.
//

#import "TP_PropertyCreateTool.h"

@implementation TP_PropertyCreateTool

+ (void)PropertyNameCreateFromDict:(NSDictionary*)dict
{
    NSMutableString *mutStr = [NSMutableString string];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        NSString *resultStr = @"";
        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            resultStr = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName];
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")])
        {
            resultStr = [NSString stringWithFormat:@"@property (nonatomic, strong) NSNumber *%@;",propertyName];
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")])
        {
            resultStr = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName];
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")])
        {
            resultStr = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",propertyName];
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")])
        {
            resultStr = [NSString stringWithFormat:@"@property (nonatomic, assign) Int *%@;",propertyName];
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFDate")])
        {
            resultStr = [NSString stringWithFormat:@"@property (nonatomic, assign) NSDate *%@;",propertyName];
        }
        //1:如果识别成功,加入打印的行列
        if (resultStr.length > 0) {
            [mutStr appendFormat:@"\n%@\n",resultStr];
        }
        //2:如果识别失败,记录下是哪个属性,根据自己的业务需求,自己添加
        else
        {
            NSLog(@"class == %@, name == %@",[value class],propertyName);
        }
        
    }];
    
    NSLog(@"\n====最后得到的打印可以直接复制放到Model.h文件里================\n%@\n====最后得到的打印可以直接复制放到Model.h文件里================",mutStr);

}

@end
