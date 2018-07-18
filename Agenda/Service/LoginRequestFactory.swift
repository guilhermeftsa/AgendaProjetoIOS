//
//  LoginRequestFactory.swift
//  Agenda
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Alamofire

class loginRequestFactory{
    static func postLogin(email: String, senha: String)->DataRequest {
        let params: Parameters = ["email": email, "password": senha]
        
        return Alamofire.request(baseUrl + "auth/sign_in", method: .post, parameters: params, encoding: JSONEncoding.default)
        
        
    }
    
    
}
