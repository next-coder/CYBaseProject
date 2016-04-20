//
//  PullRefreshBaseView.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

class PullRefreshBaseView: UIView {

    let activityIndicatorView: UIActivityIndicatorView?
    weak var scrollView: UIScrollView?
    
    init(frame: CGRect, scrollView: UIScrollView?) {
        
        self.scrollView = scrollView
        
        let indicator = UIActivityIndicatorView()
        indicator.autoresizingMask = [.FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleBottomMargin, .FlexibleRightMargin]
        self.activityIndicatorView = indicator
        
        super.init(frame: frame)
        
        self.addSubview(self.activityIndicatorView!)
        indicator.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0)
        self.scrollView?.addObserver(self, forKeyPath: "contentOffset", options: [.New, .Old], context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.activityIndicatorView = nil
        super.init(coder: aDecoder)
    }
    
    deinit {
        
        if let scrollView = self.scrollView {
            
            scrollView.removeObserver(self, forKeyPath: "contentOffset")
            self.scrollView = nil
        }
    }
    
    func releaseResources() {
        
        if let scrollView = self.scrollView {
            
            scrollView.removeObserver(self, forKeyPath: "contentOffset")
            self.scrollView = nil
        }
    }
    
    
    // observe scrollView's contentOffset, for showing pull refresh or load more
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if let key = keyPath {
            if key == "contentOffset" {
                
                let oldValue = change?[NSKeyValueChangeOldKey]?.CGPointValue()
                let newValue = change?[NSKeyValueChangeNewKey]?.CGPointValue()
                
                self.scrollContentOffsetChanged(oldValue, to: newValue)
            }
        }
        
        super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
    }
    
    func scrollContentOffsetChanged(from: CGPoint?, to: CGPoint?) {
        
        
    }

}
