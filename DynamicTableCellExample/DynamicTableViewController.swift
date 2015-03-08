//
//  DynamicTableViewController.swift
//  DynamicTableCellExample
//
//  Created by Lin He on 3/6/15.
//  Copyright (c) 2015 Lin He. All rights reserved.
//

import UIKit

class DynamicTableViewController: UITableViewController {
  
  let sentences = ["This is a pre-release version of the complete Xcode developer toolset for Mac, iPhone, iPad, and Apple Watch. This release requires OS X Yosemite.","This release of Xcode includes the Xcode IDE, LLVM compiler, Instruments, iOS Simulator, the latest OS X and iOS SDKs, and the new Swift programming language.","Post questions and share comments","Sign in with your Apple ID to download previous versions of Xcode or additional tools from the developer downloads site.","When I was young, there was an amazing publication called The Whole Earth Catalog, which was one of the bibles of my generation. It was created by a fellow named Stewart Brand not far from here in Menlo Park","Don't be trapped by dogma — which is living with the results of other people's thinking.","The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it. And, like any great relationship, it just gets better and better as the years roll on. So keep looking. Don’t settle.","Stay hungry, stay foolish."]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.estimatedRowHeight = 100.0
    self.tableView.rowHeight = UITableViewAutomaticDimension // I thought this is the default
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
    cell.avatar.image = UIImage(named: "wk_red.png")
    
    return cell
  }
}
