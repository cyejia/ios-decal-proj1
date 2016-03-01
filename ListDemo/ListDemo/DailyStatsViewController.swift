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
    
    var completedItemsArray : NSMutableArray!
    
    var numTasksCompleted = 0
    
    override func viewWillAppear(animated: Bool) {
        updateNumTasksCompleted()
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
    
    func updateNumTasksCompleted() {
        var count = completedItemsArray.count
        if (count > 0) {
            let curTime = NSDate()
            var checkIfOver24Hours = completedItemsArray.objectAtIndex(0) as! NSDate
            while (curTime.timeIntervalSinceDate(checkIfOver24Hours) > 60*60*24 && count > 0) {
                completedItemsArray.removeObjectAtIndex(0)
                checkIfOver24Hours = completedItemsArray.objectAtIndex(0) as! NSDate
                count -= 1
            }
        }
        
        numTasksCompleted = completedItemsArray.count
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
