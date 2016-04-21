//
//  PullRefreshHeaderView.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/19/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

enum PullRefreshHeaderState {
    
    case Idle
    case Pulling
    case WillRefresh
    case Refreshing
}

@objc protocol PullRefreshHeaderDelegate {
    
    optional func pullRefreshHeaderDidStartRefreshing(let refreshHeader: PullRefreshHeaderView)
}

class PullRefreshHeaderView: PullRefreshBaseView {
    
    weak var delegate: PullRefreshHeaderDelegate? = nil
    var refreshState: PullRefreshHeaderState = .Idle
    
    var refreshing: Bool {
        
        get {
            
            return (self.refreshState == .Refreshing)
        }
    }
    
    // remove from super to stop animating
    override func removeFromSuperview() {
        
        self.activityIndicatorView?.stopAnimating()
        super.removeFromSuperview()
    }
    
    // scroll view contentOffset changed, compute the pullrefresh state
    override func scrollContentOffsetChanged(from: CGPoint?, to: CGPoint?) {
        super.scrollContentOffsetChanged(from, to: to)
        
        if self.refreshState == .Refreshing {
            
            return
        }
        
        if self.scrollView == nil {
            
            return
        }
        
        let contentInset = self.scrollView!.contentInset
        if let toOffset = to {
            
            // pull refresh isn't visible
            if toOffset.y > contentInset.top {
                return
            }
            
            // reach the refresh offset Y
            let triggerOffsetY = contentInset.top - self.frame.size.height
            if self.scrollView!.dragging {
                
                if toOffset.y > triggerOffsetY {
                    
                    self.refreshState = .Pulling
                } else if toOffset.y <= triggerOffsetY {
                    
                    self.refreshState = .WillRefresh
                }
            } else if self.refreshState == .WillRefresh {
                
                self.beginRefreshing()
                if let delegate = self.delegate {
                    
                    delegate.pullRefreshHeaderDidStartRefreshing?(self)
                }
                
            } else {
                
                self.refreshState = .Idle
            }
        }
    }
    
    func beginRefreshing() {
        
        if !self.refreshing {
            
            self.refreshState = .Refreshing
            self.resetScrollContentInsetsToRefreshingAnimated(true)
        }
    }
    
    func endRefreshing() {
        
        if self.refreshing {
            
            self.refreshState = .Idle
            self.resetScrollContentInsetsToIdleAnimated(true)
        }
    }
    
    // reset content insets to refreshing state
    func resetScrollContentInsetsToRefreshingAnimated(animated: Bool) {
        
        if let scrollView = self.scrollView {
            
            if animated {
                
                UIView.animateWithDuration(0.3) {
                    
                    // reset to refreshing content inset, which show refresh header in scroll view
                    let originContentInset = scrollView.contentInset
                    let newContentInset = UIEdgeInsets(top: originContentInset.top + self.frame.size.height,
                                                       left: originContentInset.left,
                                                       bottom: originContentInset.bottom,
                                                       right: originContentInset.right)
                    scrollView.contentInset = newContentInset
                }
            } else {
                
                // reset to refreshing content inset, which show refresh header in scroll view
                let originContentInset = scrollView.contentInset
                let newContentInset = UIEdgeInsets(top: originContentInset.top + self.frame.size.height,
                                                   left: originContentInset.left,
                                                   bottom: originContentInset.bottom,
                                                   right: originContentInset.right)
                scrollView.contentInset = newContentInset
            }
        }
    }
    
    func resetScrollContentInsetsToIdleAnimated(animated: Bool) {
        
        if let scrollView = self.scrollView {
            
            if animated {
                
                UIView.animateWithDuration(0.3) {
                    
                    // reset to idle content inset, which hide refresh header in scroll view
                    let originContentInset = scrollView.contentInset
                    let newContentInset = UIEdgeInsets(top: originContentInset.top - self.frame.size.height,
                                                       left: originContentInset.left,
                                                       bottom: originContentInset.bottom,
                                                       right: originContentInset.right)
                    scrollView.contentInset = newContentInset
                }
            } else {
                
                // reset to idle content inset, which hide refresh header in scroll view
                let originContentInset = scrollView.contentInset
                let newContentInset = UIEdgeInsets(top: originContentInset.top - self.frame.size.height,
                                                   left: originContentInset.left,
                                                   bottom: originContentInset.bottom,
                                                   right: originContentInset.right)
                scrollView.contentInset = newContentInset
            }
        }
    }
}
