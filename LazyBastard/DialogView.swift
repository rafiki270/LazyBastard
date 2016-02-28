//
//  DialogView.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 25/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


public enum DialogButtonType {
    case Default
    case Destruct
    case Accept
    case Done
}


public class DialogView : UIView {
    
    
    // MARK Configuration
    
    public var tapOnCurtainClosesDialog: Bool = true
    
    public var canvasView: UIView = UIView()
    public var curtainView: DialogCurtainView = DialogCurtainView()
    
    public var animationDuration: NSTimeInterval = 0.2
    
    
    // MARK: Private variables
    
    private var title: String?
    private var titleAttributes: [String: AnyObject]?
    
    private var message: String?
    private var messageAttributes: [String: AnyObject]?
    
    private var buttons: [DialogButton] = [DialogButton]()
    private var activeController: UIViewController? = nil
    
    
    // MARK: Presenting view
    
    public func showInController(controller: UIViewController, animated: Bool = true) {
        activeController = controller
        
        // Add to the controller hidden
        self.hide()
        activeController?.view.addSubview(self)
        
        // Setup self autolayout
        self.snp_makeConstraints { (make) -> Void in
             make.edges.equalTo(self.superview!)
        }
        
        if title != nil && title?.characters.count > 0 {
            let titleLabel: UILabel = self.label(title!, attributes: titleAttributes, bold: true)
            self.canvasView.addSubview(titleLabel)
            
            titleLabel.snp_makeConstraints{ (make) -> Void in
                make.left.top.equalTo(20)
                make.right.equalTo(-20)
                make.height.equalTo(60)
            }
        }
        
        // Show views
        curtainView.hidden = false
        canvasView.hidden = false
        
        UIView.animateWithDuration(self.animationDuration, delay: 0.0, options: .BeginFromCurrentState, animations: { () -> Void in
            self.curtainView.alpha = 1
            self.canvasView.alpha = 1
            }) { (completed: Bool) -> Void in
                
        }
    }
    
    public func hide(animated: Bool) {
        if animated == true {
            UIView.animateWithDuration(self.animationDuration, delay: 0.0, options: .BeginFromCurrentState, animations: { () -> Void in
                self.curtainView.alpha = 0;
                self.canvasView.alpha = 0;
                }, completion: { (completed: Bool) -> Void in
                    self.curtainView.hidden = true
                    self.canvasView.hidden = true
                    self.removeFromSuperview()
                }
            )
        }
        else {
            self.hide()
        }
    }
    
    public func hide() {
        curtainView.alpha = 0;
        canvasView.alpha = 0;
        curtainView.hidden = true
        canvasView.hidden = true
        self.removeFromSuperview()
    }
    
    // MARK: Configuring view
    
    public func addTitle(title: String) {
        
    }
    
    public func addButton(button: DialogButton) {
        buttons.append(button)
        canvasView.addSubview(button)
    }
    
    public func addButton(title: String, textColor: UIColor = UIColor.whiteColor(), backgroundColor: UIColor = UIColor.grayColor(), highlightedBackgroundColor: UIColor = UIColor.lightGrayColor(), cornerRadius: CGFloat = 4) -> DialogButton {
        let button: DialogButton = DialogButton()
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(textColor, forState: .Normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
        
        button.defaultBackgroundColor = backgroundColor
        button.highlightedBackgroundColor = backgroundColor
        
        self.addButton(button)
        
        return button
    }
    
    public func addButton(title: String, type: DialogButtonType) -> DialogButton {
        var textColor: UIColor?
        var backgroundColor: UIColor?
        var highlightedBackgroundColor: UIColor?
        
        switch (type) {
        case .Accept:
            textColor = UIColor.whiteColor()
            backgroundColor = UIColor.greenColor()
            highlightedBackgroundColor = UIColor.lightGrayColor()
            break
        case .Destruct:
            textColor = UIColor.whiteColor()
            backgroundColor = UIColor.redColor()
            highlightedBackgroundColor = UIColor.darkGrayColor()
            break
        case .Done:
            textColor = UIColor.whiteColor()
            backgroundColor = UIColor.grayColor()
            highlightedBackgroundColor = UIColor.darkGrayColor()
            break
        default:
            textColor = UIColor.whiteColor()
            backgroundColor = UIColor.lightGrayColor()
            highlightedBackgroundColor = UIColor.lightGrayColor()
            break
        }
        
        return self.addButton(title, textColor: textColor!, backgroundColor: backgroundColor!, highlightedBackgroundColor: highlightedBackgroundColor!)
    }
    
    // MARK: Layout
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        // MARK: Curtain
        self.curtainView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
    }
    
    // MARK: Creating elements
    
    private func label(text: String, var attributes: [String: AnyObject]?, bold: Bool = false) -> UILabel {
        let label: UILabel = UILabel()
        
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = .Justified
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString()
        if attributes == nil {
            attributes = [String: AnyObject]()
        }
        if attributes![NSFontAttributeName] == nil {
            attributes![NSFontAttributeName] = (bold ? UIFont.boldSystemFontOfSize(16) : UIFont.systemFontOfSize(16))
        }
        if attributes![NSForegroundColorAttributeName] == nil {
            attributes![NSForegroundColorAttributeName] = UIColor.whiteColor()
        }
        if attributes![NSBackgroundColorAttributeName] == nil {
            attributes![NSBackgroundColorAttributeName] = UIColor.clearColor()
        }
        attributedString.addAttributes(attributes!, range: NSRange(location: 0, length: text.characters.count))
        
        label.attributedText = attributedString
        
        return label
    }
    
    private func addCurtainView() {
        self.addSubview(self.curtainView)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "didTapCurtain:")
        self.curtainView.addGestureRecognizer(tap)
    }
    
    private func addCanvasView() {
        self.addSubview(self.canvasView)
    }
    
    private func addSubviews() {
        self.addCurtainView()
    }
    
    // MARK: Actions
    
    func didTapCurtain(sender: UITapGestureRecognizer) {
        if (self.tapOnCurtainClosesDialog) {
            self.hide(true)
        }
    }

    // MARK: Initialization
    
    convenience init() {
        self.init(frame:CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
        self.layoutSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
}


public class DialogCurtainView : UIView {
    
    // MARK: Initialization
    
    convenience init() {
        self.init(frame:CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
}


public class DialogButton : UIButton {
    
    var defaultBackgroundColor: UIColor?
    var highlightedBackgroundColor: UIColor?
    
}
