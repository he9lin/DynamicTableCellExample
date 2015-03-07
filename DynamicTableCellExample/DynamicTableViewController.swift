//
//  DynamicTableViewController.swift
//  DynamicTableCellExample
//
//  Created by Lin He on 3/6/15.
//  Copyright (c) 2015 Lin He. All rights reserved.
//

import UIKit

class DynamicTableViewController: UITableViewController {
  
  var customCell: CustomTableViewCell?
  
  let sentences = ["This is a pre-release version of the complete Xcode developer toolset for Mac, iPhone, iPad, and Apple Watch. This release requires OS X Yosemite.","This release of Xcode includes the Xcode IDE, LLVM compiler, Instruments, iOS Simulator, the latest OS X and iOS SDKs, and the new Swift programming language.","Post questions and share comments","Sign in with your Apple ID to download previous versions of Xcode or additional tools from the developer downloads site."]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.estimatedRowHeight = 100.0
    self.tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    tableView.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sentences.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomTableViewCell
    
    cell.title.text   = "title"
    cell.content.text = sentences[indexPath.row]
    
    return cell
  }
}
