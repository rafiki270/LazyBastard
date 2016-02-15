//
//  LABVotingView.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 11/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class LABVotingView : LABView {
    
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
        self.backgroundColor = LABTheme.votingBackgroundColor()
    }
    
    private func createDownVoteButton() {
        downVoteButton.titleLabel?.font = LABTheme.appBoldFontWithSize(14)
        downVoteButton.setTitleColor(LABTheme.votingDownVoteColor(), forState: UIControlState.Normal)
        downVoteButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        downVoteButton.setTitle(NSLocalizedString("Didn't do it :(", comment: "Down-vote text"), forState: UIControlState.Normal)
        
        self.addSubview(downVoteButton)
    }
    
    private func createUpVoteButton() {
        upVoteButton.titleLabel?.font = LABTheme.appBoldFontWithSize(14)
        upVoteButton.setTitleColor(LABTheme.votingUpVoteColor(), forState: UIControlState.Normal)
        upVoteButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        upVoteButton.setTitle(NSLocalizedString("Just did it! :)", comment: "Up-vote text"), forState: UIControlState.Normal)
        
        self.addSubview(upVoteButton)
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureBackground()
        self.createDownVoteButton()
        self.createUpVoteButton()
    }
    
    
}