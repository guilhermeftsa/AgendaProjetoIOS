//
//  LoginService.swift
//  Agenda
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper

class LoginService{
    
    func postlogin(email:String, senha: String){
        loginRequestFactory.postLogin(email: email, senha: senha).validate().responseObject(keyPath: "data"){            (response: DataResponse<Usuario>) in
            
            switch response.result{
            case .success:
                
                if let user = response.result.value{
                    print("Email \(user.email ?? "") com id \(user.id ?? 0)")
                    
                    response.response?.allHeaderFields
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
