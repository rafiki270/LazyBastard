//
//  DialogView.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 25/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class DialogView : UIView {
    
    static let sharedInstance: DialogView = DialogView()
    
    private var buttons: [DialogButton] = [DialogButton]()
    private var activeController: UIViewController? = nil
    
    internal var canvasView: UIView = UIView()
    internal var curtainView: DialogCurtainView = DialogCurtainView()
    
    
    // MARK: Presenting view
    
    internal func showInController(controller: UIViewController, animated: Bool = true) {
        activeController = controller
        
        // Add to the controlled hidden
        self.hide()
        activeController?.view .addSubview(self)
        
        // Setup self autolayout
        self.snp_makeConstraints { (make) -> Void in
            self.snp_makeConstraints(closure: { (make) -> Void in
                make.edges.equalTo(self)
            })
        }
    }
    
    internal func hide(animated: Bool) {
        if animated == true {
            UIView.animateWithDuration(0.3, delay: 0.0, options: .BeginFromCurrentState, animations: { () -> Void in
                self.curtainView.alpha = 0;
                }, completion: { (completed: Bool) -> Void in
                    self.curtainView.hidden = true
                }
            )
        }
        else {
            self.hide()
        }
    }
    
    internal func hide() {
        curtainView.alpha = 0;
        curtainView.hidden = true
    }
    
    // MARK: Configuring view
    
    internal func addButton(button: DialogButton) {
        buttons.append(button)
    }
    
    internal func addButton(title: String, textColor: UIColor = UIColor.whiteColor(), backgroundColor: UIColor = UIColor.grayColor(), highlightedBackgroundColor: UIColor = UIColor.lightGrayColor(), cornerRadius: CGFloat = 4) -> DialogButton {
        let button: DialogButton = DialogButton()
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(textColor, forState: .Normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
        
        self.addButton(button)
        
        return button
    }
    
    internal func addButton(title: String, type: Int = 0) -> DialogButton {
        var textColor: UIColor?
        var backgroundColor: UIColor?
        var highlightedBackgroundColor: UIColor?
        
        switch (type) {
        default:
            textColor = UIColor.whiteColor()
            backgroundColor = UIColor.lightGrayColor()
            highlightedBackgroundColor = UIColor.lightGrayColor()
        }
        
        return self.addButton(title, textColor: textColor!, backgroundColor: backgroundColor!, highlightedBackgroundColor: highlightedBackgroundColor!)
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // MARK: Curtain
        self.curtainView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
        
    }
    
    // MARK: Creating elements
    
    private func addCurtainView() {
        self.addSubview(curtainView)
    }
    
    private func addSubviews() {
        self.addCurtainView()
    }
    
    // MARK: Actions

    // MARK: Initialization
    
    convenience init() {
        self.init(frame:CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
        self.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
}


class DialogCurtainView : UIView {
    
    // MARK: Initialization
    
    convenience init() {
        self.init(frame:CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
}


class DialogButton : UIButton {
    
}
