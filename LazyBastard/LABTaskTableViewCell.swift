//
//  LABTaskTableViewCell.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class LABTaskTableViewCell : LABTableViewCell {
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
    }
    
    // MARK: Creating elements
    
    private func configureColors() {
        self.contentView.backgroundColor = LABTheme.tasksBackgroundColor()
        
        self.textLabel?.textColor = LABTheme.tasksTextColor()
        self.textLabel?.numberOfLines = 3
        
        self.detailTextLabel?.textColor = LABTheme.tasksTextColor()
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureColors()
    }
        
    
}