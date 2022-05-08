//
//  ViewController.swift
//  Solicitude
//
//  Created by Berliyantin Puspaningrum on 08/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var morningTableview:UITableView!
    
    var tasks = ["Mandi","Masak","Sarapan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        morningTableview.delegate = self
        morningTableview.dataSource = self
        self.morningTableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellMorning")
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMorning", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
