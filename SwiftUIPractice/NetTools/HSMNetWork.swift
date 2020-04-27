//
//  HSMNetWork.swift
//  SchoolApp
//
//  Created by Mac on 2017/6/8.
//  Copyright © 2017年 QinL. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


///成功回调
public typealias SuccessedRelust = (_ tmp: JSON) -> Void
///失败回调
public typealias FailureRelust = (_ error: NSError?) -> Void

class HSMNetWork: NSObject {
    
    static let sessionManager:Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        //设置超时时间
        configuration.timeoutIntervalForRequest = 10
        return Alamofire.Session(configuration: configuration)
    }()
    
    /// 请求
    /// - Parameters:
    ///   - url: 服务器地址
    ///   - method: 请求方式
    ///   - parameters: 参数
    ///   - headers: 表头
    ///   - encoding: 编码
    ///   - often: 弹框提示是否启用、或者控制异常登录弹框提示内容
    ///   - successed: successed description
    ///   - failure: failure description
    class func HSRequestFromNetWithUrl(_ url: String, method: HTTPMethod = .get, parameters: [String : Any]?, headers: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default, often: Bool? = true, successed: @escaping SuccessedRelust, failure: @escaping FailureRelust) {
        _ = HSMNetWork.printUrl(url: url, parameters: parameters as AnyObject)
        sessionManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
            if response.error != nil, let value = response.value {
                let json = JSON(value)
                let tmp = JSON(parseJSON: json.rawString()!)
                printL("数据：", tmp)
            }else{
                failure(self.errorHandling(url, response))
            }
        }
    }
    
    /// 取消网络请求
    class func cancelNetworkRequests() {
        if #available(iOS 9.0, *) {
            sessionManager.session.getAllTasks { (tasks) in
                tasks.forEach({ (task) in
                    task.cancel()
                })
            }
        } else {
            // Fallback on earlier versions
        }
    }

    /// 错误处理
    class func errorHandling(_ url: String, _ e: AFDataResponse<Any>) -> NSError {
        let code = e.error?._code ?? 0
        let message = e.error?.localizedDescription ?? ""
        let error = self.getError(url, message, code)
        return error
    }
    
    class func errorAlert(_ code: Int, _ often: Bool, _ error: NSError) {

    }
    
    class func printUrl(url:String, parameters: AnyObject) ->String{
        var urlstr = url; var i = 0
        if parameters.allKeys != nil {
            urlstr = urlstr + "?"
            for dic in parameters.allKeys {
                if i == 0 {
                    i = i + 1
                    urlstr = urlstr+"\(dic)=\("\(parameters.object(forKey: dic)!)")"
                }else{
                    urlstr = urlstr+"&\(dic)=\("\(parameters.object(forKey: dic)!)")"
                }
            }
        }
        printL(parameters, isMethodName: false)
        printL("请求链接：",urlstr, isMethodName: false)
        return urlstr
    }
    
    class func getError(_ url: String, _ title: String? = "" ,_ code: Int? = 0, _ tmp: JSON? = nil, _ often: Bool? = true) ->NSError{
        /// 其他后台错误
        let otherE: Int = 3
        let title = tmp?["message"].string ?? title
        var codes = Int(tmp?["code"].string ?? "\(otherE)")
        codes = codes == otherE ? code : codes
        let errordic = NSMutableDictionary.init(object: title ?? "", forKey: NSLocalizedDescriptionKey as NSCopying)
        let error = NSError.init(domain: "CustomErrorDomain", code: codes ?? otherE, userInfo: errordic as! [AnyHashable: Any] as? [String : Any])
        printL("错误:",url,error,tmp ?? "", isMethodName: false)
        self.errorAlert(codes ?? otherE, often ?? true, error)
        return error
    }
}

/// 图片转Data有可能会为空，解决办法是把要转换的图片重新绘制下就行了
extension UIImage{
    //MARK:-----------图片转data-------------//
    func getData() -> Data{
        let data = self.getNewImage().jpegData(compressionQuality: 0.9)
        return data!
    }
    
    //MARK:-----------重新绘制一下图形-------------//
    fileprivate func getNewImage() -> UIImage{
        let w = self.size.width
        let h = self.size.height
        UIGraphicsBeginImageContext(self.size)
        self.draw(in: CGRect(x: 0, y: 0, width: w, height: h))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
