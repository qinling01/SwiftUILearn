//
//  Define.swift
//  SchoolApp
//
//  Created by mac on 17/2/24.
//  Copyright © 2017年 QinL. All rights reserved.
//

import UIKit

/// appdelegate
let appdelegate = UIApplication.shared.delegate as! AppDelegate
public let Swindow = UIApplication.shared.delegate?.window
public let Sbounds = UIScreen.main.bounds
public let Swidth = UIScreen.main.bounds.width
public let Sheight = UIScreen.main.bounds.height

/// 除去导航栏页面高度
public let SheightWithin = Sheight-SafeAreaNavHeight
/// 导航栏高度
public let SafeAreaNavHeight: CGFloat = UIDevice.current.isiPhoneXMore() ? 88.0 : 64.0
/// 状态栏高度
public let SafeAreaNavHeightTop: CGFloat = UIDevice.current.isiPhoneXMore() ? 44.0 : 20.0
/// 底部距边高度（iPhoneX）
public let SafeAreaBottomHeight: CGFloat = UIDevice.current.isiPhoneXMore() ? 34.0 : 0.0
/// 工具栏高度
public let SafeAreaTabBarHeight: CGFloat = UIDevice.current.isiPhoneXMore() ? 83.0 : 49.0

//封装的日志输出功能（T表示不指定日志信息参数类型）
public func printL(_ items: Any..., methodName: String = #function, lineNumber: Int = #line, isMethodName: Bool = true) {
    //s文件名、方法、行号、打印信息
    #if DEBUG
    if isMethodName {
        print(NSDate().addingTimeInterval(28800)," | ","\(methodName) | 行:\(lineNumber) | 日志:",items,"\n");
    }else{
        print(NSDate().addingTimeInterval(28800)," | 日志:",items,"\n");
    }
    #endif
}
/// 默认图标
public let DefalutChart: UIImage = UIImage(named: "defaultChart")!
/// 默认头像
public let DefalutHead: UIImage = UIImage(named: "defaultHead")!

/// Identifier
public let CFBundleIdentifier = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
/// 版本号
public let CFBundleVersionNumber = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
/// 设备的IDFV
public let IDFV = UIDevice.current.identifierForVendor?.uuidString

/// 公钥
public let RSA_Public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDACwPDxYycdCiNeblZa9LjvDzbiZU1vc9gKRcG/pGjZ/DJkI4HmoUE2r/o6SfB5az3s+H5JDzmOMVQ63hD7LZQGR4k3iYWnCg3UpQZkZEtFtXBXsQHjKVJqCiEtK+gtxz4WnriDjf+e/CxJ7OD03e7sy5NY/akVmYNtghKZzz6jwIDAQAB"
/// 私钥
public let RSA_Privite_key = "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALUPuqBiS+1YbK/Rcm+cVkpQwl9SXNBTGvxhi8kWBIL9AFlouREZsF+WfG0Ii796kTiOXxaVEa0zLjFMuAn/jobRZckEhE9zJAOeSyAvU8qQGFYIKjuHR9RxHCzrecVEDWDUbALlGJxZdp7a0/hojzVZfnbfoWgm4khcrYQa76WVAgMBAAECgYEAmc0wpMia4pR4TqlF4hUVH6+WTM5z1OqjQ7vAuCGh13r+bvSMMEB4F9qG+z+FJjQBY99cWpxqFYwiMvKOar/Q2ro4ge+EdcisU0k5WXXubUpol743H/KJpnd8kCWFk9pNiLuOl7qiJlTkB5KivvX2JxDtmvRO02oFfLXgAX+y00ECQQDl/iiVb6fLJhrf9FDbzvk3qRB7eruApkGr0DYS+TDyq72GSnkHEfj5EuB23NaeChyCJJtH09euSaIHw/chnKlpAkEAyYkabsZ+CyUPquJop1UD2hFStPI+DDvniz19YTxzUcU/Fs38kTsoew82IhEm/k2rvaRkKRJLknHvm4h/PnwJTQJBALebKgz6YSrFlcjaAz8nQT+VIUpiVZPDpkOiabjF5LSmNBwkEfB6AZfd4QIjFNZ/3fhrfuddkB5cPBUU9ZKIvZkCQQCR3cPd7ZiI5HgkjN6GTkgNa4BbKwGxxSHfa8/1stUcmBEDpm9phlHUT7w0iAmbAgiNqBA+kdlU01ZDUlYWmZv5AkAhtORzWYq16KyHfM+7kgxniufX7dBcIWh4MOStl1q5OALrfsenzrf8Yzl5ss9JmmXZFuq2Am0fy9Sv6VjG7WrE"




