//
//  ContatosCell.swift
//  Agenda
//
//  Created by administrador on 20/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import Reusable
class ContatosTableViewCell: UITableViewCell, NibReusable {
    
    
    @IBOutlet weak var imagemUsuario: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var NomeUsuarioLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    
}

