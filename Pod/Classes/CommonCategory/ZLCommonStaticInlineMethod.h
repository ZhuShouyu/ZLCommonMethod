//
//  ZLCommonStaticInlineMethod.h
//  Pods
//
//  Created by ZhuShouyu on 6/30/15.
//
//

#ifndef Pods_ZLCommonStaticInlineMethod_h
#define Pods_ZLCommonStaticInlineMethod_h

typedef NS_ENUM(NSInteger, ZLSettingInfoToDefaultKeys) {
    
};

/**
 *  根据tag生成对应的key
 *
 *  @param defaultKey tag
 *
 *  @return 生成的key
 */
static inline NSString *ZLCommonKeyForTag(ZLSettingInfoToDefaultKeys defaultKey) {
    return [NSNumber numberWithInteger:defaultKey].stringValue;
}
/**
 *  获得某个设置属性的值
 *
 *  @param defaultKey 设置的标志位
 *
 *  @return 标志位信息
 */
static inline BOOL ZLCommonStatusForKey(NSString *defaultKey) {
    return [[NSUserDefaults standardUserDefaults] boolForKey:defaultKey];
}

/**
 *  返回保存在本地的数据
 *
 *  @param defaultKey 标志位
 *
 *  @return 查询到的结果
 */
static inline NSString *ZLCommonValueForKey(ZLSettingInfoToDefaultKeys defaultKey) {
    return [[NSUserDefaults standardUserDefaults] objectForKey:CommonKeyForTag(defaultKey)];
}

/**
 *  更新本地保存的数据信息
 *
 *  @param defaultKey 默认标志位
 *  @param value      保存在内容
 *
 *  @return N/A
 */
static inline void ZLCommonValueUpdateForKey(ZLSettingInfoToDefaultKeys defaultKey, NSString *value) {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:CommonKeyForTag(defaultKey)];
}

/**
 *  更新本地配置的数据
 *
 *  @param defaultKey 默认的配置的key
 *  @param value      配置结果
 *
 *  @return 无返回数据
 */
static inline void ZLCommonStatusUpdateForKey(NSString *defaultKey, BOOL value) {
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:defaultKey];
}

/**
 *  根据指定的故事版，读取其里面的某一个视图
 *
 *  @param storyboardName 故事版
 *  @param storyboardID   视图ID
 *
 *  @return 查询到的结果
 */
static inline UIViewController *ZLCommonViewControllerInStoryboardWithName(NSString *storyboardName, NSString *storyboardID) {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:storyboardID];
}

#endif
