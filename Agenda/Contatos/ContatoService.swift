//
//  ContatoService.swift
//  Agenda
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Realm
import RealmSwift

protocol ContatoServiceDelegate{
    func getContatosSuccess()
    func getContatosFailure(error: String)
    
}

class ContatoService{
    
   var delegate:ContatoServiceDelegate
    
    required init (delegate:ContatoServiceDelegate){
        self.delegate = delegate
    }
    
    func getContatos(){
        
        ContatoRequestFactory.getContatos().validate().responseArray { (response: DataResponse<[Contato]>) in
            
            switch response.result {
                
            case .success:
                
                if let contatos = response.result.value {
                    
                    ContatosViewModel.clear()
                    
                    ContatosViewModel.save(contatos: contatos)
                }
                
                self.delegate.getContatosSuccess()
                
            case .failure(let error):
                
                self.delegate.getContatosFailure(error: error.localizedDescription)
            }
        }
    }
}
