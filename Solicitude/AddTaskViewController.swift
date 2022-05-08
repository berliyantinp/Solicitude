//
//  AddTaskViewController.swift
//  Solicitude
//
//  Created by Berliyantin Puspaningrum on 08/05/22.
//

import UIKit

class AddTaskViewController: UIViewController {
    @IBOutlet weak var routineTitle: UITextField!
    @IBOutlet weak var routineNote: UITextField!
    @IBOutlet weak var routineURL: UITextField!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        routineTitle.becomeFirstResponder()
    }
    
    
    @IBAction func taskCancelled(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func taskAddedButton(_ sender: Any) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "morningStoryboardID") as! MainTableViewController
//
//        controller.tasks.append(routineTitle!.text ?? "Default Text")
//        controller.tableView.reloadData()
//
//        print(routineTitle.text!)
        
        
        if let text = routineTitle.text, !text.isEmpty, !routineNote.text!.isEmpty {
            completion?(text, routineNote.text!)
        }
        self.dismiss(animated: true)
    }
}
