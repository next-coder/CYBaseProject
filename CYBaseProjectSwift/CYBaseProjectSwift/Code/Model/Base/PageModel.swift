//
//  PageModel.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

class PageModel: BaseModel {
    
    let pageIndex: Int
    let pageCount: Int
    let pageSize: Int
    let totalCount: Int
    
    override init(_ dic: Dictionary<String, AnyObject>) {
        
        if let pageIndex = dic["pageIndex"] as? Int {
            
            self.pageIndex = pageIndex
        } else {
            
            self.pageIndex = 0
        }
        
        if let pageCount = dic["pageCount"] as? Int {
            
            self.pageCount = pageCount
        } else {
            
            self.pageCount = 0
        }
        
        if let pageSize = dic["pageSize"] as? Int {
            
            self.pageSize = pageSize
        } else {
            
            self.pageSize = 0
        }
        
        if let totalCount = dic["totalCount"] as? Int {
            
            self.totalCount = totalCount
        } else {
            
            self.totalCount = 0
        }
        
        super.init(dic)
    }
    
    override class func modelFromDictionary(dic: Dictionary<String, AnyObject>) -> PageModel? {
        
        if dic.count <= 0 {
            
            return nil;
        }
        return PageModel(dic)
    }
}
