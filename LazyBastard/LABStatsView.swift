//
//  LABStatsView.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class LABStatsView : LABView {
    
    let gradientLayer = CAGradientLayer()
    
    let dateLabel: UILabel = UILabel()
    let statsLabel: UILabel = UILabel()
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        // Date label
        dateLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.centerY.equalTo(self.snp_centerY)
            make.width.height.equalTo(50)
        }
        
        // Stats label
        statsLabel.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
    }
    
    // MARK: Creating elements
    
    private func configureBackground() {
        self.backgroundColor = UIColor(CGColor: LABTheme.statsGradientColors().last!)
        
        gradientLayer.frame = self.bounds
        
        gradientLayer.colors = LABTheme.statsGradientColors()
        gradientLayer.locations = [0.0, 200.0]
        
        self.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    private func createDateLabel() {
        dateLabel.backgroundColor = UIColor.clearColor()
        dateLabel.font = LABTheme.appBoldFontWithSize(12.0)
        dateLabel.textColor = LABTheme.statsTextColor()
        dateLabel.textAlignment = NSTextAlignment.Center
        dateLabel.numberOfLines = 2
        dateLabel.text = "FRI\n12th"
        
        self.addSubview(dateLabel)
    }
    
    private func createStatsLabel() {
        statsLabel.backgroundColor = UIColor.clearColor()
        statsLabel.font = LABTheme.appFontWithSize(85.0)
        statsLabel.textColor = LABTheme.statsTextColor()
        statsLabel.textAlignment = NSTextAlignment.Center
        statsLabel.text = "0"
        
        self.addSubview(statsLabel)
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureBackground()
        self.createDateLabel()
        self.createStatsLabel()
    }
    
    
}