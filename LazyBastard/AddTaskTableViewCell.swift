//
//  AddTaskTableViewCell.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import Foundation
import IoniconsSwift


class AddTaskTableViewCell : BasicTableViewCell {
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
    }
    
    // MARK: Creating elements
    
    private func configureColors() {
        self.contentView.backgroundColor = Theme.addTaskBackgroundColor()
        
        self.textLabel?.textColor = Theme.addTaskTextColor()
        self.detailTextLabel?.textColor = Theme.addTaskTextColor()
        
        let image: UIImage = Ionicons.IosPlusOutline.image(35, color: Theme.addTaskTextColor())
        self.imageView?.image = image
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureColors()
    }
    
    
}