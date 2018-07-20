//
//  ViewController.swift
//  Agenda
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var service:LoginService!
    
    //MARK: - UI Elements
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var senhaTF: UITextField!
    
    @IBOutlet weak var botaoEntrar: UIButton!
   
    
    //MARK: - Life
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        self.service = LoginService(delegate: self)
        self.botaoEntrar.layer.cornerRadius = self.botaoEntrar.frame.height / 2
        
    }
    
    @IBAction func logar(_ sender: UIButton) {
        if let email = self.emailTF.text, let senha = self.senhaTF.text{
            self.service.postlogin(email: email, senha: senha)
        }
    }
  
}

extension ViewController : LoginServiceDelegate{
    func postLoginFailure(error: String) {
        print (error)
    }
    func postLoginSuccess() {
        self.perform(segue: StoryboardSegue.Main.segueEntrar)
    }
}
