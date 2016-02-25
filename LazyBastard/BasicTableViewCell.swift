//
//  BasicTableViewCell.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class BasicTableViewCell : UITableViewCell {
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
    }
    
    // MARK: Creating elements
    
    func addSubviews() {
        
    }
    
    // MARK: Initialization
    
    func setup() {
        
    }
    
    convenience init() {
        self.init(frame:CGRect.zero)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
        self.addSubviews()
        self.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
}