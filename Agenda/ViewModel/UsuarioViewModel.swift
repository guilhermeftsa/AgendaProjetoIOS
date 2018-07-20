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
    
    static func setHeadersParams(headers: [AnyHashable : Any]?) {
        
        guard let headers = headers, let user = uiRealm.objects(Usuario.self).first else {
            return
        }
        
        try! uiRealm.write {
            
            if let accessToken = headers["Access-Token"] as? String {
                user.accessToken = accessToken
            }
            if let client = headers["Client"] as? String {
                user.client = client
            }
            if let uid = headers["Uid"] as? String {
                user.uid = uid
            }
        }
    }
}
