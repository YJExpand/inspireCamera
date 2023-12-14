//
//  ICNetworkManager.swift
//  inspireCamera
//
//  Created by Sir 姚 on 2023/12/8.
//

import Foundation
import Alamofire
import HandyJSON

/// 请求方式
enum RequestMethod : String {
    case GET
    case POST
}

typealias RequestSuccessBlock = (_ result: Any?) -> ()
typealias RequestFailBlock = (_ error: Error?) -> ()

class ICNetworkManager{
    static let `default` : ICNetworkManager = ICNetworkManager()
    
    /// 发起请求
    func request(method: RequestMethod, urlString: String, params: [String : Any]? = nil , successBlock: @escaping RequestSuccessBlock ,failBlock: @escaping RequestFailBlock){
        
        // 获取类型
        let requestMethod = conversionRequestMethod(method: method)
        
        // 发起请求
        AF.request(urlString,method: requestMethod,parameters: params).response { response in
            
            switch response.result {
                
            case .success(let success):
                guard let jsonData = success else { return }
                do {
                    let resultDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
                    let resultModel = ICResponeModel.deserialize(from: resultDict)
                    let code = resultModel?.code ?? 0
                    
                    if code == 200 {
                        // 成功回调
                        successBlock(resultModel?.data)
                    }else{
                        let error = NSError(domain: resultModel?.message ?? "请求失败", code: code)
                        failBlock(error)
                    }
                    
                } catch {
                    print("Error encoding or decoding: \(error)")
                    failBlock(error)
                }
               
            case .failure(let failure):
                print("error: \(failure.localizedDescription)")
                failBlock(failure.underlyingError)
            }
        }
    }
    
    
    // MARK: - private
    private func conversionRequestMethod(method: RequestMethod) -> HTTPMethod{
        switch method {
        case .GET:
            return HTTPMethod.get
        case .POST:
            return HTTPMethod.post
        }
    }
}
