//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Sergio Lozano Garza on 10/13/18.
//  Copyright © 2018 Sergio Lozano Garza. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    
    let realm = try! Realm()
    
    var categoryArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
    }
        //MARK: - Tableview Datasource methods
    
        
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return categoryArray.count
            
        }
        
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            
            let category = categoryArray[indexPath.row]
            
        cell.textLabel?.text = categoryArray[indexPath.row].name
            
            return cell
        }
        
        //MARK - TableView Delegate Methods
        
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(categoryArray[indexPath.row])
            
            performSegue(withIdentifier: "goToItems", sender: self)
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
        
        destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
        //MARK: - Datasource manipulation methods
    
    func save(categoty: Category){
        
        do {
            
            try realm.write{
                
                realm.add(categoty)
                
            }
            
        } catch {
            
            print("error saving context, \(error)")
            
        }
        
        self.tableView.reloadData()
        
    }
    
    func loadCategories(){

//        let request:NSFetchRequest<Category> = Category.fetchRequest()
//        do{
//            categoryArray = try context.fetch(request)
//        }catch{
//            print("error fetching:\(error)")
//        }
//        tableView.reloadData()
    }
    
    
    
        
        //MARK: - Add new categories
        


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            //Actions to happenwhen user taps Add Item on UIAlert
            
//           let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

           let newCategory = Category()
            newCategory.name = textField.text!
            
            self.categoryArray.append(newCategory)
            
            self.save(categoty: newCategory)
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
        tableView.reloadData()
        
    }
    
    
}
