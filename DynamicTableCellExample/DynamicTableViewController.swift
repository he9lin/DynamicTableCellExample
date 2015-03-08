//
//  DynamicTableViewController.swift
//  DynamicTableCellExample
//
//  Created by Lin He on 3/6/15.
//  Copyright (c) 2015 Lin He. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

typealias JSON = AnyObject
typealias JSONDictionary = Dictionary<String, JSON>
typealias JSONArray = Array<JSON>

func toJSONDictionary(object: JSON) -> JSONDictionary? {
  return object as? JSONDictionary
}

func toJSONArray(object: JSON) -> JSONArray? {
  return object as? JSONArray
}

class DynamicTableViewController: UITableViewController {
  let url = "https://gist.githubusercontent.com/he9lin/f5cc7844c759a606ab16/raw/1ef110db81cfd8c7db7c2a8601ada71f768ed00e/sentences.json"

  var messages: Array<String> = [] {
    didSet {
      self.tableView.reloadData()
    }
  }
  
  func reloadMessages() {
    MBProgressHUD.showHUDAddedTo(view, animated:true)
    Alamofire.request(.GET, url).responseJSON { (_, _, json, _) in
      MBProgressHUD.hideHUDForView(self.view, animated: true)
      if let content = json
        >>> toJSONDictionary
        >>> { $0["sentences"] }
        >>> toJSONArray {
          self.messages = content.map { $0 as! String }
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var refresher = UIRefreshControl()
    refresher.addTarget(self,
      action: "handleRefresh:",
      forControlEvents: UIControlEvents.ValueChanged)
    refreshControl = refresher
    
    self.tableView.estimatedRowHeight = 99.0
    self.tableView.rowHeight = UITableViewAutomaticDimension
    
    reloadMessages()
  }
  
  @IBAction func handleRefresh(sender: AnyObject?) {
    reloadMessages()
    refreshControl!.endRefreshing()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomTableViewCell
      
    cell.title.text   = "title"
    cell.content.text = messages[indexPath.row]
    cell.avatar.image = UIImage(named: "wk_red.png")
    
    return cell
  }
}
