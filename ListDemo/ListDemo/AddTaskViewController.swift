//
//  ViewController.swift
//  ListDemo
//
//  Created by Yejia Chen on 2/25/16.
//  Copyright © 2016 Yejia Chen. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet var taskToAddInput : UITextField!
    
    var taskToAdd : String?
    
    var toDoListItemsStringArray : NSMutableArray?
    var toDoListItemsIsCompletedArray : NSMutableArray?
    var toDoListItemsDateCompletedArray : NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender as? UIBarButtonItem == saveButton) {
            taskToAdd = taskToAddInput.text
            
            if (!(taskToAdd ?? "").isEmpty) {
                let numTasks = toDoListItemsStringArray!.count
                toDoListItemsStringArray!.insertObject(taskToAdd!, atIndex: numTasks)
                toDoListItemsIsCompletedArray!.insertObject(false, atIndex: numTasks)
                toDoListItemsDateCompletedArray!.insertObject(NSDate(), atIndex: numTasks)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
