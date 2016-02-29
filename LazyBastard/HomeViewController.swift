//
//  HomeViewController.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 11/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit
import SnapKit


class HomeViewController: BasicViewController, UITableViewDelegate {
    
    let bottomBackground: UIView = UIView()
    
    let tasksTableView: TasksTableView = TasksTableView()
    let dataSource: TasksDataSource = TasksDataSource()
    

    let votingView: VotingView = VotingView()

    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Bottom background
        bottomBackground.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_centerY)
            make.left.bottom.right.equalTo(self.view)
        }
        
        // Table view
        tasksTableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view)
            make.left.right.bottom.equalTo(self.view)
        }
    }
    
    // MARK: Creating elements
    
    private func configureBottomBcg() {
        self.bottomBackground.backgroundColor = Theme.addTaskBackgroundColor()
        self.view.addSubview(bottomBackground)
    }
    
    private func configureVotingView() {
        self.votingView.upVoteButton.addTarget(self, action: "upVoteAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.votingView.downVoteButton.addTarget(self, action: "downVoteAction:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    private func configureTableView() {
        self.tasksTableView.dataSource = self.dataSource
        self.tasksTableView.delegate = self
        
        self.view.addSubview(tasksTableView)
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.configureBottomBcg()
        self.configureVotingView()
        self.configureTableView()
    }
    
    // MARK: Actions
    
    private func reloadData() {
        self.dataSource.reloadData()
        self.tasksTableView.reloadData()
    }
    
    func upVoteAction(sender: UIButton) {
        CoreData.newEvent(1)
        CoreData.saveContext()
    }
    
    func downVoteAction(sender: UIButton) {
        CoreData.newEvent(-1)
        CoreData.saveContext()
    }
    
    func userDidTask(sender: DialogButton) {
        let task: LABTask = sender.dialogView.object as! LABTask
        task.done = true
        
        let event: LABEvent = CoreData.newEvent(task.points)
        task.addEventsObject(event)
        event.task = task
        
        CoreData.saveContext()
        
        sender.dialogView.hide(true)
    }
    
    func userProcrastinated(sender: DialogButton) {
        let task: LABTask = sender.dialogView.object as! LABTask
        task.done = false
        
        let event: LABEvent = CoreData.newEvent((task.points * -1))
        task.addEventsObject(event)
        event.task = task
        
        CoreData.saveContext()
        
        sender.dialogView.hide(true)
    }
    
    func cancel(sender: DialogButton) {
        sender.dialogView.hide(true)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Move this to it's own theme
        self.view.backgroundColor = UIColor(CGColor: Theme.statsGradientColors().last!)
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
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 1) ? 80 : 0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return (section == 1) ? self.votingView : nil
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (indexPath.section == 0) ? 240 : 120
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 0 {
            
        }
        else {
            if dataSource.isTaskPath(indexPath) {
                let task: LABTask = self.dataSource.data![indexPath.row]
                
                let alert: DialogView = DialogView()
                
                var attr: [String: AnyObject] = [String: AnyObject]();
                attr[NSFontAttributeName] = Theme.appBoldFontWithSize(16)
                alert.setTitle(NSLocalizedString("ProcrastiTask!", comment: "Name of the procrastination task alert window"), attributes: attr)
                
                attr[NSFontAttributeName] = Theme.appFontWithSize(14)
                alert.setMessage(task.task!, attributes: attr)
                
                var button: DialogButton = alert.addButton(NSLocalizedString("I've done this!", comment: "Button title for accepted task"), type: .Accept)
                button.addTarget(self, action: "userDidTask:", forControlEvents: .TouchUpInside)
                button.titleLabel?.font = Theme.appBoldFontWithSize(14)
                
                button = alert.addButton(NSLocalizedString("Procrastinate!", comment: "Button title for passing on a task"), type: .Destruct)
                button.addTarget(self, action: "userProcrastinated:", forControlEvents: .TouchUpInside)
                button.titleLabel?.font = Theme.appBoldFontWithSize(14)
                
                button = alert.addButton(NSLocalizedString("Cancel", comment: "Cancel"), type: .Done)
                button.addTarget(self, action: "cancel:", forControlEvents: .TouchUpInside)
                button.titleLabel?.font = Theme.appBoldFontWithSize(14)
                
                alert.object = task
                
                alert.showInController(self)
            }
            else {
                CoreData.newTask("Lorem ipsum dolor sit amet pyco woe v2! My new CoreData task no.: " + String(indexPath.row), points: 1, when: NSDate.init())
                CoreData.saveContext()
                self.reloadData()
                
                let lastItem: NSIndexPath = NSIndexPath(forRow: (indexPath.row + 1), inSection: indexPath.section)
                
                tableView.scrollToRowAtIndexPath(lastItem, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
            }
        }
    }

}

