//
//  EUBaseModel.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    
    // subclass should rewrite this method for data
    init(_ dic: Dictionary<String, AnyObject>) {
        
    }
    
    // subclass also should rewrite this method, to return the actual type instance
    class func modelFromDictionary(dic: Dictionary<String, AnyObject>) -> BaseModel? {
        
        return BaseModel(dic)
    }
    
    class func modelArrayFromDictionaryArray(modelDicArray: Array<Dictionary<String, AnyObject>>) -> Array<BaseModel> {
        
        var modelArray = [BaseModel]();
        for value in modelDicArray {
            
            if let model = self.modelFromDictionary(value) {
                
                modelArray.append(model)
            }
        }
        
        return modelArray
    }
}
