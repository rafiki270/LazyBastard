//
//  VotingView.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 11/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class VotingView : BasicView {
    
    let downVoteButton: UIButton = UIButton()
    let upVoteButton: UIButton = UIButton()
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        // Down vote button
        downVoteButton.snp_makeConstraints { (make) -> Void in
            make.top.left.bottom.equalTo(self)
            make.width.equalTo(180)
        }
        
        // Up vote button
        upVoteButton.snp_makeConstraints { (make) -> Void in
            make.top.right.bottom.equalTo(self)
            make.width.equalTo(180)
        }
    }
    
    // MARK: Creating elements
    
    private func configureBackground() {
        self.backgroundColor = Theme.votingBackgroundColor()
    }
    
    private func createDownVoteButton() {
        downVoteButton.titleLabel?.font = Theme.appBoldFontWithSize(14)
        downVoteButton.setTitleColor(Theme.votingDownVoteColor(), forState: UIControlState.Normal)
        downVoteButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        downVoteButton.setTitle(NSLocalizedString("Just procrastinated!", comment: "Down-vote text"), forState: UIControlState.Normal)
        
        self.addSubview(downVoteButton)
    }
    
    private func createUpVoteButton() {
        upVoteButton.titleLabel?.font = Theme.appBoldFontWithSize(14)
        upVoteButton.setTitleColor(Theme.votingUpVoteColor(), forState: UIControlState.Normal)
        upVoteButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        upVoteButton.setTitle(NSLocalizedString("Deed is done!", comment: "Up-vote text"), forState: UIControlState.Normal)
        
        self.addSubview(upVoteButton)
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureBackground()
        self.createDownVoteButton()
        self.createUpVoteButton()
    }
    
    
}