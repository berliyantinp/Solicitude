//
//  MainTableViewController.swift
//  Solicitude
//
//  Created by Berliyantin Puspaningrum on 08/05/22.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var tasks: [(title: String, note: String)] = [(title: "Mandi", note: "Testing")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MorningCell")
        tableView.dataSource = self
        tableView.delegate = self

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MorningCell", for: indexPath)
        
        let taskItem = tasks[indexPath.row].title
        cell.textLabel?.text = taskItem
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    @IBAction func didAddTask(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailAddTask") as? AddTaskViewController else {
            return
        }
        
        vc.completion = { routineTitle, note in self.tasks.append((title: routineTitle, note: note))
            self.tableView.reloadData()
        }
        self.tableView.reloadData()
        
        
    }
    
    
}
