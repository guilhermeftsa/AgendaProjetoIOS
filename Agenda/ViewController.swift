//
//  ViewController.swift
//  Agenda
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var senhaTF: UITextField!
    @IBOutlet weak var botaoEntrar: UIButton!
    @IBOutlet weak var botaoCadastro: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.botaoEntrar.layer.cornerRadius = self.botaoEntrar.frame.height / 2
        self.botaoCadastro.layer.cornerRadius = self.botaoEntrar.frame.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

