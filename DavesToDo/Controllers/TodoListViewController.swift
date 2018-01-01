//
//  ViewController.swift
//  DavesToDo
//
//  Created by David Murphy on 12/31/17.
//  Copyright © 2017 David Murphy. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    // var b/c array must be a mutable variable
    var itemArray = [Item]()
    
    // Make object of UserDefaults class, which holds persistent data in key:value pairs
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Surf"
        itemArray.append(newItem)
        
//         When the app loads (i.e. after it was force-quit), load array from device's persistent data storage
        if let lastSavedList = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = lastSavedList
        }
    }

    //Mark - Tableview Datasource Methods
    // numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Ternary operator
        // value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        /* ^ IS THE SAME AS:
         if item.done == true {
            cell.accessoryType = .checkmark
         } else {
            cell.accessoryType = .none
         }
         */
        return cell
    }
    
    //MARK - TableView Delegate Methods
    // didSelectRow
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // turn on checkmark at end of each row
        // Toggle for checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
//        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
        @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
            
            var textField = UITextField()
            
            // Create popup with a header message
            let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
            
            // Create "add item" button at bottom of popup
            let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
                // what will happen once the user clicks the "Add Item" button on our UIAlert
                
                let newItem = Item()
                newItem.title = textField.text!
                
                self.itemArray.append(newItem)
                
                // Textfield will NEVER be nil; always either a string or an empty string, so safe to use '!'
//                self.itemArray.append(textField.text!)
                
                // SAVE persistent data; still need to LOAD data!
                self.defaults.set(self.itemArray, forKey: "TodoListArray")
                
                // reloads rows and sections of tableView, taking into account the new data. Needs to be done in the main thread.
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            // Create textfield inside of popup for the user to type into
            // ONLY gets triggered when the button is clicked
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "Create new item"
                textField = alertTextField
            }
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
    }
    
    
}

