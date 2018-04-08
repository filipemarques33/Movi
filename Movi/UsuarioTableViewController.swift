//
//  UsuarioTableViewController.swift
//  Movi
//
//  Created by Filipe Marques on 08/04/18.
//  Copyright © 2018 Filipe Marques. All rights reserved.
//

import UIKit

class UsuarioTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return 1
        } else if section == 1 {
            return 4
        } else {
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
            
            cell.userName.text = User.userName
            return cell

        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "segueCell", for: indexPath)
            cell.textLabel?.textColor = UIColor.red
            cell.textLabel?.text = "Log Out"
            
            return cell
            
        } else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "segueCell", for: indexPath)
                cell.textLabel?.text = "Linhas favoritas"
                cell.accessoryType = .disclosureIndicator
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
                cell.textLabel?.text = "Endereço"
                cell.detailTextLabel?.text = User.address
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
                cell.textLabel?.text = "E-mail"
                cell.detailTextLabel?.text = User.email
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
                cell.textLabel?.text = "Telefone"
                cell.detailTextLabel?.text = User.phoneNumber
                return cell
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 77
        } else if indexPath.section == 1 {
            return 59
        } else {
            return 44
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            self.performSegue(withIdentifier: "segueToLinhas", sender: self)
        }
    }

}
