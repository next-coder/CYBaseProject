//
//  BaseViewController.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var resignFirstResponderTap: UITapGestureRecognizer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // resign first responder gesture
    func setNeedsResignFirstResponderTapGesture() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.shouldResignFirstResponder(_:)))
        self.view.addGestureRecognizer(tap)
        self.resignFirstResponderTap = tap
    }
    
    func removeResignFirstResponderTap() {
        
        if let tap = self.resignFirstResponderTap {
            
            tap.removeTarget(self, action: #selector(BaseViewController.shouldResignFirstResponder(_:)))
            tap.delegate = nil
            self.view .removeGestureRecognizer(tap)
            self.resignFirstResponderTap = nil
        }
    }
    
    // event
    func shouldResignFirstResponder(sender: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
    }

}
