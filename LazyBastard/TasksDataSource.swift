//
//  TasksDataSource.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


let TasksDataSourceTaskCellIdentifier = "taskCell"
let TasksDataSourceAddTaskCellIdentifier = "addTaskCell"
let TasksDataSourceStatsCellIdentifier = "statsCell"


class TasksDataSource : NSObject, UITableViewDataSource {
    
    
    internal var data: [LABTask]? = []
    
    
    // MARK: Public helper methods
    
    internal func reloadData() {
        data = CoreData.tasks()
    }
    
    internal func isTaskPath(indexPath: NSIndexPath) -> Bool {
        return (indexPath.row < (data?.count)!)
    }
    
    // MARK: Table view data source methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return ((data?.count)! + 1)
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return self.isTaskPath(indexPath)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return self.isTaskPath(indexPath)
    }
    
    private func statsCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: StatsTableViewCell = tableView.dequeueReusableCellWithIdentifier(TasksDataSourceStatsCellIdentifier) as! StatsTableViewCell
        
        let points: Int16 = CoreData.pointsForDate(NSDate())
        cell.updateScore(points)
        
        return cell
    }
    
    private func taskCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TaskTableViewCell = tableView.dequeueReusableCellWithIdentifier(TasksDataSourceTaskCellIdentifier) as! TaskTableViewCell
        
        let task: LABTask? = data![indexPath.row]
        cell.textLabel?.text = task?.task
        cell.detailTextLabel?.text = "TOMORROW!"
        
        return cell
    }
    
    private func addTaskCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: AddTaskTableViewCell = tableView.dequeueReusableCellWithIdentifier(TasksDataSourceAddTaskCellIdentifier) as! AddTaskTableViewCell
        
        cell.textLabel?.text = NSLocalizedString("Create new task", comment: "New task button title")
        cell.contentView.backgroundColor = Theme.addTaskBackgroundColor()
        cell.textLabel?.textColor = Theme.addTaskTextColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return self.statsCell(tableView, cellForRowAtIndexPath: indexPath)
        }
        else {
            if self.isTaskPath(indexPath) {
                return self.taskCell(tableView, cellForRowAtIndexPath: indexPath)
            }
            else {
                return self.addTaskCell(tableView, cellForRowAtIndexPath: indexPath)
            }
        }
    }
    
    
}