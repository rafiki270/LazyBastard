//
//  AddTaskTableViewCell.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import Foundation


class AddTaskTableViewCell : TaskTableViewCell {
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
    }
    
    // MARK: Creating elements
    
    private func configureColors() {
        self.contentView.backgroundColor = Theme.addTaskBackgroundColor()
        
        self.textLabel?.textColor = Theme.addTaskTextColor()
        self.detailTextLabel?.textColor = Theme.addTaskTextColor()
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureColors()
    }
    
    
}