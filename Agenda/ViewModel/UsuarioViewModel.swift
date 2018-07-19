//
//  UsuarioViewModel.swift
//  Agenda
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//
import UIKit
import Realm
import RealmSwift



 class UsuarioViewModel{
   
    
    static func save(usuario: Usuario){
        try! uiRealm.write{
            uiRealm.add(usuario, update: true)
        }
    }
    
    static func clear(){
        try! uiRealm.write{
            uiRealm.delete(uiRealm.objects(Usuario.self))
        }
    }
}
