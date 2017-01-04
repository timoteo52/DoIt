//
//  TasksViewController.swift
//  DoIt
//
//  Created by poppydoodle on 1/2/17.
//  Copyright © 2017 poppydoodle. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //this needs to be before datasource/delegate
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    /* ...not needed for simple programs
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    */
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let task = tasks[indexPath.row]
        performSegueWithIdentifier("selectTaskSegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        let task2 = Task()
        task2.name = "Buy cheese"
        task2.important = true
        let task3 = Task()
        task3.name = "Mow the lawn"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(sender: AnyObject) {
        performSegueWithIdentifier("addSegue", sender: nil)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destinationViewController as! CreateTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destinationViewController as! CompleteTaskViewController
            nextVC.task = sender as! Task
            print("just did segue to completeTaskViewController")
            
        }
        
        
    }
}

