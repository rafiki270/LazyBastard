//
//  LABHomeViewController.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 11/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit
import SnapKit


class LABHomeViewController: LABBasicViewController, UITableViewDelegate {
    
    let statsView: LABStatsView = LABStatsView()
    let votingView: LABVotingView = LABVotingView()
    let tasksTableView: UITableView = UITableView()
    let dataSource: LABTasksDataSource = LABTasksDataSource()
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Stats view
        statsView.snp_makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(240)
        }
        
        // Voting view
        votingView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(statsView.snp_bottom)
            make.left.right.equalTo(self.view)
            make.height.equalTo(80)
        }
        
        // Table view
        tasksTableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(votingView.snp_bottom)
            make.left.right.bottom.equalTo(self.view)
        }
    }
    
    // MARK: Creating elements
    
    private func configureStatsView() {
        self.view.addSubview(statsView)
    }
    
    private func configureVotingView() {
        votingView.upVoteButton.addTarget(self, action: "upVoteAction:", forControlEvents: UIControlEvents.TouchUpInside)
        votingView.downVoteButton.addTarget(self, action: "downVoteAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(votingView)
    }
    
    private func configureTableView() {
        tasksTableView.registerClass(LABTaskTableViewCell.self, forCellReuseIdentifier: LABTasksDataSourceTaskCellIdentifier)
        tasksTableView.registerClass(LABAddTaskTableViewCell.self, forCellReuseIdentifier: LABTasksDataSourceAddTaskCellIdentifier)
        tasksTableView.dataSource = dataSource
        tasksTableView.delegate = self
        
        self.view.addSubview(tasksTableView)
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureStatsView()
        self.configureVotingView()
        self.configureTableView()
    }
    
    // MARK: Actions
    
    private func reloadData() {
        dataSource.reloadData()
        tasksTableView.reloadData()
    }
    
    func upVoteAction(sender: UIButton) {
        LABCoreData.newEvent(1)
        LABCoreData.saveContext()
    }
    
    func downVoteAction(sender: UIButton) {
        LABCoreData.newEvent(-1)
        LABCoreData.saveContext()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.reloadData()
    }
    
    // MARK: Memory management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Table view delegate methods
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if dataSource.isTaskPath(indexPath) {
            
        }
        else {
            LABCoreData.newTask("Lorem ipsum dolor sit amet pyco woe! My new CoreData task no.: " + String(indexPath.row), points: 1, when: NSDate.init())
            LABCoreData.saveContext()
            self.reloadData()
            
            let lastItem: NSIndexPath = NSIndexPath(forRow: (indexPath.row + 1), inSection: indexPath.section)
            
            tableView.scrollToRowAtIndexPath(lastItem, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        }
    }

}

