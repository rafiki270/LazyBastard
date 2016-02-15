//
//  LABAddTaskTableViewCell.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import Foundation


class LABAddTaskTableViewCell : LABTaskTableViewCell {
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
    }
    
    // MARK: Creating elements
    
    private func configureColors() {
        self.contentView.backgroundColor = LABTheme.addTaskBackgroundColor()
        
        self.textLabel?.textColor = LABTheme.addTaskTextColor()
        self.detailTextLabel?.textColor = LABTheme.addTaskTextColor()
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureColors()
    }
    
    
}