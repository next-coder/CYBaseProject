//
//  ResponseStatusModel.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

class ResponseStatusModel: BaseModel {

    let code: Int
    let msg: String?
    
    override init(_ dic: Dictionary<String, AnyObject>) {
        
        if let code = (dic["code"] as? Int) {
            
            self.code = code
        } else {
            
            self.code = -102938
        }
        if let msg = (dic["msg"] as? String) {
            
            self.msg = msg
        } else {
            
            self.msg = nil
        }
        
        super.init(dic)
    }
    
    override class func modelFromDictionary(dic: Dictionary<String, AnyObject>) -> ResponseStatusModel? {
        
        if dic.count <= 0 {
            
            return nil;
        }
        return ResponseStatusModel(dic)
    }
}
