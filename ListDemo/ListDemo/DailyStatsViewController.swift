//
//  DailyStatsViewController.swift
//  ListDemo
//
//  Created by Yejia Chen on 2/28/16.
//  Copyright © 2016 Yejia Chen. All rights reserved.
//

import UIKit

class DailyStatsViewController: UIViewController {
    
    @IBOutlet var numTasksCompletedLabel : UILabel!
    
    @IBOutlet var taskOrTasksGrammarLabel : UILabel!
    
    var toDoListItemsIsCompletedArray : NSMutableArray!
        
    var numTasksCompleted = 0
    
    override func viewWillAppear(animated: Bool) {
        countNumTasksCompleted()
        numTasksCompletedLabel.text = String(numTasksCompleted)
        if (numTasksCompleted == 1) {
            taskOrTasksGrammarLabel.text = "task in the last 24 hours."
        } else {
            taskOrTasksGrammarLabel.text = "tasks in the last 24 hours."
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countNumTasksCompleted() {
        numTasksCompleted = 0
        if (toDoListItemsIsCompletedArray.count > 0) {
            for index in 0...(toDoListItemsIsCompletedArray.count - 1) {
                if (toDoListItemsIsCompletedArray.objectAtIndex(index) as! Bool) {
                    numTasksCompleted++
                }
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
