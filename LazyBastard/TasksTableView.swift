//
//  LABTasksTableView.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 11/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class TasksTableView : BasicTableView {
    
    
    // MARK: Initialization
    
    override func setup() {
        super.setup()
        
        self.backgroundColor = UIColor.clearColor()
        
        self.registerClass(StatsTableViewCell.self, forCellReuseIdentifier: TasksDataSourceStatsCellIdentifier)
        self.registerClass(TaskTableViewCell.self, forCellReuseIdentifier: TasksDataSourceTaskCellIdentifier)
        self.registerClass(AddTaskTableViewCell.self, forCellReuseIdentifier: TasksDataSourceAddTaskCellIdentifier)
        
        self.separatorColor = UIColor.clearColor()
        self.separatorStyle = .None
    }
    
    
}