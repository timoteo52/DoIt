//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by poppydoodle on 1/2/17.
//  Copyright © 2017 poppydoodle. All rights reserved.
//

//import Cocoa
import UIKit


class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: AnyObject) {
        
        //create a task from outlet's info
        
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        
        //and add new task to array in previous view controller
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
        
    }
    
}
