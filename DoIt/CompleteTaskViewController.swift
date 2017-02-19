//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by poppydoodle on 1/3/17.
//  Copyright © 2017 poppydoodle. All rights reserved.
//

//import Cocoa
import UIKit

@available(iOS 10.0, *)
class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    //var task = Task()
    var task : Task? = nil
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if task!.important {
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
        
    }
    
    
    @IBAction func completeTapped(_ sender: AnyObject) {
        //get data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //delete data
        context.delete(task!)
        //save data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //previousVC.tasks.remove(at: previousVC.selectedIndex)(dont need because of core data)
        //previousVC.tableView.reloadData()(dont need because of core data)
        navigationController!.popViewController(animated: true)
    }
    
}
