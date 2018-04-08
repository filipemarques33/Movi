//
//  LinhasTableViewController.swift
//  Movi
//
//  Created by Filipe Marques on 08/04/18.
//  Copyright © 2018 Filipe Marques. All rights reserved.
//

import UIKit

class LinhasTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return User.lines.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let line = User.lines[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)

        cell.textLabel?.text = line.number
        cell.detailTextLabel?.text = line.terminals
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }

}
