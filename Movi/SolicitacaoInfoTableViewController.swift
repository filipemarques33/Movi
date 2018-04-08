//
//  SolicitacaoInfoTableViewController.swift
//  Movi
//
//  Created by Filipe Marques on 08/04/18.
//  Copyright © 2018 Filipe Marques. All rights reserved.
//

import UIKit

class SolicitacaoInfoTableViewController: UITableViewController {

    var solicitacao:Solicitacao!
    
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
        switch solicitacao.tipo {
        case TipoSolicitacao.complete, TipoSolicitacao.short:
            return 3
        case TipoSolicitacao.textBox:
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 2 {
            return 1
        } else {
            switch solicitacao.tipo {
            case TipoSolicitacao.complete:
                return 5
            case TipoSolicitacao.short:
                return 2
            case TipoSolicitacao.textBox:
                return 1
            }
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "historicoCell", for: indexPath) as! HistoricoCell
            cell.cellTitle.text = solicitacao.categoria
            cell.cellDescription.text = solicitacao.statusDesc
            
            cell.accessoryType = .none
            
            switch solicitacao.status {
            case StatusSolicitacao.solved:
                cell.cellStatusView.backgroundColor = UIColor.green
            case StatusSolicitacao.inProgress:
                cell.cellStatusView.backgroundColor = UIColor.yellow
            case StatusSolicitacao.denied:
                cell.cellStatusView.backgroundColor = UIColor.red
            }
            
            cell.cellStatusView.layer.cornerRadius = cell.cellStatusView.frame.height/2
            
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
            cell.textLabel?.text = solicitacao.informacoes
            return cell
        } else {
            switch solicitacao.tipo {
            case TipoSolicitacao.complete:
                let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
                
                if indexPath.row == 0 {
                    cell.textLabel?.text = solicitacao.protocolo
                    cell.detailTextLabel?.text = "Protocolo"
                } else if indexPath.row == 1 {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
                    
                    cell.textLabel?.text = dateFormatter.string(from: solicitacao.data!)
                    
                    cell.detailTextLabel?.text = "Data e Hora"
                } else if indexPath.row == 2 {
                    cell.textLabel?.text = solicitacao.linha
                    cell.detailTextLabel?.text = "Linha"
                } else if indexPath.row == 3 {
                    cell.textLabel?.text = solicitacao.prefixo
                    cell.detailTextLabel?.text = "Prefixo"
                } else if indexPath.row == 4 {
                    cell.textLabel?.text = solicitacao.local
                    cell.detailTextLabel?.text = "Local"
                }
                return cell
            case TipoSolicitacao.short:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
                
                if indexPath.row == 0 {
                    cell.textLabel?.text = solicitacao.protocolo
                    cell.detailTextLabel?.text = "Protocolo"
                } else if indexPath.row == 1 {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy"
                    
                    cell.textLabel?.text = dateFormatter.string(from: solicitacao.data!)
                    
                    cell.detailTextLabel?.text = "Data e Hora"
                }
                return cell
            case TipoSolicitacao.textBox:
                let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
                cell.textLabel?.text = solicitacao.informacoes
                return cell
            default:
                return UITableViewCell()
            }
        }
    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
