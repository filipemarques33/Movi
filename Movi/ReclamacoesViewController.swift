//
//  ReclamacoesViewController.swift
//  Movi
//
//  Created by Mauricio Lorenzetti on 08/04/18.
//  Copyright © 2018 Filipe Marques. All rights reserved.
//

import UIKit

class ReclamacoesViewController: UIViewController {
    
    let reclamacoesText = [
        "Sistema de Ônibus",
        "Sinalização de Vias",
        "PAI: Vans Acessíveis",
        "Credencial do Idoso",
        "Infrações",
        "Trânsito"
    ]
    
    var tableView: UITableView?
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        containerView.backgroundColor = UIColor.clear
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        containerView.layer.shadowOpacity = 0.7
        containerView.layer.shadowRadius = 2
        
        tableView = UITableView(frame: containerView.bounds, style: .plain)
        tableView!.layer.cornerRadius = 10
        tableView!.layer.masksToBounds = true
        tableView!.dataSource = self
        tableView!.delegate = self
        self.view.addSubview(containerView)
        containerView.addSubview(self.tableView!)
        
        tableView!.isScrollEnabled = false
        tableView!.register(UINib(nibName: "AtendimentoTableViewCell", bundle: nil), forCellReuseIdentifier: "atendimento_cell")
        
        //adding constraints
        containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let image = UIImage(named: "Card_Reclamacao")
        self.navigationController!.navigationBar.setBackgroundImage(image, for: .default)
        self.navigationController!.navigationBar.setBackgroundImage(image, for: .compact)
        
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ReclamacoesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "atendimento_cell", for: indexPath) as! AtendimentoTableViewCell
        
        cell.label.text = reclamacoesText[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reclamacoesText.count
    }
    
}
