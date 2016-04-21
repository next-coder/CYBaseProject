//
//  PullRefreshFooterView.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/19/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

@objc protocol PullRefreshFooterDelegate {
    
    optional func pullRefreshFooterDidStartLoadMore(let footerView: PullRefreshFooterView)
}

enum PullRefreshFooterState {
    
    case Idle
    case Loading
    case AllLoaded
}

class PullRefreshFooterView: PullRefreshBaseView {
    
    weak var delegate: PullRefreshFooterDelegate? = nil
    var loadMoreState: PullRefreshFooterState = .Idle
    var loading: Bool {
        
        get {
            
            return (self.loadMoreState == .Loading)
        }
    }

    override init(frame: CGRect, scrollView: UIScrollView?) {
        super.init(frame: frame, scrollView: scrollView)
        
        if let scroll = scrollView {
            
            let originInsets = scroll.contentInset
            scroll.contentInset = UIEdgeInsets(top: originInsets.top,
                                               left: originInsets.left,
                                               bottom: originInsets.bottom + frame.size.height,
                                               right: originInsets.right)
            
            scroll.addObserver(self,
                               forKeyPath: "contentSize",
                               options: [.Old, .New],
                               context: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        
        if let scroll = self.scrollView {
            
            scroll.removeObserver(self, forKeyPath: "contentSize")
        }
    }
    
    override func releaseResources() {
        
        if let scroll = self.scrollView {
            
            scroll.removeObserver(self, forKeyPath: "contentSize")
        }
        super.releaseResources()
    }
    
    // scroll view contentOffset changed, compute load more state
    override func scrollContentOffsetChanged(from: CGPoint?, to: CGPoint?) {
        
        if self.loadMoreState == .Loading
            || self.loadMoreState == .AllLoaded {
            
            return
        }
        
        if let scroll = self.scrollView {
            
            let loadMoreMinOffsetY = scroll.contentSize.height + scroll.contentInset.bottom + self.frame.size.height - scroll.frame.size.height
            
            if let toOffset = to {
                
                if self.loadMoreState == .Idle
                    && toOffset.y >= loadMoreMinOffsetY {
                    
                    self.loadMoreState = .Loading
                    
                    if let delegate = self.delegate {
                        
                        delegate.pullRefreshFooterDidStartLoadMore?(self)
                    }
                }
            }
        }
    }
    
    func beginLoadMore() {
        
        if let scroll = self.scrollView {
            
            let loadMoreMinOffsetY = scroll.contentSize.height + scroll.contentInset.bottom + self.frame.size.height - scroll.frame.size.height
            scroll.setContentOffset(CGPoint(x: scroll.contentOffset.x,
                                            y: loadMoreMinOffsetY),
                                    animated: true)
        }
    }
    
    func endLoadMore() {
        
        self.loadMoreState = .Idle
    }
    
    func stopLoadMore() {
        
        if self.loadMoreState != .AllLoaded {
            
            self.loadMoreState = .AllLoaded;
            self.hidden = true
            self.activityIndicatorView?.stopAnimating()
            
            if let scroll = scrollView {
                
                let originInsets = scroll.contentInset
                scroll.contentInset = UIEdgeInsets(top: originInsets.top,
                                                   left: originInsets.left,
                                                   bottom: originInsets.bottom - frame.size.height,
                                                   right: originInsets.right)
            }
        }
    }
    
    func resumeLoadMore() {
        
        if self.loadMoreState == .AllLoaded {
            
            self.loadMoreState = .Idle;
            self.hidden = false
            self.activityIndicatorView?.startAnimating()
            
            if let scroll = scrollView {
                
                let originInsets = scroll.contentInset
                scroll.contentInset = UIEdgeInsets(top: originInsets.top,
                                                   left: originInsets.left,
                                                   bottom: originInsets.bottom + frame.size.height,
                                                   right: originInsets.right)
            }
        }
    }
    
    // observe
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if let key = keyPath where key == "contentSize" {
            
            let contentSizeOption = change?[NSKeyValueChangeNewKey]?.CGSizeValue()
            
            if let contentSize = contentSizeOption {
                
                self.center = CGPoint(x: self.center.x,
                                      y: contentSize.height + self.frame.size.height / 2.0)
            }
        } else {
            
            super.observeValueForKeyPath(keyPath,
                                         ofObject: object,
                                         change: change,
                                         context: context)
        }
    }

}
