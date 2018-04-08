//
//  AtendimentosViewController.swift
//  Movi
//
//  Created by Filipe Marques on 08/04/18.
//  Copyright © 2018 Filipe Marques. All rights reserved.
//

import UIKit

class AtendimentosViewController: UIViewController {

    @IBOutlet weak var sugestoesButton: UIButton!
    @IBOutlet weak var reclamacoesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sugestoesButton.clipsToBounds = true
        self.sugestoesButton.layer.cornerRadius = CGFloat(10)
        self.reclamacoesButton.layer.cornerRadius = CGFloat(10)
        self.reclamacoesButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController!.navigationBar.setBackgroundImage(nil, for: .compact)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {

    }

}
