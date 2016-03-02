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

    var toDoListItemsStringArray : NSMutableArray!
    var toDoListItemsIsCompletedArray : NSMutableArray!
    var toDoListItemsDateCompletedArray : NSMutableArray!
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListItemsStringArray = NSMutableArray()
        toDoListItemsIsCompletedArray = NSMutableArray()
        toDoListItemsDateCompletedArray = NSMutableArray()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoListCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        cell.toDoItemTextLabel.text = toDoListItemsStringArray.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        removeOldCompletedToDoListItems()
        return toDoListItemsStringArray.count
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoListItemsStringArray.removeObjectAtIndex(indexPath.row)
            toDoListItemsIsCompletedArray.removeObjectAtIndex(indexPath.row)
            toDoListItemsDateCompletedArray.removeObjectAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedTask = tableView.cellForRowAtIndexPath(indexPath)!
        if (selectedTask.accessoryType == UITableViewCellAccessoryType.Checkmark) {
            selectedTask.accessoryType = UITableViewCellAccessoryType.None
            toDoListItemsIsCompletedArray.replaceObjectAtIndex(indexPath.row, withObject: false)
        } else {
            selectedTask.accessoryType = UITableViewCellAccessoryType.Checkmark
            toDoListItemsIsCompletedArray.replaceObjectAtIndex(indexPath.row, withObject: true)
            toDoListItemsDateCompletedArray.replaceObjectAtIndex(indexPath.row, withObject: NSDate())
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? UINavigationController {
            let addTaskViewController = destinationViewController.viewControllers.first as! AddTaskViewController
            addTaskViewController.toDoListItemsStringArray = self.toDoListItemsStringArray
            addTaskViewController.toDoListItemsIsCompletedArray = self.toDoListItemsIsCompletedArray
            addTaskViewController.toDoListItemsDateCompletedArray = self.toDoListItemsDateCompletedArray

        } else {
            removeOldCompletedToDoListItems()
            let dailyStatsViewController = segue.destinationViewController as! DailyStatsViewController
            dailyStatsViewController.toDoListItemsIsCompletedArray = self.toDoListItemsIsCompletedArray
        }
    }
    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        
    }
    
    func removeOldCompletedToDoListItems() {
        let rightNow = NSDate()
        var count = toDoListItemsStringArray.count
        var index = 0
        while (index < count) {
            let checkIfCompleted = toDoListItemsIsCompletedArray.objectAtIndex(index) as! Bool
            let checkDateCompleted = toDoListItemsDateCompletedArray.objectAtIndex(index) as! NSDate
            if (checkIfCompleted && (rightNow.timeIntervalSinceDate(checkDateCompleted) > 60*60*24)) {
                toDoListItemsStringArray.removeObjectAtIndex(index)
                toDoListItemsIsCompletedArray.removeObjectAtIndex(index)
                toDoListItemsDateCompletedArray.removeObjectAtIndex(index)
                count--
            } else {
                index++
            }
        }
    }
}

