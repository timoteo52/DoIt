//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by poppydoodle on 1/3/17.
//  Copyright © 2017 poppydoodle. All rights reserved.
//

//import Cocoa
import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var task = Task()
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if task.important {
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name
        }
        
    }
    
    
    @IBAction func completeTapped(_ sender: AnyObject) {
        
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
}
