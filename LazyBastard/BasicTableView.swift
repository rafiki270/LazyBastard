//
//  BasicTableView.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 24/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class BasicTableView: UITableView {
    
    
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
        self.init(frame: CGRect.zero, style: UITableViewStyle.Plain)
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.addSubviews()
        self.layoutSubviews()
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
}
