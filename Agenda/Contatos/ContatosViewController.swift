//
//  ContatosViewController.swift
//  Agenda
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ContatosViewController: UIViewController {
    
    @IBOutlet weak var TableView:UITableView!
    var contatos:[ContatoView] = []
    var service: ContatoService!
    
    override func viewDidLoad() {
        self.contatos = ContatosViewModel.get()
        super.viewDidLoad()
        self.service = ContatoService(delegate: self)
        self.title = L10n.Contatos.title
        self.service = ContatoService(delegate: self)
        self.service.getContatos()
        self.TableView?.dataSource = self
        self.TableView?.delegate = self
        
        self.TableView.register(cellType: ContatosTableViewCell.self)
        
    }
}

extension ContatosViewController: ContatoServiceDelegate{
    func getContatosSuccess() {
        for contato in ContatosViewModel.get(){
            self.contatos = ContatosViewModel.get()
            
            self.TableView.reloadData()
        }
    }
    
    func getContatosFailure(error: String) {
        
    }
}

extension ContatosViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contatos.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)-> CGFloat{
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ContatosTableViewCell
        cell.imagemUsuario = self.contatos[indexPath.row].foto
        cell.NomeUsuarioLabel.text = self.contatos[indexPath.row].nome
        return cell
    }
}


