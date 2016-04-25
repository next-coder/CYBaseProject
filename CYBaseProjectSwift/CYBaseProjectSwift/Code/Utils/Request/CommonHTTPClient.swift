//
//  CommonHTTPClient.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit
import Alamofire

class CommonHTTPClient {
    
    class func request() {
        
        Alamofire.request(.POST, "http://180.76.162.250:8093/api/auser/login", parameters: [ "phone": "13000000001", "password": "bfdc153c0a635d3d49c082afeb4e0bba", "secret": "8d5bd7b456e5d83a58ab0eddbfda036b" ]).responseJSON { response in
            
            print(response.result)
            print(response.result.value)
        }
    }

}
