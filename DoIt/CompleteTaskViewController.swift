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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        

        taskLabel.text! = task.name

        
    }
    

    @IBAction func completeTapped(sender: AnyObject) {
    }
    
}