//
//  CommonHTTPClient.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit
import Alamofire

typealias ResponseCompletion = ([String: AnyObject]?, NSError?) -> Void
typealias ResponseWithFileUrlCompletion = ([String: AnyObject]?, String?, NSError?) -> Void
typealias RequestProgress = (Int64, Int64, Int64) -> Void

class CommonHTTPClient {
    
    class func request() {
        
        Alamofire.request(.POST, "http://180.76.162.250:8093/api/auser/login", parameters: [ "phone": "13000000001", "password": "bfdc153c0a635d3d49c082afeb4e0bba", "secret": "8d5bd7b456e5d83a58ab0eddbfda036b" ]).responseJSON { response in
            
            print(response.result)
            print(response.result.value)
        }
    }
    
    class func sendAsynPOSTJSONResponseRequest(baseUrl baseUrl: String,
                                                       path: String?,
                                                       parameters: [String: AnyObject]? = nil,
                                                       completion: ResponseCompletion) {
        
        var urlString = baseUrl;
        if let pathString = path {
            
            urlString = urlString.stringByAppendingPathComponent(pathString)
        }
        
        Alamofire.request(.POST, urlString, parameters: parameters).responseJSON {
            response in
            
            completion(response.result.value as? [String: AnyObject], response.result.error)
        }
    }
    
    class func sendAsynGETJSONResponseRequest(baseUrl baseUrl: String,
                                                      path: String?,
                                                      parameters: [String: AnyObject]? = nil,
                                                      completion: ResponseCompletion) {
        
        var urlString = baseUrl;
        if let pathString = path {
            
            urlString = urlString.stringByAppendingPathComponent(pathString)
        }
        
        Alamofire.request(.GET, urlString, parameters: parameters).responseJSON {
            response in
            
            completion(response.result.value as? [String: AnyObject], response.result.error)
        }
    }
    
    /**
     
     the progress closure returns the bytes written, total bytes written, and total bytes expected
     to write.
     
     */
    class func sendAsynUploadJSONResponseRequest(baseUrl baseUrl: String,
                                                         path: String?,
                                                         fileData: NSData,
                                                         parameters: [String: AnyObject]? = nil,
                                                         progress: RequestProgress? = nil,
                                                         completion: ResponseCompletion) {
        
        let urlString = self.requestUrlString(baseUrl, path: path)
        
        Alamofire.request(.POST, urlString, parameters: parameters)
            .progress(progress)
            .responseJSON(completionHandler: {
            response in
            
            completion(response.result.value as? [String: AnyObject], response.result.error)
        })
    }
    
    class func sendAsynDownloadJSONResponseRequest(baseUrl baseUrl: String,
                                                           path: String?,
                                                           parameters: [String: AnyObject]? = nil,
                                                           progress: RequestProgress? = nil,
                                                           completion: ResponseWithFileUrlCompletion) {
        
        let urlString = self.requestUrlString(baseUrl, path: path)
        
        let fileUrl = self.defaultDownloadFileUrl
        let request = Alamofire.download(.POST, urlString, parameters: parameters) { (requestUrl, response) -> NSURL in
            
            return NSURL.fileURLWithPath(fileUrl)
        }
        
        request.progress(progress)
        request.responseJSON { response in
            
            completion(response.result.value as? [String: AnyObject], fileUrl, response.result.error)
        }
    }
    
    class func requestUrlString(baseUrl: String, path: String?) -> String {
        
        var urlString = baseUrl;
        if let pathString = path {
            
            urlString = urlString.stringByAppendingPathComponent(pathString)
        }
        
        return urlString
    }
    
    static var startIndex = 0
    static let fileNamePrefix = "common_http_download_file"
    
    class var defaultDownloadFileUrl: String {
        
        get {
            
            let urlPrefix = NSTemporaryDirectory().stringByAppendingPathComponent(fileNamePrefix)
            var fileUrl = urlPrefix.stringByAppendingFormat("%d", startIndex)
            while NSFileManager.defaultManager().fileExistsAtPath(fileUrl) {
                
                startIndex += 1
                fileUrl = urlPrefix.stringByAppendingFormat("%d", startIndex)
            }
            
            startIndex += 1
            
            return fileUrl
        }
    }

}
