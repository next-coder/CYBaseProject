//
//  EUBaseService.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

class BaseService: NSObject {
    
    class func commonParameters() -> Dictionary<String, String> {
        
        return [String: String]()
    }
    
    class func checkResponse(response: Dictionary<String, AnyObject>) -> ResponseStatusModel {
        
        var responseStatus: ResponseStatusModel
        if (response.count <= 0) {
            
            responseStatus = ResponseStatusModel([ "code": -2321, "msg": "网络错误".localizedStringForInternational("") ])
        } else {
            
            responseStatus = ResponseStatusModel(response)
        }
        
        return responseStatus
    }

}
