//
//  TasksViewController.swift
//  DoIt
//
//  Created by poppydoodle on 1/2/17.
//  Copyright © 2017 poppydoodle. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
 //   var selectedIndex = 0  (dont need because of core data)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //this needs to be before datasource/delegate
        // tasks = makeTasks()  - core data
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    /* ...not needed for simple programs
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }
     */
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //selectedIndex = indexPath.row (dont need because of core data)
        let task = tasks[indexPath.row]
        //print(task.name)
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    /*  needed didSelect, NOT didDeSelect UUUUUUUGGGGGGGGGHHHHHHHH!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
     let task = tasks[indexPath.row]
     print(task.name)
     performSegue(withIdentifier: "selectTaskSegue", sender: task)
     }
     */
    
    /* moving to core data
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
     }  */
    
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("oops fetch request error")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         if segue.identifier == "addSegue" {
         let nextVC = segue.destination as! CreateTaskViewController
         nextVC.previousVC = self
         
         }*/
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
            //nextVC.previousVC = self(dont need because of core data)
            //print("just did segue to completeTaskViewController")
            
        }
        
        
    }
}

