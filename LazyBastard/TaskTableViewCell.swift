//
//  TaskTableViewCell.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class TaskTableViewCell : BasicTableViewCell {
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
    }
    
    // MARK: Creating elements
    
    private func configureColors() {
        self.contentView.backgroundColor = Theme.tasksBackgroundColor()
        
        self.textLabel?.textColor = Theme.tasksTextColor()
        self.textLabel?.numberOfLines = 3
        
        self.detailTextLabel?.textColor = Theme.tasksTextColor()
        
        
    }
    
    override func setup() {
        super.setup()
        
        self.configureColors()
    }
        
    
}