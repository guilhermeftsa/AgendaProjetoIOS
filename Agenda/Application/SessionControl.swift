//
//  SessionControl.swift
//  Agenda
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
var header: [String:String] = [:]

class SessionControl{
    static var isSessionActive: Bool{
        if let _ = uiRealm.objects(Usuario.self).first{
            return true
        }
        return false
    }
    
    static func setHeadersParams (headers: [AnyHashable: Any]? = nil){
        header = [:]
    
        guard let headers = headers else{
            
            if let user = uiRealm.objects(Usuario.self).first{
                
                if let accessToken = user.accessToken{
                    header["Access-Token"] = accessToken
                }
                if let client = user.client{
                    header["Client"] = client
                }
                if let uid = user.uid{
                    header["Uid"] = uid
                }
            }
            return
        }
        UsuarioViewModel.setHeadersParams (headers: headers)
        
        if let accessToken = headers["Access-Token"] as? String{
            header["Access-Token"] = accessToken
        }
        if let client = headers["Client"] as? String{
            header["Client"] = client
        }
        if let uid = headers["Uid"] as? String{
            header["Uid"] = uid
        }
    
     
    
    
}
}
