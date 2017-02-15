//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by poppydoodle on 1/2/17.
//  Copyright © 2017 poppydoodle. All rights reserved.
//

//import Cocoa
import UIKit


@available(iOS 10.0, *)
class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    // for array
    //var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: AnyObject) {
        
        //create a task from outlet's info
    /*  if #available(iOS 10.0, *) {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        } else {
            // Fallback on earlier versions
        }
     */

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //and add new task to array in previous view controller  (for array)
        
        //previousVC.tasks.append(task)
        //previousVC.tableView.reloadData()
        
        //pop back  (for core data)
        
        navigationController!.popViewController(animated: true)
        
        
    }
    
}
