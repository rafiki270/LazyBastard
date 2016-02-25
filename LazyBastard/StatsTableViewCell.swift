//
//  LABStatsView.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit
import IoniconsSwift


class StatsTableViewCell : BasicTableViewCell {
    
    let gradientLayer = CAGradientLayer()
    
    let dateLabel: UILabel = UILabel()
    let statsLabel: UILabel = UILabel()
    let messageLabel: UILabel = UILabel()
    
    var currentPoints: Int16 = 0
    
    
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
        
        // Message label
        messageLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.bottom.equalTo(-14)
            make.right.equalTo(-10)
            make.height.equalTo(22)
        }
    }
    
    // MARK: Creating elements
    
    private func configureBackground() {
        self.backgroundColor = UIColor(CGColor: Theme.statsGradientColors().last!)
        
//        gradientLayer.frame = self.bounds
//        
//        gradientLayer.colors = Theme.statsGradientColors()
//        gradientLayer.locations = [0.0, 200.0]
//        
//        self.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    private func createDateLabel() {
        dateLabel.backgroundColor = UIColor.clearColor()
        dateLabel.font = Theme.appFontWithSize(18.0)
        dateLabel.textColor = Theme.statsTextColor()
        dateLabel.textAlignment = NSTextAlignment.Center
        dateLabel.numberOfLines = 2
        
        self.addSubview(dateLabel)
    }
    
    private func createStatsLabel() {
        statsLabel.backgroundColor = UIColor.clearColor()
        statsLabel.font = Theme.appFontWithSize(85.0)
        statsLabel.textColor = Theme.statsTextColor()
        statsLabel.textAlignment = NSTextAlignment.Center
        statsLabel.numberOfLines = 2
        statsLabel.text = "0"
        
        self.addSubview(statsLabel)
    }
    
    private func createMessageLabel() {
        messageLabel.backgroundColor = UIColor.clearColor()
        messageLabel.font = Theme.appFontWithSize(18.0)
        messageLabel.textColor = Theme.statsTextColor()
        messageLabel.textAlignment = NSTextAlignment.Center
        
        self.addSubview(messageLabel)
    }
    
    private func createAccessoryView() {
        let button: UIButton = UIButton(frame: CGRectMake(0, 0, 44, 44))
        
        let img: UIImage = Ionicons.ArrowGraphUpRight.image(30, color: Theme.statsTextColor())
        button.setImage(img, forState: .Normal)
        self.accessoryView = button
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureBackground()
        self.createDateLabel()
        self.createStatsLabel()
        self.createMessageLabel()
        self.createAccessoryView()
    }
    
    // MARK: Settings
    
    private func daySuffix(date: NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()
        let dayOfMonth = calendar.component(.Day, fromDate: date)
        switch dayOfMonth {
        case 1: fallthrough
        case 21: fallthrough
        case 31: return "st"
        case 2: fallthrough
        case 22: return "nd"
        case 3: fallthrough
        case 23: return "rd"
        default: return "th"
        }
    }
    
    internal func updateScore(points: Int16) {
        self.currentPoints = points
        
        self.messageLabel.text = StagesOfLazy.pointsToString(points)
        let pointsString: String = String(points)
        let unitsString: String = NSLocalizedString("\npoints", comment: "points on a new line after a number")
        
        let atStr: NSMutableAttributedString = NSMutableAttributedString(string: pointsString + unitsString)
        atStr.addAttributes([NSFontAttributeName: statsLabel.font, NSForegroundColorAttributeName: statsLabel.textColor], range: NSRange.init(location: 0, length: pointsString.characters.count))
        atStr.addAttributes([NSFontAttributeName: Theme.appFontWithSize(17), NSForegroundColorAttributeName: statsLabel.textColor], range: NSRange.init(location: pointsString.characters.count, length: unitsString.characters.count))
        self.statsLabel.attributedText = atStr
        
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "EEE"
        let dayName: String = formatter.stringFromDate(NSDate()).uppercaseString
        
        formatter.dateFormat = "dd"
        let dayNumber: String = formatter.stringFromDate(NSDate())
        
        self.dateLabel.text = dayName + "\n" + dayNumber + self.daySuffix(NSDate())
    }
    
    internal func updateScoreFromNotification(notification: NSNotification) {
        if ((notification.object?.isKindOfClass(NSNumber)) != nil) {
            let object: NSNumber = notification.object! as! NSNumber
            let points: Int16 = (Int16(object.intValue) + self.currentPoints)
            self.updateScore(points)
        }
    }
    
    // MARK: Initialization
    
    override func setup() {
        super.setup()
        
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "updateScoreFromNotification:", name: CoreDataDidUpdateEvents, object: nil)
    }
    
    
}