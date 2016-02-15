//
//  LABTasksDataSource.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


let LABTasksDataSourceTaskCellIdentifier = "taskCell"
let LABTasksDataSourceAddTaskCellIdentifier = "addTaskCell"


class LABTasksDataSource : NSObject, UITableViewDataSource {
    
    
    var data: [LABTask]? = []
    
    // MARK: Public helper methods
    
    internal func reloadData() {
        data = LABCoreData.tasks()
    }
    
    internal func isTaskPath(indexPath: NSIndexPath) -> Bool {
        return (indexPath.row < (data?.count)!)
    }
    
    // MARK: Table view data source methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((data?.count)! + 1)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.isTaskPath(indexPath)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.isTaskPath(indexPath)
    }
    
    func taskCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: LABTaskTableViewCell = tableView.dequeueReusableCellWithIdentifier(LABTasksDataSourceTaskCellIdentifier) as! LABTaskTableViewCell
        
        //var task: LABTask? = data![indexPath.row]
        
        cell.textLabel?.text = "My task number " + String(indexPath.row)
        cell.detailTextLabel?.text = "TOMORROW!"
        
        return cell
    }
    
    func addTaskCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: LABAddTaskTableViewCell = tableView.dequeueReusableCellWithIdentifier(LABTasksDataSourceAddTaskCellIdentifier) as! LABAddTaskTableViewCell
        
        cell.textLabel?.text = NSLocalizedString("Create new task", comment: "New task button title")
        cell.contentView.backgroundColor = LABTheme.addTaskBackgroundColor()
        cell.textLabel?.textColor = LABTheme.addTaskTextColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if self.isTaskPath(indexPath) {
            return self.taskCell(tableView, cellForRowAtIndexPath: indexPath)
        }
        else {
            return self.addTaskCell(tableView, cellForRowAtIndexPath: indexPath)
        }
    }
    
    
}