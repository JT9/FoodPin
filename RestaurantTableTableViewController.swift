//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by C T on 10/14/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class RestaurantTableTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend","Homei", "Teakha", "Cafe Loisl", "Petite Oyster",
        "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate",
        "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf",
        "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg",
                            "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg",
                            "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg",
                            "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg",
                            "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg",
                            "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
        "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York",
        "New York", "New York", "New York", "New York",
        "London", "London", "London", "London"]
    
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    //Used to keep track of which restaurants were visted
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndentifier = "Cell"
        //Downcasting to RestaurantTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        //Check to see if restaurant is marked and update it
        if restaurantIsVisited[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        /*
            cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
         */

        return cell
    }
    
    
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        //Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //Add Call Action
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
            
        }
        
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
        //Option to check in and undo your check in
        let checkInTitle = restaurantIsVisited[indexPath.row] ? "Undo Check In" : "Check In"

            //? "Undo Check In" : "Check In"
        //Check-in action
        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            //cell?.accessoryType = .checkmark
            
            //Toggle check-in and undo-check-in
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
            
            //Used to keep track of which restaurants were checked due to bug of cell reuse
            self.restaurantIsVisited[indexPath.row] = true
        })
        
        optionMenu.addAction(checkInAction)
        
        tableView.deselectRow(at: indexPath, animated: false)
        //Display the menu
        present(optionMenu, animated: true, completion: nil)
        
        
    }
    */
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Social sharing button
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: { (action, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            //Display restaurant image when sharing to Twitter/Facebook
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        //Delete Button
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) -> Void in
            
            //Delete the row from the data source
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            
            //Another method to reload data in TableView
            tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        //Changes color of shareAction and deleteAction buttons
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    //Used to pass image to another ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! RestaurantDetailViewController
                destinationViewController.restaurantImage = restaurantImages[indexPath.row]
                destinationViewController.restaurantName = restaurantNames[indexPath.row]
                destinationViewController.restaurantType = restaurantTypes[indexPath.row]
                destinationViewController.restaurantLocation = restaurantLocations[indexPath.row]
            }
        }
    }
    
    
    
    /*
    //Used to delete row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the row from the data source
            restaurantNames.remove(at: indexPath.row)
            restaurantLocations.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
            
            //tableView.reloadData()
            
            //Another method to reload data in TableView
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            print("Total item: \(restaurantNames.count)")
            for name in restaurantNames {
                print(name)
            }
            
        }
    }
 */

}
