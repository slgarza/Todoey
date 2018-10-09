//
//  ViewController.swift
//  Todoey
//
//  Created by Sergio Lozano Garza on 10/8/18.
//  Copyright © 2018 Sergio Lozano Garza. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
      let itemArray =  ["Find Akane","Beat Ryoga","Marry Akane","Sit on the Iron Throne"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
            }else{
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

