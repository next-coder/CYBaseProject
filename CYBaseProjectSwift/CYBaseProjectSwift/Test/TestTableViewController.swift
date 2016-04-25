//
//  TestTableViewController.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/19/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit
import MBProgressHUD

class TestTableViewController: BaseTableViewController {
    
    var datas: Array<String>? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datas = ["bbbb", "cccc", "dddd", "eee", "ffff", "gggg", "hhhhhh", "iiiiii", "jjjjj", "kkkkk", "lllll", "mmmmmm", "nnnnn", "hahaha"]

        self.addLoadMore()
        self.addPullRefresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let datas = self.datas {
            
            return datas.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        if cell == nil {
            
            cell = UITableViewCell(style: .Default, reuseIdentifier: "UITableViewCell")
//            cell!.textLabel?.backgroundColor = UIColor.colorFromHexString("#ff0000")
        }
        
        cell!.textLabel?.text = self.datas?[indexPath.row]
        cell!.contentView.backgroundColor = UIColor.colorFromHexString("ff0000")
        
        return cell!
    }
    
    // PullRefreshHeaderDelegate
    func pullRefreshHeaderDidStartRefreshing(refreshHeader: PullRefreshHeaderView) {
        
        if let _ = self.datas {
            
//            self.datas?.appendContentsOf(["hahahahah", "ahhfhfhd", "fdasfsafsdaf", "ddddddd"])
            self.datas!.insertContentsOf(["hahahahah", "ahhfhfhd", "fdasfsafsdaf", "ddddddd"], at: 0)
        } else {
            
            self.datas = ["bbbb", "cccc", "dddd", "eee", "ffff", "gggg", "hhhhhh", "iiiiii", "jjjjj", "kkkkk", "lllll", "mmmmmm", "nnnnn", "hahaha"]
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(NSEC_PER_SEC * 3)), dispatch_get_main_queue()) { 
            
            self.refreshHeaderView?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    // PullRefreshFooterDelegate
    func pullRefreshFooterDidStartLoadMore(footerView: PullRefreshFooterView) {
        
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(NSEC_PER_SEC * 3)), dispatch_get_main_queue()) {
            
            hud.hide(true)
            if let _ = self.datas {
                
                //            self.datas?.appendContentsOf(["hahahahah", "ahhfhfhd", "fdasfsafsdaf", "ddddddd"])
                self.datas!.appendContentsOf(["hahahahah", "ahhfhfhd", "fdasfsafsdaf", "ddddddd"])
            } else {
                
                self.datas = ["bbbb", "cccc", "dddd", "eee", "ffff", "gggg", "hhhhhh", "iiiiii", "jjjjj", "kkkkk", "lllll", "mmmmmm", "nnnnn", "hahaha"]
            }
            self.refreshFooterView?.endLoadMore()
            self.tableView.reloadData()
        }
    }
}
