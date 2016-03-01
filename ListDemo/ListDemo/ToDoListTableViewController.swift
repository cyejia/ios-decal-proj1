//
//  ViewController.swift
//  ToDoList
//
//  Created by Yejia Chen on 2/25/16.
//  Copyright © 2016 Yejia Chen. All rights reserved.
//

import UIKit
import Foundation

class ToDoListTableViewController: UITableViewController {

    var toDoListItemsArray : NSMutableArray!
    var completedItemsArray : NSMutableArray!
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListItemsArray = NSMutableArray()
        completedItemsArray = NSMutableArray()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoListCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        cell.toDoItemTextLabel.text = toDoListItemsArray.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListItemsArray.count
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoListItemsArray.removeObjectAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let completedTask = tableView.cellForRowAtIndexPath(indexPath)!
        if (completedTask.accessoryType == UITableViewCellAccessoryType.Checkmark) {
            completedTask.accessoryType = UITableViewCellAccessoryType.None
        } else {
            completedTask.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 2 * Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
            if (completedTask.accessoryType == UITableViewCellAccessoryType.Checkmark) {
                completedTask.accessoryType = UITableViewCellAccessoryType.None
                self.toDoListItemsArray.removeObjectAtIndex(indexPath.row)
                self.completedItemsArray.addObject(NSDate())
                tableView.reloadData()
            }            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? UINavigationController {
            let addTaskViewController = destinationViewController.viewControllers.first as! AddTaskViewController
            addTaskViewController.toDoListItemsArray = self.toDoListItemsArray
        } else {
            let dailyStatsViewController = segue.destinationViewController as! DailyStatsViewController
            dailyStatsViewController.completedItemsArray = self.completedItemsArray
        }
    }
    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        
    }
}

