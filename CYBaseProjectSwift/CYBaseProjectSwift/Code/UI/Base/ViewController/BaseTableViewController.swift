//
//  BaseTableViewController.swift
//  CYBaseProjectSwift
//
//  Created by HuangQiSheng on 4/18/16.
//  Copyright © 2016 Jasper. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var tableViewStyle: UITableViewStyle
    
    var refreshHeaderView: PullRefreshHeaderView? = nil
    var refreshFooterView: PullRefreshFooterView? = nil
    
    init(style: UITableViewStyle) {
        self.tableViewStyle = style
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.tableViewStyle = .Plain
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        super.loadView()
        
        self.tableView = UITableView(frame: self.view.bounds, style: self.tableViewStyle)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func addPullRefresh() {
        
        if let table = self.tableView {
            let refreshHeader = PullRefreshHeaderView(frame: CGRect(x: 0,
                                                                    y: -table.contentInset.top - 45,
                                                                    width: table.frame.size.width,
                                                                    height: 45),
                                                      scrollView: table)
            table.addSubview(refreshHeader)
            self.refreshHeaderView = refreshHeader
        }
    }
    
    func addLoadMore() {
        
        if let table = self.tableView {
            
            let refreshFooter = PullRefreshFooterView(frame: CGRect(x: 0,
                                                                    y: table.contentSize.height,
                                                                    width: table.frame.size.width,
                                                                    height: 45),
                                                      scrollView: table)
            table.addSubview(refreshFooter)
            self.refreshFooterView = refreshFooter
        }
    }
    
    // UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CellIdentifier")
    }
    
    // UITableViewDelegate
    

}
